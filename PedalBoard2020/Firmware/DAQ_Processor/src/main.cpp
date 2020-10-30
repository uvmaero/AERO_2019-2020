/**
 *  Copyright 2020 George Spearing
 * 
 *  Pedal board
 */

#include <Arduino.h>
#include <mcp2515.h>

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

// DASH CAN ID
#define ID_DASH 0x6A
#define ID_DASH_DAQ 0x1C

// Maximum number of missed messages before canceling precharge
#define MAX_MISSED_EMUS_MESSAGES 10
#define MAX_MISSED_RINEHART_MESSAGES 100

// Number of ADC samples to wait before sampling. This lets the sensor pull the device
// to the expected voltage in time.
#define NUM_SAMPLES 10

// EMUS CAN IDs
#define ID_EMUS_VOLTAGE 0x2A8

// Rinehart pins
#define RINEHART_PIN_TSMS 4
#define RINEHART_PIN_PRECHARGE 0
#define RINEHART_PIN_MAIN_CONT 1
#define RINEHART_PIN_RTDS 2

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

// precharge coefficient -- rinehart voltage must be more than emus voltage * coefficient
// in order to finish precharge
#define PRECHARGE_COEFFICIENT 0.9

// RTDS souding period (ms)
#define RTDS_PERIOD 2000

#define PIN_SPI_CAN_CS 5

// Set CS pin
MCP2515 mcp2515(10);

uint16_t brake_pressure_max = 3000;

// dampers
// damper position
uint16_t damper_left=0,damper_right=0;
#define NUM_DAMPER_ADC_SAMPLES         10
#define DAMPER_ADC_SAMPLES_DELAY_US    5
#define PIN_DAMPER_RIGHT      A1
#define PIN_DAMPER_LEFT       A2

// pedal ranges -- these are all defaults; they will be updated from the EEPROM on boot
uint16_t pedal0_min = 189;
uint16_t pedal0_max = 849;
uint16_t pedal1_min = 91;
uint16_t pedal1_max = 417;

// raw ADC values from each sensor
uint16_t pedal0=0, pedal1=0, brake0=0, brake1=0, steer=0;

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
uint8_t lastSendDaqMessage = 0;
uint8_t daqMessageInterval = 500;

uint8_t cycles_since_last_emus_message = 0;
uint8_t cycles_since_last_rinehart_message = MAX_MISSED_RINEHART_MESSAGES;  // assume Rinehart connection hasn't been made yet

void sendDaqData();
void sampleDampers();

void setup() {
  
    mcp2515.reset();
    mcp2515.setBitrate(CAN_125KBPS, MCP_8MHZ);
    mcp2515.setLoopbackMode();


  // CAN bitrate = 250KBPS
    while (CAN_OK != CAN.begin(CAN_250KBPS)) { //Check we can talk to CAN
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
    if (millis()-lastSendDaqMessage > daqMessageInterval){
        sendDaqData();
    }
    lastSendDaqMessage = millis();
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
    struct can_frame damperMsg;
    damperMsg.can_id = ID_DATA;
    damperMsg.can_dlc = 4;
    damperMsg.data[0] = damper_left_mapped & 0xFF;
    damperMsg.data[1] = (damper_left_mapped >> 8) & 0xFF;
    damperMsg.data[2] = damper_right_mapped & 0xFF;
    damperMsg.data[3] = (damper_right_mapped >> 8) & 0xFF;

    // send the message
    mcp2515.sendMessage(&damperMsg);

    // reenable interrupts
    sei();
}


uint8_t send_rinehart_command(uint16_t param_addr, uint8_t rw, uint16_t data, uint16_t *data_out, uint8_t num_tries) {
    // create the command message
    struct can_frame command;
    command.can_id = ID_RINEHART_PARAM_REQUEST;
    command.can_dlc = 6;
    command.data[0] = param_addr & 0xFF;
    command.data[1] = (param_addr >> 8) & 0xFF;
    command.data[2] = rw;
    command.data[3] = 0x00;
    command.data[4] = data & 0xFF;
    command.data[5] = (data >> 8) & 0xFF;

    cli();
    mcp2515.sendMessage(&command);
    sei();

    for (int i = 0; i < num_tries; i++) {
        tCAN response;
        cli();
        if (mcp2515_get_message(&response)) {
            // if the CAN id matches, along with the param address and the success message, return 1
            if (response.id == ID_RINEHART_PARAM_RESPONSE &&
                (response.data[0] | (response.data[1] << 8)) == param_addr &&
                response.data[2] == 0x01) {
                if (data_out != NULL) {
                    *data_out = response.data[4] | (response.data[5] << 8);
                }
                return 1;
            }
        }
        sei();
    }
    return 0;
}

uint8_t set_rinehart_output(uint8_t value, uint8_t num_tries) {
    return send_rinehart_command(0x01, 0x01, 0x5500 | value, NULL, num_tries);
}

void set_precharge_state(enum precharge_state_e state) {
    precharge_state = state;
    precharge_state_enter = 1;
}

void control_precharge() {
    if (cycles_since_last_rinehart_message > MAX_MISSED_RINEHART_MESSAGES) {
        precharge_state = PRECHARGE_ERROR;
    }
    if (cycles_since_last_emus_message > MAX_MISSED_EMUS_MESSAGES) {
        precharge_state = PRECHARGE_ERROR;
    }
    // TODO: make sure outputs were set properly before doing a state change
    switch (precharge_state) {
        case PRECHARGE_OFF: {
            // if the state was just entered, try to turn off both rinehart outputs
            if (precharge_state_enter) {
                if (set_rinehart_output(0, 10)) {
                    precharge_state_enter = 0;
                }
            }

            // vehicle is no ready to drive
            ready_to_drive = false;

            // if TSMS is on, switch to PRECHARGE_ON
            if (rinehart_inputs & (1 << RINEHART_PIN_TSMS)) {
                set_precharge_state(PRECHARGE_ON);
            }
            break;
        }
        case PRECHARGE_ON: {
            if (precharge_state_enter) {
                if (set_rinehart_output(1 << RINEHART_PIN_PRECHARGE, 10)) {
                    precharge_state_enter = 0;
                }
            }

            // if TSMS is no longer on, switch back to PRECHARGE_OFF
            if (!(rinehart_inputs & (1 << RINEHART_PIN_TSMS))) {
                set_precharge_state(PRECHARGE_OFF);
            }

            // vehicle is not ready to drive
            ready_to_drive = false;

            if (rinehart_voltage > emus_voltage * PRECHARGE_COEFFICIENT) {
                set_precharge_state(PRECHARGE_DONE);
            }
            break;
        }
        case PRECHARGE_DONE: {
            if (precharge_state_enter) {
                if (set_rinehart_output((1 << RINEHART_PIN_MAIN_CONT) | (1 << RINEHART_PIN_PRECHARGE), 10)) {
                    precharge_state_enter = 0;
                }
            }

            // if TSMS is no longer on, switch back to PRECHARGE_OFF
            if (!(rinehart_inputs & (1 << RINEHART_PIN_TSMS))) {
                set_precharge_state(PRECHARGE_OFF);
            }
            break;
        }
        case PRECHARGE_ERROR: {
            // turn off Rinehart outputs
            set_rinehart_output(0, 10);
            
            // vehicle is no longer ready to drive
            ready_to_drive = false;

            // if both devices have been read from recently, return to PRECHARGE_OFF
            if (cycles_since_last_emus_message < MAX_MISSED_EMUS_MESSAGES && cycles_since_last_rinehart_message < MAX_MISSED_RINEHART_MESSAGES) {
                precharge_state = PRECHARGE_OFF;
            }
        }
    }

    // incrememnt misssed emus messages counter
    // if (cycles_since_last_emus_message <= MAX_MISSED_EMUS_MESSAGES) {
    //     cycles_since_last_emus_message++;
    // }

    // increment missed rinehart messages counter
    if (cycles_since_last_rinehart_message <= MAX_MISSED_RINEHART_MESSAGES) {
        cycles_since_last_rinehart_message++;
    }

    // send precharge message
    struct can_frame precharge_msg;
        precharge_msg.can_id = ID_PRECHARGE_STATUS;
        precharge_msg.can_dlc = 1;
        precharge_msg.data[0] = precharge_state;

    cli();
    mcp2515.sendMessage(&precharge_msg);
    sei();
}

// 10Hz timer interrupt
ISR(TIMER1_COMPA_vect) {
    // Control precharge
    control_precharge();

    // map the pedal
    pedal0_mapped = map(pedal0, pedal0_min, pedal0_max, 0, 255);
    pedal1_mapped = map(pedal1, pedal1_min, pedal1_max, 0, 255);

    // map brake pressure sensors
    uint16_t brake0_mapped = map(brake0, 0, 1024, 0, brake_pressure_max);
    uint16_t brake1_mapped = map(brake1, 0, 1024, 0, brake_pressure_max);

    // check for over/under-travel
    if (pedal0 > pedal0_max + 4*MAX_PEDAL_SKEW ||
        pedal0 < pedal0_min ||
        pedal1 > pedal1_max + 4*MAX_PEDAL_SKEW ||
        pedal1 < pedal1_min) {
            pedal0_mapped = 0;
            pedal1_mapped = 0;
    }

    // check for mismatch
    if (pedal0_mapped > pedal1_mapped + MAX_PEDAL_SKEW || pedal1_mapped > pedal0_mapped + MAX_PEDAL_SKEW) {
        pedal0_mapped = 0;
        pedal1_mapped = 0;
    }

    // construct the message
    struct can_frame msg;
    msg.can_id = ID_DATA;
    msg.can_dlc = 7;
    msg.data[0] = pedal0_mapped;
    msg.data[1] = pedal1_mapped;
    msg.data[2] = (uint8_t)brake0_mapped & 0xFF;
    msg.data[3] = (uint8_t)(brake0_mapped >> 8) & 0xFF;
    msg.data[4] = (uint8_t)brake1_mapped & 0xFF;
    msg.data[5] = (uint8_t)(brake1_mapped >> 8) & 0xFF;
    msg.data[6] = (uint8_t)(steer / 4);

    // turn off interrupts while sending CAN message
    cli();

    // send the message
    mcp2515.sendMessage(&msg);

    // reenable interrupts
    sei();

    if (ready_to_drive && precharge_state == PRECHARGE_DONE && time_since_rtds_start > RTDS_PERIOD && rtds_on) {
        set_rinehart_output((1 << RINEHART_PIN_MAIN_CONT) | (1 << RINEHART_PIN_PRECHARGE), 10);
        rtds_on = false;
    }

    if (ready_to_drive && time_since_rtds_start <= RTDS_PERIOD && rtds_on) {
        time_since_rtds_start += 100;
    }
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
    struct can_frame msg;
    msg.can_id = ID_RINEHART_COMMAND;
    msg.can_dlc = 8;
    msg.data[0] = commanded_torque & 0xFF;
    msg.data[1] = commanded_torque >> 8;
    msg.data[2] = 0;
    msg.data[3] = 0,
    msg.data[4] = 0;  // 0 - "reverse", 1 - "forward" (CS4 drives forward with motor in "reverse" direction)
    msg.data[5] = ready_to_drive ? 1 : 0;
    msg.data[6] = 0; //(max_torque*10) & 0xFF,
    msg.data[7] = 0; //(max_torque*10) >> 8

    // turn off interrupts while sending CAN message
    cli();

    // send the message
    mcp2515.sendMessage(&msg);

    // reenable interrupts
//     sei();
// }


