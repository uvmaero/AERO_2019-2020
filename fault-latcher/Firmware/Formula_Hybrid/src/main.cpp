/**
 * Copyright 2020, George Spearing, UVM AERO
 * 
 * Fault Latcher Code. 
 *  - Sends fault value over CAN
 *  - Read relay states for value
 *  - Buttons clear fault and close relay (if fault persists, relay stays open)
 * 
 */

#include <Arduino.h>
#include <mcp_can.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <util/twi.h>
#include <avr/sfr_defs.h>
#include <avr/wdt.h>

#define PIN_SPI_CAN_CS 9 // CAN chip

unsigned long lastSendDaqMessage = 0;

MCP_CAN CAN(PIN_SPI_CAN_CS);     // Set CS pin

// "Send" CANbus address defines
#define ID_FAULTLATCHER_FAULTS 0x79

#define DAQ_CAN_INTERVAL_MS 100

// Fault indicator pins 
#define PIN_BMS_IND 2
#define PIN_TMS1_IND 3
#define PIN_TMS2_IND 4
#define PIN_IMD_IND 5

// Fault States
// 1 is faulted 0 is clear
uint16_t BMS_Fault = 1; // BMS
uint16_t TMS1_Fault = 1; // Temp Pack1
uint16_t TMS2_Fault = 1; // Temp Pack2
uint16_t TMS_Fault = TMS1_Fault | TMS2_Fault; // TEMP Fault Either Pack 1 or Pack 2
uint16_t IMD_Fault = 1; // IMD

void sendDaqData();

void setup(){
  // pin mode setup
  pinMode(PIN_BMS_IND, INPUT);
  pinMode(PIN_TMS1_IND, INPUT);
  pinMode(PIN_TMS2_IND, INPUT);
  pinMode(PIN_IMD_IND, INPUT);

  //Initialize CANbus interface
  while (CAN_OK != CAN.begin(CAN_500KBPS)) { //Check we can talk to CAN
    lastSendDaqMessage = millis();
  }
}

void loop(){
  if(millis() > (lastSendDaqMessage + DAQ_CAN_INTERVAL_MS)){
    BMS_Fault = digitalRead(PIN_BMS_IND);
    TMS1_Fault = digitalRead(PIN_TMS1_IND);
    TMS2_Fault = digitalRead(PIN_TMS2_IND);
    IMD_Fault = digitalRead(PIN_IMD_IND);

    sendDaqData();
  }
}

void sendDaqData() {
  // turn off interrupts while sending CAN message
  cli();

  // Build DAQ data message
  unsigned char bufToSend[8] = {0, 0, 0, 0, 0, 0, 0, 0};
  bufToSend[0] = BMS_Fault;
  bufToSend[1] = TMS1_Fault;
  bufToSend[2] = TMS2_Fault; 
  bufToSend[3] = IMD_Fault;

  // send the message
  CAN.sendMsgBuf(ID_FAULTLATCHER_FAULTS, 0, 8, bufToSend);

  // reenable interrupts
  sei();

  lastSendDaqMessage = millis();
}

