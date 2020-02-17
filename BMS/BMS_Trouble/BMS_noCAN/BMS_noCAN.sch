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
L Connector_Generic:Conn_02x11_Odd_Even J?
U 1 1 5E49C6E7
P 2900 2725
F 0 "J?" H 2950 2725 50  0000 C CNN
F 1 "22_PIN_CONNECTOR" H 2950 3351 50  0000 C CNN
F 2 "" H 2900 2725 50  0001 C CNN
F 3 "~" H 2900 2725 50  0001 C CNN
	1    2900 2725
	1    0    0    -1  
$EndComp
Text Label 3675 2225 2    50   ~ 0
+12V
Wire Wire Line
	3675 2225 3200 2225
Text Label 3675 2325 2    50   ~ 0
CELL_RX+
Wire Wire Line
	3675 2325 3200 2325
Text Label 3675 2425 2    50   ~ 0
CELL_TX+
Wire Wire Line
	3675 2425 3200 2425
Text Label 3675 2525 2    50   ~ 0
USB_PWR
Wire Wire Line
	3675 2525 3200 2525
Text Label 3675 2625 2    50   ~ 0
USB_D+
Wire Wire Line
	3675 2625 3200 2625
Text Label 3675 2725 2    50   ~ 0
DSP_TX
Wire Wire Line
	3675 2725 3200 2725
Text Label 3675 2825 2    50   ~ 0
HEATER
Wire Wire Line
	3200 2825 3675 2825
Text Label 3675 2925 2    50   ~ 0
BUZZER
Wire Wire Line
	3675 2925 3200 2925
Text Label 3675 3025 2    50   ~ 0
CHARGER
Wire Wire Line
	3675 3025 3200 3025
Text Label 3675 3125 2    50   ~ 0
IGN_IN
Wire Wire Line
	3675 3125 3200 3125
Text Label 3675 3225 2    50   ~ 0
CAN+
Wire Wire Line
	3675 3225 3200 3225
Text Label 2275 2225 0    50   ~ 0
GROUND
Wire Wire Line
	2275 2225 2700 2225
Text Label 2275 2325 0    50   ~ 0
CELL_RX-
Wire Wire Line
	2275 2325 2700 2325
Text Label 2275 2425 0    50   ~ 0
CELL_TX-
Wire Wire Line
	2275 2425 2700 2425
Text Label 2275 2525 0    50   ~ 0
GROUND
Wire Wire Line
	2275 2525 2700 2525
Text Label 2275 2625 0    50   ~ 0
USB_D-
Wire Wire Line
	2275 2625 2700 2625
Text Label 2275 2725 0    50   ~ 0
DSP_RX
Wire Wire Line
	2275 2725 2700 2725
Text Label 2275 2825 0    50   ~ 0
BAT_LOW
Wire Wire Line
	2275 2825 2700 2825
Text Label 2275 2925 0    50   ~ 0
CHG_IND
Wire Wire Line
	2275 2925 2700 2925
Text Label 2275 3025 0    50   ~ 0
FAST_CHG
Wire Wire Line
	2275 3025 2700 3025
Text Label 2275 3125 0    50   ~ 0
AC_SENSE
Wire Wire Line
	2275 3125 2700 3125
Text Label 2275 3225 0    50   ~ 0
CAN-
Wire Wire Line
	2275 3225 2700 3225
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5E4A3B9B
P 2900 3525
F 0 "J?" H 2950 3475 50  0000 C CNN
F 1 "8_PIN_CONNECTOR" H 2975 3200 50  0000 C CNN
F 2 "" H 2900 3525 50  0001 C CNN
F 3 "~" H 2900 3525 50  0001 C CNN
	1    2900 3525
	1    0    0    -1  
$EndComp
Text Label 3675 3425 2    50   ~ 0
SPEED_IN
Wire Wire Line
	3200 3425 3675 3425
Text Label 3675 3525 2    50   ~ 0
+5v_OUT
Wire Wire Line
	3675 3525 3200 3525
Text Label 3675 3625 2    50   ~ 0
INPUT_4
Wire Wire Line
	3200 3625 3675 3625
Text Label 3675 3725 2    50   ~ 0
INPUT_2
Wire Wire Line
	3675 3725 3200 3725
Text Label 2275 3425 0    50   ~ 0
SOC_OUT
Wire Wire Line
	2275 3425 2700 3425
Text Label 2275 3525 0    50   ~ 0
GROUND
Wire Wire Line
	2275 3525 2700 3525
Text Label 2275 3625 0    50   ~ 0
INPUT_3
Wire Wire Line
	2275 3625 2700 3625
Text Label 2275 3725 0    50   ~ 0
INPUT_1
Wire Wire Line
	2275 3725 2700 3725
Text Notes 2750 1800 0    50   ~ 0
BMS G1\nCONTROL UNIT
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 5E4AE01D
P 7200 2225
F 0 "J?" H 7280 2267 50  0000 L CNN
F 1 "Conn_01x04" H 7280 2176 50  0000 L CNN
F 2 "" H 7200 2225 50  0001 C CNN
F 3 "~" H 7200 2225 50  0001 C CNN
	1    7200 2225
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5E4AE797
P 7200 2500
F 0 "J?" H 7280 2492 50  0000 L CNN
F 1 "Conn_01x02" H 7280 2401 50  0000 L CNN
F 2 "" H 7200 2500 50  0001 C CNN
F 3 "~" H 7200 2500 50  0001 C CNN
	1    7200 2500
	1    0    0    -1  
$EndComp
Text Label 6450 2125 0    50   ~ 0
TOP_CELL+
Wire Wire Line
	6450 2125 7000 2125
Text Label 6450 2225 0    50   ~ 0
UP
Wire Wire Line
	6450 2225 7000 2225
Text Label 6450 2325 0    50   ~ 0
TOP_CELL-
Wire Wire Line
	6450 2325 7000 2325
Text Label 6475 2500 0    50   ~ 0
DN
Wire Wire Line
	6475 2500 7000 2500
Text Label 6475 2600 0    50   ~ 0
BOT_CELL
Wire Wire Line
	6475 2600 7000 2600
Text Notes 6550 1950 0    50   ~ 0
CELL GROUP MODULE\n
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BAAA6
P 5475 2550
F 0 "BT?" H 5593 2646 50  0001 L CNN
F 1 "Battery_Cell" H 5593 2555 50  0001 L CNN
F 2 "" V 5475 2610 50  0001 C CNN
F 3 "~" V 5475 2610 50  0001 C CNN
	1    5475 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BAEBF
P 5475 2850
F 0 "BT?" H 5593 2946 50  0001 L CNN
F 1 "Battery_Cell" H 5593 2855 50  0001 L CNN
F 2 "" V 5475 2910 50  0001 C CNN
F 3 "~" V 5475 2910 50  0001 C CNN
	1    5475 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BA49F
P 5475 2250
F 0 "BT?" H 5593 2346 50  0001 L CNN
F 1 "Battery_Cell" H 5593 2255 50  0001 L CNN
F 2 "" V 5475 2310 50  0001 C CNN
F 3 "~" V 5475 2310 50  0001 C CNN
	1    5475 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BA2E1
P 5475 1950
F 0 "BT?" H 5593 2046 50  0001 L CNN
F 1 "Battery_Cell" H 5593 1955 50  0001 L CNN
F 2 "" V 5475 2010 50  0001 C CNN
F 3 "~" V 5475 2010 50  0001 C CNN
	1    5475 1950
	1    0    0    -1  
$EndComp
Text Notes 5275 1600 0    50   ~ 0
BATTERY CELLS
Text GLabel 6250 3400 0    50   Input ~ 0
CAN+
Text GLabel 6250 3575 0    50   Input ~ 0
CAN-
Text GLabel 6250 3775 0    50   Input ~ 0
GND
Text Notes 5625 3700 0    50   ~ 0
CAN \nInterface\nDevice
Wire Notes Line
	6275 3300 5600 3300
Wire Notes Line
	5600 3300 5600 3850
Wire Notes Line
	5600 3850 6275 3850
Wire Notes Line
	6275 3850 6275 3300
$EndSCHEMATC
