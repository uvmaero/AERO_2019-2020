/**
 * Copyright 2020, George Spearing, UVM AERO
 * 
 * Rear DAQ 
 *  - Sends DAQ informaion over can
 *  - Control Break and Cooling Fan
 */

#include <Arduino.h>
#include <mcp_can.h>

#define PIN_SPI_CAN_CS 5 // CAN chip

MCP_CAN CAN(PIN_SPI_CAN_CS);     // Set CS pin

// "Send" CANbus address defines
#define ID_BASE  0x01
#define ID_REAR_DAQ_DATA  ID_BASE + 1
#define ID_REAR_DAQ_SIG   ID_BASE + 2

// "Receive" CAN Bus
#define ID_DASH_DAQ       0x1C
#define ID_FRONT_DAQ_DATA 0x38

#define DAQ_CAN_INTERVAL_MS 100
// DAQ sample rate
uint8_t lastSendDaqMessage = 0;
uint8_t daqMessageInterval = 500;

// Sensor Pins
#define PIN_DAMPER_3 3
#define PIN_DAMPER_4 4
#define PIN_Wheel_4 6
#define PIN_Wheel_5 7

// Output Pins
#define PIN_BRAKE A0
#define PIN_FAN   A2


// damper sampling values
#define NUM_DAMPER_ADC_SAMPLES         10
#define DAMPER_ADC_SAMPLES_DELAY_US    5
uint16_t damper_left=0,damper_right=0;
uint16_t damper_left_mapped = map(damper_left, 0, 1024, 0, 3170);
uint16_t damper_right_mapped = map(damper_right, 0, 1024, 0, 3170);


#define WHEEL_SPEED_PULSES_PER_REV        1
#define WHEEL_SPEED_SAMPLE_RATE           8000  // sampling rate (Hz). Slightly faster than Nyquist for wheel speed sensing
#define WHEEL_SPEED_SENSE_CIRCUMFERENCE   31415 // in mils (thousandths of an inch)
#define WHEEL_SPEED_DIST_PER_PULSE        WHEEL_SPEED_SENSE_CIRCUMFERENCE / WHEEL_SPEED_PULSES_PER_REV
#define WHEEL_SPEED_DEBOUNCE              10    // number of samples used for debouncing
#define MILS_PER_SECOND_TO_MILES_PER_HOUR 17600

// wheel speed calculation variables
uint16_t wsl_samples_since_last = 0, wsr_samples_since_last = 0;
uint16_t wsl_debounce_samples = 0, wsr_debounce_samples = 0;
bool wsl_detected = false, wsr_detected = false;
uint8_t wheel_speed_left, wheel_speed_right;
uint8_t sample_accumulator = 0;


// Initialize input states

// Initialize output states
bool brakeSig = false;
bool fanSig = false;

void sendDaqData();
void sampleDampers();

void setup(){
  // pin mode setup
  pinMode(PIN_DAMPER_3, INPUT);
  pinMode(PIN_DAMPER_4, INPUT);
  pinMode(PIN_Wheel_4, INPUT);
  pinMode(PIN_Wheel_5, INPUT);
  pinMode(PIN_BRAKE, OUTPUT);
  pinMode(PIN_FAN, OUTPUT);

  //Initialize CANbus interface
  while (CAN_OK != CAN.begin(CAN_500KBPS)) { //Check we can talk to CAN
    lastSendDaqMessage = millis();
  }
}

void loop(){
  if(millis() > (lastSendDaqMessage + DAQ_CAN_INTERVAL_MS)){

    sendDaqData();
  }
}

void sendDaqData() {
  // turn off interrupts while sending CAN message
  cli();

  sampleDampers();

  uint16_t damper_left_mapped = map(damper_left, 0, 1024, 0, 3170);
  uint16_t damper_right_mapped = map(damper_right, 0, 1024, 0, 3170);


  // Build DAQ data message
  uint8_t bufToSend[8] = {0, 0, 0, 0, 0, 0, 0, 0};
  bufToSend[0] = 0; // wheel speed 3
  bufToSend[1] = 0; // wheel speed 4
  bufToSend[2] = damper_left_mapped & 0xFF;
  bufToSend[3] = (damper_left_mapped >> 8) & 0xFF;
  bufToSend[4] = damper_right_mapped & 0xFF;
  bufToSend[5] = (damper_right_mapped >> 8) & 0xFF; 


  // send the message
  CAN.sendMsgBuf(ID_REAR_DAQ_DATA, 0, 8, bufToSend);

  // reenable interrupts
  sei();

  lastSendDaqMessage = millis();
}


// Sampling ADC for damper positions
void sampleDampers(){
  for(int n=0;n<NUM_DAMPER_ADC_SAMPLES;n++){
    damper_left = analogRead(PIN_DAMPER_3);
    delayMicroseconds(DAMPER_ADC_SAMPLES_DELAY_US);
  }

  for(int n=0;n<NUM_DAMPER_ADC_SAMPLES;n++){
    damper_right = analogRead(PIN_DAMPER_4);
    delayMicroseconds(DAMPER_ADC_SAMPLES_DELAY_US);
  }

  damper_left = damper_left / NUM_DAMPER_ADC_SAMPLES;
  damper_right = damper_right / NUM_DAMPER_ADC_SAMPLES;
}

// on message receive look for fan and brake signal
void filterCan(unsigned long canId, unsigned char buf[8]) {
  switch(canId){
    case ID_DASH_DAQ:
      fanSig = buf[2];
      break;
    case ID_FRONT_DAQ_DATA:
      brakeSig = buf[5];
      break;
  }
}