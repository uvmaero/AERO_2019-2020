EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328P-AU U?
U 1 1 5E3AC359
P 2225 4725
F 0 "U?" H 2225 3136 50  0000 C CNN
F 1 "ATmega328P-AU" H 2225 3045 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 2225 4725 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2225 4725 50  0001 C CNN
	1    2225 4725
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:R-785.0-0.5 U?
U 1 1 5E3ADDD0
P 6175 7150
F 0 "U?" H 6175 7392 50  0000 C CNN
F 1 "R-785.0-0.5" H 6175 7301 50  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_RECOM_R-78E-0.5_THT" H 6225 6900 50  0001 L CIN
F 3 "https://www.recom-power.com/pdf/Innoline/R-78xx-0.5.pdf" H 6175 7150 50  0001 C CNN
	1    6175 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5E3AF0DA
P 4900 7175
F 0 "J?" H 4950 7492 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 4950 7401 50  0000 C CNN
F 2 "" H 4900 7175 50  0001 C CNN
F 3 "~" H 4900 7175 50  0001 C CNN
	1    4900 7175
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:MCP2551-I-SN U?
U 1 1 5E3B03CF
P 7550 4550
F 0 "U?" H 7550 5131 50  0000 C CNN
F 1 "MCP2551-I-SN" H 7550 5040 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7550 4050 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/21667d.pdf" H 7550 4550 50  0001 C CNN
	1    7550 4550
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:MCP2515-xSO U?
U 1 1 5E3B0E68
P 4875 4550
F 0 "U?" H 4875 5531 50  0000 C CNN
F 1 "MCP2515-xSO" H 4875 5440 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 4875 3650 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21801e.pdf" H 4975 3750 50  0001 C CNN
	1    4875 4550
	1    0    0    -1  
$EndComp
$Comp
L Relay:G5V-2 K?
U 1 1 5E3B3B27
P 3950 1875
F 0 "K?" V 4717 1875 50  0000 C CNN
F 1 "G5V-2" V 4626 1875 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Omron_G5V-2" H 4600 1825 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_2.pdf" H 3950 1875 50  0001 C CNN
	1    3950 1875
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5V-2 K?
U 1 1 5E3B4AD2
P 6075 1900
F 0 "K?" V 6842 1900 50  0000 C CNN
F 1 "G5V-2" V 6751 1900 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Omron_G5V-2" H 6725 1850 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_2.pdf" H 6075 1900 50  0001 C CNN
	1    6075 1900
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5V-2 K?
U 1 1 5E3B5A9C
P 8325 1950
F 0 "K?" V 9092 1950 50  0000 C CNN
F 1 "G5V-2" V 9001 1950 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Omron_G5V-2" H 8975 1900 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_2.pdf" H 8325 1950 50  0001 C CNN
	1    8325 1950
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5V-2 K?
U 1 1 5E3B69E6
P 9925 1950
F 0 "K?" V 10692 1950 50  0000 C CNN
F 1 "G5V-2" V 10601 1950 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Omron_G5V-2" H 10575 1900 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_2.pdf" H 9925 1950 50  0001 C CNN
	1    9925 1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x14 J?
U 1 1 5E3CBFD1
P 10150 5000
F 0 "J?" H 10230 4992 50  0000 L CNN
F 1 "Conn_01x14" H 10230 4901 50  0000 L CNN
F 2 "" H 10150 5000 50  0001 C CNN
F 3 "~" H 10150 5000 50  0001 C CNN
	1    10150 5000
	1    0    0    -1  
$EndComp
Text Label 9450 4400 0    50   ~ 0
LOOP_IN
Text Label 9450 4900 0    50   ~ 0
CAN-H
Text Label 9450 5100 0    50   ~ 0
CAN-L
Text Label 9450 5200 0    50   ~ 0
CAN-L
Text Label 9450 5000 0    50   ~ 0
CAN-H
Text Label 9450 4500 0    50   ~ 0
LOOP_OUT
Text Label 9450 5300 0    50   ~ 0
BMS_FAULT
Text Label 9450 5400 0    50   ~ 0
TMS1_FAULT
Text Label 9450 5500 0    50   ~ 0
TMS2_FAULT
Text Label 9450 5600 0    50   ~ 0
IMD_FAULT
$Comp
L power:+12V #PWR?
U 1 1 5E3D3477
P 9275 4600
F 0 "#PWR?" H 9275 4450 50  0001 C CNN
F 1 "+12V" H 9290 4773 50  0000 C CNN
F 2 "" H 9275 4600 50  0001 C CNN
F 3 "" H 9275 4600 50  0001 C CNN
	1    9275 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3D3A82
P 9275 4800
F 0 "#PWR?" H 9275 4550 50  0001 C CNN
F 1 "GND" H 9280 4627 50  0000 C CNN
F 2 "" H 9275 4800 50  0001 C CNN
F 3 "" H 9275 4800 50  0001 C CNN
	1    9275 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4400 9950 4400
Wire Wire Line
	9450 4500 9950 4500
Wire Wire Line
	9450 4900 9950 4900
Wire Wire Line
	9450 5000 9950 5000
Wire Wire Line
	9450 5100 9950 5100
Wire Wire Line
	9450 5200 9950 5200
Wire Wire Line
	9450 5300 9950 5300
Wire Wire Line
	9450 5400 9950 5400
Wire Wire Line
	9450 5500 9950 5500
Wire Wire Line
	9450 5600 9950 5600
Wire Wire Line
	9275 4600 9950 4600
Wire Wire Line
	9275 4800 9950 4800
Text Label 5525 7175 2    50   ~ 0
MOSI
Text Label 4350 7075 0    50   ~ 0
MISO
Text Label 4350 7175 0    50   ~ 0
SCK
Text Label 4350 7275 0    50   ~ 0
RESET
$Comp
L power:+12V #PWR?
U 1 1 5E3D8F61
P 5525 7075
F 0 "#PWR?" H 5525 6925 50  0001 C CNN
F 1 "+12V" H 5540 7248 50  0000 C CNN
F 2 "" H 5525 7075 50  0001 C CNN
F 3 "" H 5525 7075 50  0001 C CNN
	1    5525 7075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3D961B
P 5525 7275
F 0 "#PWR?" H 5525 7025 50  0001 C CNN
F 1 "GND" H 5530 7102 50  0000 C CNN
F 2 "" H 5525 7275 50  0001 C CNN
F 3 "" H 5525 7275 50  0001 C CNN
	1    5525 7275
	1    0    0    -1  
$EndComp
Wire Wire Line
	5525 7275 5200 7275
Wire Wire Line
	5525 7175 5200 7175
Wire Wire Line
	5525 7075 5200 7075
Wire Wire Line
	4350 7075 4700 7075
Wire Wire Line
	4350 7175 4700 7175
Wire Wire Line
	4350 7275 4700 7275
$EndSCHEMATC
