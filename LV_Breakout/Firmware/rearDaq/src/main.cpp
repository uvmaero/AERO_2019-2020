/**
 * Copyright 2020, George Spearing, UVM AERO
 * 
 * Rear DAQ 
 *  - Sends DAQ informaion over can
 *  - Control Brake and Cooling Fan
 */

// TODO: Chage pinouts of Brake and Fan Back. They were changed during testing

#include <Arduino.h>
#include <mcp_can.h>

#define PIN_SPI_CAN_CS 5 // CAN chip
#define CAN_INT 2 // interrupt pint

MCP_CAN CAN(PIN_SPI_CAN_CS);     // Set CS pin

// "Send" CANbus address defines
#define ID_BASE  0x01
#define ID_REAR_DAQ_DATA  ID_BASE + 1
#define ID_REAR_DAQ_SIG   ID_BASE + 2

// "Receive" CAN Bus
#define ID_DASH_DAQ       0x1C
#define ID_FRONT_DAQ_DATA 0x38

#define DAQ_CAN_INTERVAL_MS 10
// DAQ sample rate
unsigned long lastSendDaqMessage = 0;

// Sensor Pins
#define PIN_DAMPER_3 3
#define PIN_DAMPER_4 4
#define PIN_Wheel_4 6
#define PIN_Wheel_5 7

// thermistor Pins
#define PIN_TEMP1 A1
#define PIN_TEMP2 A3


// Output Pins
#define PIN_BRAKE A0 // CORRECT PINOUT IS A0
#define PIN_FAN   A2 // CORRECT PINOUT IS A2

// Thermistor values
int temp1;
float R1 = 10000;
float logR2, R2, T;
float c1 = 1.00e-3, c2 = 2.378e-4, c3 = 2.01e-7;
int NUMSAMPLES = 5;
float BCOEFFICIENT = 3380;
float TEMPNOM = 25.0;
int i;
float average;


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

// CAN buffers
unsigned long id;
unsigned char len = 0;
unsigned char buf[8];


// Initialize input states

// Initialize output states
bool brakeSig = false;
int fanSig;
bool autoTemp = false;

void sampleDampers();

void sendDaqData() {
  // turn off interrupts while sending CAN message
  cli();

  sampleDampers();

  uint16_t damper_left_mapped = map(damper_left, 0, 1024, 0, 3170);
  uint16_t damper_right_mapped = map(damper_right, 0, 1024, 0, 3170);


  // Build DAQ data message
  byte bufToSend[8] = {0, 0, 0, 0, 0, 0, 0, 0};
  bufToSend[0] = 0; // wheel speed 3
  bufToSend[1] = 0; // wheel speed 4
  bufToSend[2] = damper_left_mapped & 0xFF;
  bufToSend[3] = (damper_left_mapped >> 8) & 0xFF;
  bufToSend[4] = damper_right_mapped & 0xFF;
  bufToSend[5] = (damper_right_mapped >> 8) & 0xFF; 
  bufToSend[6] = brakeSig;
  bufToSend[7] = fanSig;


  // send the message
  CAN.sendMsgBuf(ID_REAR_DAQ_DATA, 8, bufToSend);

  // reenable interrupts
  sei();

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
      autoTemp = buf[2];
      // digitalWrite(PIN_FAN, fanSig); 
      break;
    case ID_FRONT_DAQ_DATA:
      brakeSig = buf[5];
      digitalWrite(PIN_BRAKE, brakeSig); 
      break;
  }
}

void setup(){
  // pin mode setup
  pinMode(PIN_DAMPER_3, INPUT);
  pinMode(PIN_DAMPER_4, INPUT);
  pinMode(PIN_Wheel_4, INPUT);
  pinMode(PIN_Wheel_5, INPUT);
  pinMode(PIN_BRAKE, OUTPUT);
  pinMode(PIN_FAN, OUTPUT);

  // ONLY NEED THIS IF USING INTERRUPT PIN
  // pinMode(CAN_INT, INPUT);

  //Initialize CANbus interface
  CAN.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ);
  // while (CAN.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ) != CAN_OK) { //Check we can talk to CAN
  //   lastSendDaqMessage = millis();
  // }

  // setup can to allow for data transmission
  CAN.setMode(MCP_NORMAL);
}

void loop(){  

  if(millis() - lastSendDaqMessage >= DAQ_CAN_INTERVAL_MS){
    sendDaqData();
    lastSendDaqMessage = millis();

  }

  // IF USING INTERRUPT PIN, USE THIS CODE
  // if(!digitalRead(CAN_INT)){
  //   CAN.readMsgBuf(&id, &len, buf);
  //   filterCan(id, buf);
  // }

  if (CAN_MSGAVAIL == CAN.checkReceive()) {   // check if data coming
  CAN.readMsgBuf(&id, &len, buf);    // read data,  len: data length, buf: data buf
  filterCan(id, buf);
  }

  // if cooling switch is on, calcualte temperature and adjust fan speed
  if(autoTemp){
    average = 0;
    for(i=0; i<NUMSAMPLES; ++i){
      average += analogRead(PIN_TEMP1);
    }
    temp1 = average/NUMSAMPLES; // get analog read average value
    R2 = R1 * (1023.0 / (float)temp1 - 1.0);
    logR2 = log(R2);
    T = logR2/BCOEFFICIENT;
    T = T +(1.0/ (TEMPNOM + 273.15)); // Convert Kelvin to C
    T = 1.0/T;
    T -= 273.15;
    fanSig = int(T) & 0xFF; // hex
    analogWrite(PIN_FAN, fanSig);
  }
}
