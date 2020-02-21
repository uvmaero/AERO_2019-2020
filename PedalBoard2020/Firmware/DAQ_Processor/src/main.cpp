/**
 *  Copyright 2020 George Spearing
 * 
 *  DAQ system 
 */

#include <Arduino.h>
#include <mcp_can.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <util/twi.h>
#include <avr/sfr_defs.h>
#include <avr/wdt.h>

#define DEBUG

// SEND CANbus address defines
#define ID_BASE 0x2D
#define ID_RESET ID_BASE
#define ID_DATA ID_BASE+5
#define ID_GET_PEDAL ID_BASE+6
#define ID_SET_PEDAL_BAND ID_BASE+7
#define ID_SET_TORQUE ID_BASE+8
#define ID_PRECHARGE_STATUS ID_BASE+9


// Rinehart CAN IDs
#define ID_RINEHART_COMMAND 0x0C0
#define ID_RINEHART_PARAM_REQUEST 0x0C1
#define ID_RINEHART_PARAM_RESPONSE 0x0C2
#define ID_RINEHART_DIGITAL_IN 0x0A4
#define ID_RINEHART_VOLTAGE 0x0A7


void setup() {
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
}