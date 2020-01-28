/**
 * Copyright 2019 Willem Hillier, UVM AERO
 * 
 * Right dash PCB code.
 *  - Reports button and knob state changes over CANbus
 *  - Reads certain CANbus messages to set LEDs
 *  - Acquires data for DAQ system from front wheels
 * 
 * Wheel speed code written by Cullen Jemison:
 * https://github.com/uvmaero/aero-daq-firmware/blob/master/daq-board/src/daq_board.c
 */


#include <Arduino.h>
#include <mcp_can.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <util/twi.h>
#include <avr/sfr_defs.h>
#include <avr/wdt.h>

#define DEBUG

// "Send" CANbus address defines
// CANbus bootloader IDs
#define ID_BASE               0x6A
#define ID_RESET              ID_BASE
#define ID_PROG_SELECT        ID_BASE + 1
#define ID_PROG_WRITE         ID_BASE + 2
#define ID_PROG_DONE          ID_BASE + 3
#define ID_PROG_ERROR         ID_BASE + 4

#define ID_START              ID_BASE + 5
#define ID_COOLING_MODE       ID_BASE + 6
#define ID_REGEN_VALS         ID_BASE + 7
#define ID_DASH_SELF_TEST     ID_BASE + 8
#define ID_DAQ_DATA           0x1C

// "Receive" CANbus address defines
#define ID_RINEHART_TEMPS1    0xA0
#define ID_RINEHART_TEMPS2    0xA1
#define ID_RINEHART_TEMPS3    0xA2

#define ID_EMUS_BASE          0x2A7
#define ID_EMUS_TEMPS         ID_EMUS_BASE + 2

#define ID_FAULTLATCHER_FAULTS 0x79
#define ID_PEDALBOARD_STATE_STATUS //TODO: light up RTD button led based on this

// Pin defines
#define PIN_RTD_INDICATOR     8
#define PIN_RTD_BTN           9
#define PIN_SPI_CAN_CS        10
#define PIN_LED1              20
#define PIN_LED2              21
#define PIN_POT_COAST         14
#define PIN_POT_BRAKE         15
#define PIN_DAMPER_RIGHT      16
#define PIN_DAMPER_LEFT       17
#define PIN_COOLING_MODE_1    18
#define PIN_COOLING_MODE_2    19
#define PIN_WHEEL_SPEED_RIGHT 2
#define PIN_WHEEL_SPEED_LEFT  3
#define PIN_LED_OE            4
#define PIN_LED_LE            5
#define PIN_LED_CLK           6
#define PIN_LED_SDI           7
#define PIN_NTC1              A7

// "Pin" of LEDs driven by STP16CP05
#define EXTPIN_FAULT_BMS_1   2
#define EXTPIN_FAULT_GFD_2   0
#define EXTPIN_FAULT_TMS_3   1
#define EXTPIN_COOLING_IND1R 3
#define EXTPIN_COOLING_IND1B 4
#define EXTPIN_COOLING_IND1G 5
#define EXTPIN_COOLING_IND2R 6
#define EXTPIN_COOLING_IND2B 7
#define EXTPIN_COOLING_IND2G 8
#define EXTPIN_COOLING_IND3R 9
#define EXTPIN_COOLING_IND3B 10
#define EXTPIN_COOLING_IND3G 11
#define EXTPIN_COOLING_IND4R 12
#define EXTPIN_COOLING_IND4B 13
#define EXTPIN_COOLING_IND4G 14
#define EXTPIN_RTD_BTN_LED   15

// Cooling LEDs color map range
#define RMS_COOLING_IND_PURPLE_TEMP_C 20
#define RMS_COOLING_IND_RED_TEMP_C    80
#define BMS_COOLING_IND_PURPLE_TEMP_C 20
#define BMS_COOLING_IND_RED_TEMP_C    80
#define MTR_COOLING_IND_PURPLE_TEMP_C 20
#define MTR_COOLING_IND_RED_TEMP_C    80

// wheel speed sensor constants
#define WHEEL_SPEED_PULSES_PER_REV        1
#define WHEEL_SPEED_SAMPLE_RATE           8000  // sampling rate (Hz). Slightly faster than Nyquist for wheel speed sensing
#define WHEEL_SPEED_SENSE_CIRCUMFERENCE   31415 // in mils (thousandths of an inch)
#define WHEEL_SPEED_DIST_PER_PULSE        WHEEL_SPEED_SENSE_CIRCUMFERENCE / WHEEL_SPEED_PULSES_PER_REV
#define WHEEL_SPEED_DEBOUNCE              10    // number of samples used for debouncing
#define MILS_PER_SECOND_TO_MILES_PER_HOUR 17600

// Assorted other defines
#define NUM_DAMPER_ADC_SAMPLES         10
#define DAMPER_ADC_SAMPLES_DELAY_US    5
#define STP16CP05_DELAY_US             1  // delay b/w consecutive bit-bang operations
#define DAQ_CAN_INTERVAL_MS            100
#define COOLING_STATUS_CAN_INTERVAL_MS 500

#define SELFTEST_DELAY_US              50000
#define SELFTEST_POT_WORKING_THRESHOLD 50

// wheel speed calculation variables
uint16_t wsl_samples_since_last = 0, wsr_samples_since_last = 0;
uint16_t wsl_debounce_samples = 0, wsr_debounce_samples = 0;
bool wsl_detected = false, wsr_detected = false;
uint8_t wheel_speed_left, wheel_speed_right;
uint8_t sample_accumulator = 0;

long lastSendDaqMessage = 0;
long lastSendCoolingStatus = 0;

// damper position
uint16_t damper_left=0,damper_right=0;

// STP16CP05 data "register"
uint16_t ext_leds = 0;

int16_t RMCTemps[11];       //Motor controller temps, equivilent to the following:
/*
  int RMCTempA     = 0;  //IGBT phase A
  int RMCTempB     = 0;  //IGBT phase B
  int RMCTempC     = 0;  //IGBT phase C
  int RMCTempGDB   = 0;  //gate driver board
  int RMCTempCB    = 0;  //control board
  int RMCTempRTD1  = 0;  //RTD input 1
  int RMCTempRTD2  = 0;  //RTD input 2
  int RMCTempRTD3  = 0;  //RTD input 3
  int RMCTempRTD4  = 0;  //RTD input 4
  int RMCTempRTD5  = 0;  //RTD input 5
  int RMCTempMotor = 0;  //filtered temp value from motor temp sensor
*/

MCP_CAN CAN(PIN_SPI_CAN_CS);     // Set CS pin

// Function to set state of LEDs driven by STP16CP05
void setExtLED(int ledNum, bool state){

  // set up data to send; set ledNum-th bit of ext_leds to state
  ext_leds = (ext_leds & (~(1 << ledNum))) | (state << ledNum);

  // send data bit-by-bit
  for(int n=15; n>=0;n--){
    digitalWrite(PIN_LED_CLK, LOW);
    delayMicroseconds(STP16CP05_DELAY_US);
    digitalWrite(PIN_LED_SDI, ((ext_leds >> n) & 1));
    delayMicroseconds(STP16CP05_DELAY_US);
    digitalWrite(PIN_LED_CLK, HIGH);
    delayMicroseconds(STP16CP05_DELAY_US);
  }

  // clear latched data
  digitalWrite(PIN_LED_LE, HIGH);
  delayMicroseconds(STP16CP05_DELAY_US);
  digitalWrite(PIN_LED_LE, LOW);

  // output enable
  digitalWrite(PIN_LED_OE, LOW);
}

// Self-test routine. Run through every piece of hardware to ensure it works
void dashSelfTest(){
  // turn off interrupts
  cli();

  // turn on everything
  digitalWrite(PIN_RTD_INDICATOR, HIGH);
  for(int i=0; i<16;i++){
    setExtLED(i,HIGH);
  }

  delayMicroseconds(SELFTEST_DELAY_US);

  // turn off everything
  digitalWrite(PIN_RTD_INDICATOR, LOW);
  for(int i=0; i<16;i++){
    setExtLED(i,LOW);
  }

  // test hardware one-by-one
  // external LEDs
  for(int i=0; i<16;i++){
    setExtLED(i,HIGH);
    delay(SELFTEST_DELAY_US);
    setExtLED(i,LOW);
  }

  digitalWrite(PIN_RTD_INDICATOR, HIGH);
  delay(SELFTEST_DELAY_US);
  digitalWrite(PIN_RTD_INDICATOR, LOW);

  // test for buttons etc
  bool coastKnobIsWorking = false, brakeKnobIsWorking = false, coolingModeSwitchUpIsWorking = false, coolingModeSwitchDownIsWorking = false, rtdButtonIsWorking = false;

  uint8_t coastKnobInitialValue = analogRead(PIN_POT_COAST);
  uint8_t brakeKnobInitialValue = analogRead(PIN_POT_BRAKE);
  bool coolingModeUpInitialValue = digitalRead(PIN_COOLING_MODE_1);
  bool CoolingModeDownInitialValue = digitalRead(PIN_COOLING_MODE_2);
  // only can continue if all knobs have been rotated and different values read + all buttons/switches have toggled states
  while(!coastKnobIsWorking and !brakeKnobIsWorking and !coolingModeSwitchUpIsWorking and !rtdButtonIsWorking){
    if(!digitalRead(PIN_RTD_BTN)){
      rtdButtonIsWorking = !digitalRead(PIN_RTD_BTN);
    }

    if(abs(coastKnobInitialValue-analogRead(PIN_POT_COAST)) > SELFTEST_POT_WORKING_THRESHOLD){
      coastKnobIsWorking = true;
    }

    if(abs(brakeKnobInitialValue-analogRead(PIN_POT_BRAKE)) > SELFTEST_POT_WORKING_THRESHOLD){
      brakeKnobIsWorking = true;
    }

    if(coolingModeUpInitialValue != digitalRead(PIN_COOLING_MODE_1)){
      coolingModeSwitchUpIsWorking = true;
    }

    if(CoolingModeDownInitialValue != digitalRead(PIN_COOLING_MODE_2)){
      coolingModeSwitchDownIsWorking = true;
    }

  }
  sei();
}

void filterCan(unsigned long canId, unsigned char buf[8]) {
  switch (canId) {
    case ID_FAULTLATCHER_FAULTS:
      setExtLED(EXTPIN_FAULT_BMS_1, (buf[0] >> 0) & 1); /// BMS fault is 0th bit of buf[0]
      setExtLED(EXTPIN_FAULT_TMS_3, ((buf[0] >> 1) & 1) || ((buf[0] >> 2) & 1)); // TMS faults are 1st and 2nd bits of buf[0]
      setExtLED(EXTPIN_FAULT_GFD_2, (buf[0] >> 3) & 3);
      break;
    case ID_RINEHART_TEMPS1:{
      for (int i = 0; i < 4; i++) {
        RMCTemps[i] = ((buf[2 * i + 1] << 8) | buf[2 * i]); //Place temps into RMCTemps
      }
      break;
    }
    case ID_RINEHART_TEMPS2:{
      for (int i = 0; i < 4; i++) {
        RMCTemps[i + 4] = ((buf[2 * i + 1] << 8) | buf[2 * i]);  //Place temps into RMCTemps
      }
      break;
    }
    case ID_RINEHART_TEMPS3:{
      for (int i = 0; i < 3; i++) {
        RMCTemps[i + 8] = ((buf[2 * i + 1] << 8) | buf[2 * i]);  //Place temps into RMCTemps
      }
      break;
    }
    case ID_EMUS_TEMPS:{
      int emusMaxTemp = buf[1] - 100;
      if(emusMaxTemp > BMS_COOLING_IND_RED_TEMP_C){
        setExtLED(EXTPIN_COOLING_IND1R, HIGH);
        setExtLED(EXTPIN_COOLING_IND1B, LOW);
      } else if(emusMaxTemp > BMS_COOLING_IND_PURPLE_TEMP_C){
        setExtLED(EXTPIN_COOLING_IND1R, HIGH);
        setExtLED(EXTPIN_COOLING_IND1B, HIGH);
      } else{
        setExtLED(EXTPIN_COOLING_IND1R, LOW);
        setExtLED(EXTPIN_COOLING_IND1B, HIGH);
      }
      break;
    }
    case ID_DASH_SELF_TEST:{
      dashSelfTest();
    }
    // case ID_PEDALBOARD_STATE_STATUS:{
    //   delayMicroseconds(1);
    //   break;
    // }
  }
}

// Sampling ADC for damper positions
void sampleDampers(){
  for(int n=0;n<NUM_DAMPER_ADC_SAMPLES;n++){
    damper_left = analogRead(PIN_DAMPER_LEFT);
    delayMicroseconds(DAMPER_ADC_SAMPLES_DELAY_US);
  }

  for(int n=0;n<NUM_DAMPER_ADC_SAMPLES;n++){
    damper_right = analogRead(PIN_DAMPER_RIGHT);
    delayMicroseconds(DAMPER_ADC_SAMPLES_DELAY_US);
  }

  damper_left = damper_left / NUM_DAMPER_ADC_SAMPLES;
  damper_right = damper_right / NUM_DAMPER_ADC_SAMPLES;
}

void sendDaqData() {
    cli();
    
    sampleDampers();
    uint16_t damper_left_mapped = map(damper_left, 0, 1024, 0, 3170);
    uint16_t damper_right_mapped = map(damper_right, 0, 1024, 0, 3170);

    // Build DAQ data message
    unsigned char bufToSend[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    bufToSend[0] = wheel_speed_left;
    bufToSend[1] = wheel_speed_right;
    bufToSend[2] = damper_left_mapped & 0xFF;
    bufToSend[3] = (damper_left_mapped >> 8) & 0xFF;
    bufToSend[4] = damper_right_mapped & 0xFF;
    bufToSend[5] = (damper_right_mapped >> 8) & 0xFF;

    // send the message
    CAN.sendMsgBuf(ID_DAQ_DATA, 0, 8, bufToSend);

    // reenable interrupts
    sei();
}

void sendCoolingStatus(bool coolingEnabled) {
  unsigned char bufToSend[8] = {0, 0, 0, 0, 0, 0, 0, 0};
  if(coolingEnabled){
    bufToSend[0] = 1;
  }

  CAN.sendMsgBuf(ID_COOLING_MODE, 0, 8, bufToSend);

}

void setup() {
  // pin mode setup
  pinMode(PIN_LED_CLK, OUTPUT);
  pinMode(PIN_LED_LE, OUTPUT);
  pinMode(PIN_LED_OE, OUTPUT);
  pinMode(PIN_LED_SDI, OUTPUT);

  pinMode(PIN_LED1, OUTPUT);
  pinMode(PIN_LED2, OUTPUT);
  pinMode(PIN_RTD_INDICATOR, OUTPUT);
  pinMode(PIN_COOLING_MODE_1, INPUT_PULLUP);
  pinMode(PIN_COOLING_MODE_2, INPUT_PULLUP);

  // STP16C05 pins - disable latch, disable output
  digitalWrite(PIN_LED_LE, LOW);
  digitalWrite(PIN_LED_OE, HIGH);

  // // initialize TIMER0 for 8kHz
  // TCCR0A = 0;
  // TCCR0B = (0x02 << CS00);  // f_timer = f_cpu/8 => 1MHz
  // OCR0A = 125;  // set comparator A
  // TIMSK0 = (1 << OCIE0A);  // enable comparator A interrupt

  // // initialize TIMER1 for 100Hz
  // TCCR1A = 0;
  // TCCR1B = (0x02 << CS10);  // f_timer = f_cpu/8 => 1MHz
  // OCR1A = 10000;  // set comparator A
  // TIMSK1 = (1 << OCIE1A);  // enable comparator A interrupt

  //Initialize CANbus interface
  while (CAN_OK != CAN.begin(CAN_500KBPS)) { //Check we can talk to CAN
#ifdef DEBUG
    Serial.println("CAN BUS Shield init fail");
    Serial.println("Init CAN BUS Shield again");
#endif
  }
#ifdef DEBUG
  Serial.println("CAN BUS Shield init ok!");
  // setExtLED(EXTPIN_COOLING_IND1G, HIGH);
#endif

  lastSendDaqMessage = millis();
}

void loop() {
  unsigned char len = 0;
  unsigned char buf[8];

  if (CAN_MSGAVAIL == CAN.checkReceive()) {   // check if data coming
    CAN.readMsgBuf(&len, buf);    // read data,  len: data length, buf: data buf

    filterCan(CAN.getCanId(), buf);
  }

  if(millis() > (lastSendDaqMessage + DAQ_CAN_INTERVAL_MS)){
    lastSendDaqMessage = millis();
    sendDaqData();
  }

  if(millis() > (lastSendCoolingStatus + COOLING_STATUS_CAN_INTERVAL_MS)){
    lastSendCoolingStatus = millis();
    sendCoolingStatus(digitalRead(PIN_COOLING_MODE_2));
  }
}

// Consistent interrupt for sampling wheel speed sensors
ISR(TIMER0_COMPA_vect) {
    // increment sample counters
    wsl_samples_since_last++;
    wsr_samples_since_last++;
    wsl_debounce_samples++;
    wsr_debounce_samples++;

    // LEFT WHEEL
    if (bit_is_set(PINC, PIN_WHEEL_SPEED_LEFT) && !wsl_detected  // pulse begins
        && wsl_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
        wsl_detected = true;
        uint32_t speed =  // uint32 used because some of the numbers in the calculation get very large
                (WHEEL_SPEED_DIST_PER_PULSE / wsl_samples_since_last)   // wheel speed in mils/sample
            *    WHEEL_SPEED_SAMPLE_RATE                                // converts to mils/second
            /    MILS_PER_SECOND_TO_MILES_PER_HOUR;                     // converts to mph
        wheel_speed_left = speed;  // the final result stored in `speed` should fit into a uint8
        wsl_samples_since_last = 0;
        wsl_debounce_samples = 0;
    } else if (bit_is_clear(PINC, PIN_WHEEL_SPEED_LEFT) && wsl_detected  // pulse ends
               && wsl_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
        wsl_detected = false;
        wsl_debounce_samples = 0;
    }

    // RIGHT WHEEL
    if (bit_is_set(PINC, PIN_WHEEL_SPEED_RIGHT) && !wsr_detected  // pulse begins
        && wsr_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
        wsr_detected = true;
        uint32_t speed =  // uint32 used because some of the numbers in the calculation get very large
                (WHEEL_SPEED_DIST_PER_PULSE / wsr_samples_since_last)   // wheel speed in mils/sample
            *    WHEEL_SPEED_SAMPLE_RATE                                // converts to mils/second
            /    MILS_PER_SECOND_TO_MILES_PER_HOUR;                     // converts to mph
        wheel_speed_right = speed;  // the final result stored in `speed` should fit into a uint8
        wsr_samples_since_last = 0;
        wsr_debounce_samples = 0;
    } else if (bit_is_clear(PINC, PIN_WHEEL_SPEED_LEFT) && wsr_detected  // pulse ends
               && wsr_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
        wsr_detected = false;
        wsr_debounce_samples = 0;
    }
}
