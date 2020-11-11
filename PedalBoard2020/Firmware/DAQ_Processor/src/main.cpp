/**
 *  Copyright 2020 George Spearing
 * 
 *  Pedal board
 *  Front DAQ Board. Collects and reports: wheel speed (2),
 *  front break pressure(2), throttle possition, steeering and string pots
 *  Break and torque commands are calculated and sent for RineHart
 */

#include <Arduino.h>
#include <mcp_can.h>

#define DEBUG

// SEND CANbus address defines
#define ID_BASE             0x2D
#define ID_RESET            ID_BASE
#define ID_DATA             ID_BASE+5
#define ID_GET_PEDAL        ID_BASE+6
#define ID_SET_PEDAL_BAND   ID_BASE+7
#define ID_SET_TORQUE       ID_BASE+8
#define ID_PRECHARGE_STATUS ID_BASE+9
#define ID_DAQ              ID_BASE+10

#define ID_RINEHART_COMMAND 0x0C0
#define ID_RINEHART_PARAM_REQUEST 0x0C1
#define ID_RINEHART_PARAM_RESPONSE 0x0C2

// DASH CAN ID
#define ID_DASH 0x6A
#define ID_DASH_DAQ 0x1C

// Number of ADC samples to wait before sampling. This lets the sensor pull the device
// to the expected voltage in time.
#define NUM_SAMPLES 10

// analog input pin constants
#define PIN_PEDAL0  A4
#define PIN_PEDAL1  A3
#define PIN_BRAKE0  A2
#define PIN_BRAKE1  A1
#define PIN_STEER   A0


// pedal EEPROM address base
#define PEDAL_EEPROM 10

// max torque EEPROM address
#define MAX_TORQUE_EEPROM 40

// maximum pedal mismatch or over/under-travel
#define MAX_PEDAL_SKEW 10

// pedal deadband for converting to torque command
#define PEDAL_DEADBAND 10

#define PIN_SPI_CAN_CS 5

// Set CS pin
MCP_CAN CAN(PIN_SPI_CAN_CS);     // Set CS pin

uint16_t brake_pressure_max = 3000;
uint16_t BRAKE_THRESHOLD = 500;

// dampers

#define PIN_DAMPER_LEFT       A2
#define PIN_DAMPER_RIGHT      A3

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

// pedal ranges -- these are all defaults; they will be updated from the EEPROM on boot
uint16_t pedal0_min = 189;
uint16_t pedal0_max = 849;
uint16_t pedal1_min = 50;
uint16_t pedal1_max = 417;

// raw ADC values from each sensor
uint16_t pedal0=0, pedal1=0, brake0=0, brake1=0, steer=0;
uint16_t brake0_mapped = 0, brake1_mapped = 0;

// mapped pedal values
uint8_t pedal0_mapped, pedal1_mapped;

// max torque for Rinehart torque command
int16_t max_torque = 50;  // super low default just to be safe

// regen torque values -- these are updated over CAN from the dash
int16_t brake_regen_torque = 10;
int16_t coast_regen_torque = 10;

uint16_t brake_torque_multiplier = 0;

// brake system params
uint16_t front_brake_pressure = 0;
uint16_t rear_brake_pressure = 0;
bool brakeTrip = false;

// DAQ sample rate
uint8_t lastSendDaqMessage = 0;
uint8_t daqMessageInterval = 500;

uint8_t ready_to_drive = 0;

void sendDaqData();
void sampleDampers();
void sampleBrake();
void filterCan(unsigned long canId, unsigned char buf[8]);

void setup() {

  // CAN bitrate = 500KBPS
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

    if (millis()-lastSendDaqMessage > daqMessageInterval){
        sendDaqData();
    }
    lastSendDaqMessage = millis();
}

void sendDaqData() {
    cli();
    
    sampleDampers();
    uint16_t damper_left_mapped = map(damper_left, 0, 1024, 0, 3170);
    uint16_t damper_right_mapped = map(damper_right, 0, 1024, 0, 3170);

    sampleBrake();

    // Build DAQ data message
    unsigned char bufToSend[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    // TODO: add wheel speed left and right
    bufToSend[0] = 0;
    bufToSend[1] = 0;
    bufToSend[2] = damper_left_mapped & 0xFF;
    bufToSend[3] = damper_right_mapped & 0xFF;
    bufToSend[4] = steer / 4; // steering position
    bufToSend[5] = brakeTrip; // send '1' if break pressure > threshold

    // send the message
    CAN.sendMsgBuf(ID_DATA, 0, 8, bufToSend);

    // reenable interrupts
    sei();
}

void filterCan(unsigned long canId, unsigned char buf[8]) {
  switch(canId){
    case ID_DASH_DAQ:
      break;
  }
}

// // Consistent interrupt for sampling wheel speed sensors
// ISR(TIMER0_COMPA_vect) {
//     // increment sample counters
//     wsl_samples_since_last++;
//     wsr_samples_since_last++;
//     wsl_debounce_samples++;
//     wsr_debounce_samples++;

//     // LEFT WHEEL
//     if (bit_is_set(PINC, PIN_WHEEL_SPEED_LEFT) && !wsl_detected  // pulse begins
//         && wsl_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
//         wsl_detected = true;
//         uint32_t speed =  // uint32 used because some of the numbers in the calculation get very large
//                 (WHEEL_SPEED_DIST_PER_PULSE / wsl_samples_since_last)   // wheel speed in mils/sample
//             *    WHEEL_SPEED_SAMPLE_RATE                                // converts to mils/second
//             /    MILS_PER_SECOND_TO_MILES_PER_HOUR;                     // converts to mph
//         wheel_speed_left = speed;  // the final result stored in `speed` should fit into a uint8
//         wsl_samples_since_last = 0;
//         wsl_debounce_samples = 0;
//     } else if (bit_is_clear(PINC, PIN_WHEEL_SPEED_LEFT) && wsl_detected  // pulse ends
//                && wsl_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
//         wsl_detected = false;
//         wsl_debounce_samples = 0;
//     }

//     // RIGHT WHEEL
//     if (bit_is_set(PINC, PIN_WHEEL_SPEED_RIGHT) && !wsr_detected  // pulse begins
//         && wsr_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
//         wsr_detected = true;
//         uint32_t speed =  // uint32 used because some of the numbers in the calculation get very large
//                 (WHEEL_SPEED_DIST_PER_PULSE / wsr_samples_since_last)   // wheel speed in mils/sample
//             *    WHEEL_SPEED_SAMPLE_RATE                                // converts to mils/second
//             /    MILS_PER_SECOND_TO_MILES_PER_HOUR;                     // converts to mph
//         wheel_speed_right = speed;  // the final result stored in `speed` should fit into a uint8
//         wsr_samples_since_last = 0;
//         wsr_debounce_samples = 0;
//     } else if (bit_is_clear(PINC, PIN_WHEEL_SPEED_LEFT) && wsr_detected  // pulse ends
//                && wsr_debounce_samples > WHEEL_SPEED_DEBOUNCE) {
//         wsr_detected = false;
//         wsr_debounce_samples = 0;
//     }
// }

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

// 10Hz timer interrupt
ISR(TIMER1_COMPA_vect) {

  // map the pedal
  pedal0_mapped = map(pedal0, pedal0_min, pedal0_max, 0, 255);
  pedal1_mapped = map(pedal1, pedal1_min, pedal1_max, 0, 255);

  sampleBrake();

  // // map brake pressure sensors
  // uint16_t brake0_mapped = map(brake0, 0, 1024, 0, brake_pressure_max);
  // uint16_t brake1_mapped = map(brake1, 0, 1024, 0, brake_pressure_max);

  // check for over/under-travel
  if (pedal0 > pedal0_max + 4*MAX_PEDAL_SKEW ||
      pedal0 < pedal0_min ||
      pedal1 > pedal1_max + 4*MAX_PEDAL_SKEW ||
      pedal1 < pedal1_min) {
          pedal0_mapped = 0;
          pedal1_mapped = 0;
  }

  // check for mismatch
  if (pedal0_mapped > pedal1_mapped + MAX_PEDAL_SKEW ||
      pedal1_mapped > pedal0_mapped + MAX_PEDAL_SKEW) {
      pedal0_mapped = 0;
      pedal1_mapped = 0;
  }

  // construct the message
  unsigned char msg[8] = {0,0,0,0,0,0,0,0};
  msg[0] = pedal0_mapped;
  msg[1] = pedal1_mapped;
  msg[2] = (uint8_t)brake0_mapped & 0xFF;
  msg[3] = (uint8_t)(brake0_mapped >> 8) & 0xFF;
  msg[4] = (uint8_t)brake1_mapped & 0xFF;
  msg[5] = (uint8_t)(brake1_mapped >> 8) & 0xFF;

  // turn off interrupts while sending CAN message
  cli();

  // send the message
  CAN.sendMsgBuf(ID_DATA,0,7,msg);

  // reenable interrupts
  sei();
}

// 100Hz timer interrupt
ISR(TIMER0_COMPA_vect) {
    // take an average of the pedal values
    uint8_t pedal_avg = pedal0_mapped/2 + pedal1_mapped/2;

    // compute commanded torque (N-m * 10 [10x factor is how Rinehart expects it])
    // TODO(cullen): should this be a linear map?
    int16_t commanded_torque = map(pedal_avg, PEDAL_DEADBAND, 255, 0, 10*max_torque);

    if (pedal_avg < PEDAL_DEADBAND) {
        // enable coasting regen if pedal is below deadband
        commanded_torque = -10*coast_regen_torque;

        // also apply brake regen proportionally to brake pressure
        uint16_t brake_torque = brake_torque_multiplier * front_brake_pressure;
        commanded_torque -= brake_torque;
    }

    // if the vehicle is not ready to drive, set torque command to 0
    if (!ready_to_drive) {
        commanded_torque = 0;
    }

    // construct the rinehart message
    unsigned char msg[8] = {0,0,0,0,0,0,0,0};
    msg[0] = commanded_torque & 0xFF;
    msg[1] = commanded_torque >> 8;
    msg[2] = 0;
    msg[3] = 0,
    msg[4] = 0;  // 0 - "reverse", 1 - "forward" (CS4 drives forward with motor in "reverse" direction)
    msg[5] = ready_to_drive ? 1 : 0;
    msg[6] = 0; //(max_torque*10) & 0xFF,
    msg[7] = 0; //(max_torque*10) >> 8

    // turn off interrupts while sending CAN message
    cli();

    // send the message
    CAN.sendMsgBuf(ID_RINEHART_COMMAND, 0, 8, msg);

    // reenable interrupts
    sei();
}

void sampleBrake(){

  brake0 = analogRead(PIN_BRAKE0);
  brake1 = analogRead(PIN_BRAKE1);
  // map brake pressure sensors
  brake0_mapped = map(brake0, 0, 1024, 0, brake_pressure_max);
  brake1_mapped = map(brake1, 0, 1024, 0, brake_pressure_max);

  if (((brake0_mapped + brake1_mapped)/2) > BRAKE_THRESHOLD){
    brakeTrip = true;
  }

}