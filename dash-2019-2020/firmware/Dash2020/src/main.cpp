/**
 * Copyright 2020 George Spearing
 * 
 * Right dash PCB code.
 *  - Reports button and knob state changes over CANbus
 *  - Reads certain CANbus messages to set LEDs
 *  - Acquires data for DAQ system from front wheels
 * 
 * Wheel speed code written by Cullen Jemison:
 * https://github.com/uvmaero/aero-daq-firmware/blob/master/daq-board/src/daq_board.c
 *
 * LED code written by Willem Hillier
 */


#include <Arduino.h>
#include <mcp_can.h>

// #define DEBUG // set Debug status serial print output

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
#define ID_DASH_SELF_TEST     ID_BASE + 8 // 072#00000000 for test
#define ID_PRECHARGE_STATUS   ID_BASE + 9
#define ID_DAQ_DATA           0x1C

// Rinehart CAN IDs
// "Receive" CANbus address defines
#define ID_RINEHART_TEMPS1    0xA0
#define ID_RINEHART_TEMPS2    0xA1
#define ID_RINEHART_TEMPS3    0xA2
#define ID_RINEHART_DIGITAL_IN 0x0A4
#define ID_RINEHART_VOLTAGE 0x0A7

#define ID_RINEHART_COMMAND 0x0C0
#define ID_RINEHART_PARAM_REQUEST 0x0C1
#define ID_RINEHART_PARAM_RESPONSE 0x0C2

#define ID_EMUS_BASE          0x2A7
#define ID_EMUS_VOLTAGE       ID_EMUS_BASE +1
#define ID_EMUS_TEMPS         ID_EMUS_BASE + 2

#define ID_FAULTLATCHER_FAULTS 0x79
#define ID_PEDALBOARD_STATE_STATUS //TODO: light up RTD button led based on this

// Pin defines
#define PIN_RTD_INDICATOR     8 // horn
#define PIN_RTD_BTN           9 // start button
#define PIN_SPI_CAN_CS        10
#define PIN_LED1              20
#define PIN_LED2              21
#define PIN_POT_BRAKE         A0
#define PIN_POT_COAST         A1
#define PIN_DIRECTION_MODE    A2
#define PIN_COOLING_MODE      A4
#define PIN_LED_OE            4
#define PIN_LED_LE            5
#define PIN_LED_CLK           6
#define PIN_LED_SDI           7
#define PIN_NTC1              A7

// "Pin" of LEDs driven by STP16CP05
#define EXTPIN_FAULT_BMS_1   0
#define EXTPIN_FAULT_GFD_2   1
#define EXTPIN_FAULT_TMS_3   2
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

// Rinehart pins
#define RINEHART_PIN_TSMS 4
#define RINEHART_PIN_PRECHARGE 0
#define RINEHART_PIN_MAIN_CONT 1
#define RINEHART_PIN_RTDS 2

// Assorted other defines
#define STP16CP05_DELAY_US             1  // delay b/w consecutive bit-bang operations
#define DAQ_CAN_INTERVAL_MS            100
#define COOLING_STATUS_CAN_INTERVAL_MS 500

// precharge coefficient -- rinehart voltage must be more than emus voltage * coefficient
// in order to finish precharge
#define PRECHARGE_COEFFICIENT 0.9

// RTDS souding period (ms)
#define RTDS_PERIOD 2000

#define SELFTEST_DELAY_US              75000
#define SELFTEST_POT_WORKING_THRESHOLD 50
#define SELFTEST_TIMEOUT               20 // seconds


// Maximum number of missed messages before canceling precharge
#define MAX_MISSED_EMUS_MESSAGES 10
#define MAX_MISSED_RINEHART_MESSAGES 100


// direction -- 0=forward, 1=reverse
uint8_t direction = 0;

// ready to drive state
uint8_t ready_to_drive = false;
uint8_t rtds_on = false;

// rinehart inputs
uint8_t rinehart_inputs = 0;

// precharge state
enum precharge_state_e {
    PRECHARGE_OFF,
    PRECHARGE_ON,
    PRECHARGE_DONE,
    PRECHARGE_ERROR
};
precharge_state_e precharge_state = PRECHARGE_OFF;

// set whenever a new precharge state is entered
uint8_t precharge_state_enter = 1;

// ADC sample accumulator
uint8_t sample_accumulator;

// RTDS on time (ms)
uint16_t time_since_rtds_start = 0;

// voltages
double emus_voltage = 265.0;  // assume maximum voltage to begin with
double rinehart_voltage = 0;

// DAQ sample rate
unsigned long lastSendDaqMessage = 0;

// Emus and Rinhart message timeout values
uint8_t cycles_since_last_emus_message = 0;
uint8_t cycles_since_last_rinehart_message = MAX_MISSED_RINEHART_MESSAGES;  // assume Rinehart connection hasn't been made yet


// damper position
uint8_t coastAccel = 0, brakeSteer = 0;
int coast_mapped = 0, brake_mapped = 0;
// cooling enabled value
bool coolingEnabled = 0;

// start button pressed
bool rtdButton = false;

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

  // turn on all leds
  for(int i=0; i<16;i++){
    setExtLED(i,HIGH);
  }

  delayMicroseconds(SELFTEST_DELAY_US);

  // turn off all leds;
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
  bool coastKnobIsWorking = false, brakeKnobIsWorking = false, directionSwitchIsWorking = false,
  coolingModeSwitchIsWorking = false, rtdButtonIsWorking = false;

  uint8_t coastKnobInitialValue = analogRead(PIN_POT_COAST);
  uint8_t brakeKnobInitialValue = analogRead(PIN_POT_BRAKE);
  bool coolingModeInitialValue = digitalRead(PIN_COOLING_MODE);
  bool directionInitialValue = digitalRead(PIN_DIRECTION_MODE);
  bool rtdButtonInitialValue = digitalRead(PIN_RTD_BTN);
  // only can continue if all knobs have been rotated and different values read + all buttons/switches have toggled states
  // turn on leds will only turn off once values change
  for(int i=0; i<=3;i++){
    setExtLED(i,HIGH);
  }
  setExtLED(EXTPIN_COOLING_IND2R, HIGH);


  while(!coastKnobIsWorking || !brakeKnobIsWorking ||
        !coolingModeSwitchIsWorking || !rtdButtonIsWorking || !directionSwitchIsWorking){
    
    if(rtdButtonInitialValue != digitalRead(PIN_RTD_BTN)){
      rtdButtonIsWorking = true;
      setExtLED(EXTPIN_FAULT_BMS_1, LOW);
    }

    if(abs(coastKnobInitialValue-analogRead(PIN_POT_COAST)) > SELFTEST_POT_WORKING_THRESHOLD){
      coastKnobIsWorking = true;
      setExtLED(EXTPIN_FAULT_GFD_2, LOW);
    }

    if(abs(brakeKnobInitialValue-analogRead(PIN_POT_BRAKE)) > SELFTEST_POT_WORKING_THRESHOLD){
      brakeKnobIsWorking = true;
      setExtLED(EXTPIN_FAULT_TMS_3, LOW);
    }

    if(coolingModeInitialValue != digitalRead(PIN_COOLING_MODE)){
      coolingModeSwitchIsWorking = true;
      setExtLED(EXTPIN_COOLING_IND1R, LOW);
    }

    if(directionInitialValue != digitalRead(PIN_DIRECTION_MODE)){
      directionSwitchIsWorking = true;
      setExtLED(EXTPIN_COOLING_IND2R, LOW);
    } 

    delayMicroseconds(50);

  }

  sei();
}

void filterCan(unsigned long canId, unsigned char buf[8]) {
  switch (canId) {
    case ID_FAULTLATCHER_FAULTS:  
      setExtLED(EXTPIN_FAULT_BMS_1, (buf[0])^1); /// BMS fault is 0th bit of buf[]
      setExtLED(EXTPIN_FAULT_TMS_3, (buf[1])^1); // TMS faults are 1st bits of buf[]
      setExtLED(EXTPIN_FAULT_GFD_2, (buf[2])^1); // GFD faul is the 3nd bit of buff[]
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
      break;
    }
  }
}

// Send Data Message 
void sendDaqData() {
    cli();
    
    coastAccel = analogRead(PIN_POT_COAST);
    brakeSteer = analogRead(PIN_POT_BRAKE);
    coolingEnabled = digitalRead(PIN_COOLING_MODE);
    direction = digitalRead(PIN_DIRECTION_MODE);
    rtdButton = digitalRead(PIN_RTD_BTN);

    coast_mapped = map(coastAccel, 0, 1024, 0, 255);
    brake_mapped = map(brakeSteer, 0, 1024, 0, 255);
    // Build DAQ data message
    unsigned char bufMsg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    bufMsg[0] = coast_mapped;
    bufMsg[1] = brake_mapped;
    bufMsg[2] = coolingEnabled ^ 1;
    bufMsg[3] = ready_to_drive;
    bufMsg[4] = direction;
    bufMsg[5] = rtdButton;

    // send the message
    CAN.sendMsgBuf(ID_DAQ_DATA, 0, 8, bufMsg);

    // reenable interrupts
    sei();
}

// void set_precharge_state(enum precharge_state_e state) {
//     precharge_state = state;
//     precharge_state_enter = 1;
// }

// uint8_t send_rinehart_command(uint16_t param_addr, uint8_t rw, uint16_t data, uint16_t *data_out, uint8_t num_tries) {
//     // create the command message
//     uint8_t command[8] = {0,0,0,0,0,0};
//     command[0] = param_addr & 0xFF;
//     command[1] = (param_addr >> 8) & 0xFF;
//     command[2] = rw;
//     command[3] = 0x00;
//     command[4] = data & 0xFF;
//     command[5] = (data >> 8) & 0xFF;

//     cli();
//     CAN.sendMsgBuf(ID_RINEHART_PARAM_REQUEST, 0, 6, command);
//     sei();

//     for (int i = 0; i < num_tries; i++) {
//         unsigned char data[8];
//         unsigned char len = 0;
//         cli();
//         if (CAN.readMsgBuf(&len, data)) {
//             // if the CAN id matches, along with the param address and the success message, return 1
//             if (CAN.getCanId() == ID_RINEHART_PARAM_RESPONSE &&
//                 (data[0] | (data[1] << 8)) == param_addr &&
//                 data[2] == 0x01) {
//                 if (data_out != NULL) {
//                     *data_out = data[4] | (data[5] << 8);
//                 }
//                 return 1;
//             }
//         }
//         sei();
//     }
//     return 0;
// }

// uint8_t set_rinehart_output(uint8_t value, uint8_t num_tries) {
//     return send_rinehart_command(0x01, 0x01, 0x5500 | value, NULL, num_tries);
// }

// void control_precharge() {
//     if (cycles_since_last_rinehart_message > MAX_MISSED_RINEHART_MESSAGES) {
//         precharge_state = PRECHARGE_ERROR;
//     }
//     if (cycles_since_last_emus_message > MAX_MISSED_EMUS_MESSAGES) {
//         precharge_state = PRECHARGE_ERROR;
//     }
//     // TODO: make sure outputs were set properly before doing a state change
//     switch (precharge_state) {
//         case PRECHARGE_OFF: {
//             // if the state was just entered, try to turn off both rinehart outputs
//             if (precharge_state_enter) {
//                 if (set_rinehart_output(0, 10)) {
//                     precharge_state_enter = 0;
//                 }
//             }

//             // vehicle is no ready to drive
//             ready_to_drive = false;

//             // if TSMS is on, switch to PRECHARGE_ON
//             if (rinehart_inputs & (1 << RINEHART_PIN_TSMS)) {
//                 set_precharge_state(PRECHARGE_ON);
//             }
//             break;
//         }
//         case PRECHARGE_ON: {
//             if (precharge_state_enter) {
//                 if (set_rinehart_output(1 << RINEHART_PIN_PRECHARGE, 10)) {
//                     precharge_state_enter = 0;
//                 }
//             }

//             // if TSMS is no longer on, switch back to PRECHARGE_OFF
//             if (!(rinehart_inputs & (1 << RINEHART_PIN_TSMS))) {
//                 set_precharge_state(PRECHARGE_OFF);
//             }

//             // vehicle is not ready to drive
//             ready_to_drive = false;

//             if (rinehart_voltage > emus_voltage * PRECHARGE_COEFFICIENT) {
//                 set_precharge_state(PRECHARGE_DONE);
//             }
//             break;
//         }
//         case PRECHARGE_DONE: {
//             if (precharge_state_enter) {
//                 if (set_rinehart_output((1 << RINEHART_PIN_MAIN_CONT) | (1 << RINEHART_PIN_PRECHARGE), 10)) {
//                     precharge_state_enter = 0;
//                 }
//             }

//             // if TSMS is no longer on, switch back to PRECHARGE_OFF
//             if (!(rinehart_inputs & (1 << RINEHART_PIN_TSMS))) {
//                 set_precharge_state(PRECHARGE_OFF);
//             }
//             break;
//         }
//         case PRECHARGE_ERROR: {
//             // turn off Rinehart outputs
//             set_rinehart_output(0, 10);
          
//             // vehicle is no longer ready to drive
//             ready_to_drive = false;

//             // if both devices have been read from recently, return to PRECHARGE_OFF
//             if (cycles_since_last_emus_message < MAX_MISSED_EMUS_MESSAGES && cycles_since_last_rinehart_message < MAX_MISSED_RINEHART_MESSAGES) {
//                 precharge_state = PRECHARGE_OFF;
//             }
//         }
//     }

//     // incrememnt misssed emus messages counter
//     if (cycles_since_last_emus_message <= MAX_MISSED_EMUS_MESSAGES) {
//         cycles_since_last_emus_message++;
//     }

//     // increment missed rinehart messages counter
//     if (cycles_since_last_rinehart_message <= MAX_MISSED_RINEHART_MESSAGES) {
//         cycles_since_last_rinehart_message++;
//     }

//     // send precharge message
//     uint8_t prechargeData[1] = {0};
//     prechargeData[0] = precharge_state;

//     cli();
//     CAN.sendMsgBuf(ID_PRECHARGE_STATUS, 0, 1, prechargeData);
//     sei();
// }

// 10Hz timer interrupt
// ISR(TIMER1_COMPA_vect) {
//     // Control precharge
//     control_precharge();

//     if (ready_to_drive && precharge_state == PRECHARGE_DONE && time_since_rtds_start > RTDS_PERIOD && rtds_on) {
//         set_rinehart_output((1 << RINEHART_PIN_MAIN_CONT) | (1 << RINEHART_PIN_PRECHARGE), 10);
//         rtds_on = false;
//     }

//     if (ready_to_drive && time_since_rtds_start <= RTDS_PERIOD && rtds_on) {
//         time_since_rtds_start += 100;
//     }
// }

void setup() {
  // pin mode setup
  pinMode(PIN_LED_CLK, OUTPUT);
  pinMode(PIN_LED_LE, OUTPUT);
  pinMode(PIN_LED_OE, OUTPUT);
  pinMode(PIN_LED_SDI, OUTPUT);

  pinMode(PIN_LED1, OUTPUT);
  pinMode(PIN_LED2, OUTPUT);
  pinMode(PIN_RTD_INDICATOR, OUTPUT);
  pinMode(PIN_COOLING_MODE, INPUT);
  pinMode(PIN_RTD_BTN, INPUT);


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

  // TODO: if precharge state is done, light up start button LED
  // TODO: Once start button is pressed, trigger buzzer indicator
  // if (precharge_state == PRECHARGE_DONE){

  // }

}

