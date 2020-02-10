/**
 * Copyright 2020, George Spearing, UVM AERO
 * 
 * Fault Latcher Code. 
 *  - Reads faults over CAN
 *  - Set relay states in 'faulted' value
 *  - Buttons clear 'faulted' message
 * 
 */

#include <Arduino.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <util/twi.h>
#include <avr/sfr_defs.h>
#include <avr/wdt.h>
#include <avr/iom328p.h>
#include <avr/eeprom.h>
#include <avr/io.h>
#include "can_ids.h"
#include "defaults.h"
#include "global.h"
#include "mcp2515.h"
#include "mcp2515_defs.h"





// Pedal Board CAN IDs
#define ID_BASE 0X74
#define ID_RESET ID_BASE
#define ID_FAULT ID_BASE+5

// Fault indicator pins
#define PIN_BMS_IND 2
#define PIN_TMS1_IND 3
#define PIN_TMS2_IND 4
#define PIN_IMD_IND 5

void setup(){

  // set PB2 as output 
  DDRB |= (1<< PORTB2);

  // set pullups on fault inputs
  PORTD |= (1 << PIN_BMS_IND) | (1 << PIN_TMS1_IND) | (1 << PIN_TMS2_IND) | (1 << PIN_IMD_IND);

  // Initialize Timer for 10Hz interval
  TCCR1A = (1 << WGM01); // CTC Mode
  TCCR1B = (0x05 << CS10); // f_timer = f_cpu/1024 => 7812Hz
  OCR1A = 718 // set comparator A => f_out=10Hz
  TIMSK1 = (1 << OCIE1A); // enable comparator A interrupt

  // turn off interrupts while setting up MCP2515
  cli();

  // wait untill MCP2515 is initialized
  while (!mcp2515_init()) _delay_ms(100);

  // enable interrupts
  sei();

  // main application loop
  while(1) continue;
  
}

ISR(TIMER1_COMPA_vect){
  // read fault values
  uint8_t bms_fault = !bit_is_set(PIND, PIN_BMS_IND);
  uint8_t tms1_fault = !bit_is_set(PIND, PIN_TMS1_IND);
  uint8_t tms2_fault = !bit_is_set(PIND, PIN_TMS2_IND);
  uint8_t imd_fault = !bit_is_set(PIND, PIN_IMD_IND);

  // construct message
  tCAN msg = {
    .id = ID_FAULT,
    .header.rtr = false, 
    .header.length = 1,
    .data[0] = bms_fault | tms1_fault << 1 | tms2_fault << 2 | imd_fault << 3
  };
  // turn off interrupts while sending CAN message
  cli();

  // send message
  mcp2515_send_message(&msg);

  // renable interrupts
  sei();

  }