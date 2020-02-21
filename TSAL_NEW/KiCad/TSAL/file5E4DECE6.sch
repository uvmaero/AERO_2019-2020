EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Connector_Generic:Conn_01x35 J?
U 1 1 5E4E2831
P 4525 2725
F 0 "J?" H 4625 2150 50  0000 L CNN
F 1 "RineHart J1" V 4650 2525 50  0000 L CNN
F 2 "" H 4525 2725 50  0001 C CNN
F 3 "~" H 4525 2725 50  0001 C CNN
	1    4525 2725
	1    0    0    -1  
$EndComp
Text Label 3750 2025 0    50   ~ 0
CAN_A_LOW
Wire Wire Line
	3750 2025 4325 2025
Text Label 3750 2125 0    50   ~ 0
TXD
Wire Wire Line
	3750 2125 4325 2125
Text Label 3750 3125 0    50   ~ 0
GND
Wire Wire Line
	3750 3125 4325 3125
Text Label 3750 4225 0    50   ~ 0
CAN_A_HIGH
Wire Wire Line
	3750 4225 4325 4225
Text Label 3750 4425 0    50   ~ 0
RXD
Wire Wire Line
	3750 4425 4325 4425
$Comp
L Connector_Generic:Conn_01x23 J?
U 1 1 5E4EAF20
P 5750 2150
F 0 "J?" H 5830 2192 50  0000 L CNN
F 1 "RineHart J2" V 5875 1675 50  0000 L CNN
F 2 "" H 5750 2150 50  0001 C CNN
F 3 "~" H 5750 2150 50  0001 C CNN
	1    5750 2150
	1    0    0    -1  
$EndComp
Text Label 4875 1250 0    50   ~ 0
RSLV_RTN
Wire Wire Line
	4875 1250 5550 1250
Text Label 4875 1350 0    50   ~ 0
COS_P
Wire Wire Line
	4875 1350 5550 1350
Text Label 4875 1550 0    50   ~ 0
GND
Wire Wire Line
	5550 1550 4875 1550
Text Label 4875 1650 0    50   ~ 0
MAIN_RELAY
Wire Wire Line
	4875 1650 5550 1650
Text Label 4875 1750 0    50   ~ 0
12V+
Wire Wire Line
	4875 1750 5550 1750
Text Label 4875 1950 0    50   ~ 0
GND
Wire Wire Line
	4875 1950 5550 1950
Text Label 4875 2050 0    50   ~ 0
SIN_P
Wire Wire Line
	4875 2050 5550 2050
Text Label 4875 2150 0    50   ~ 0
COS_N
Wire Wire Line
	4875 2150 5550 2150
Text Label 4900 2650 0    50   ~ 0
EXC_OUT
Wire Wire Line
	4900 2650 5550 2650
Text Label 4900 2750 0    50   ~ 0
SIN_N
Wire Wire Line
	4900 2750 5550 2750
Text Label 4900 2850 0    50   ~ 0
GND
Wire Wire Line
	4900 2850 5550 2850
Text Label 4900 3050 0    50   ~ 0
RLY1_PRE-CHG
Text Label 4900 3250 0    50   ~ 0
12V+
Wire Wire Line
	4900 3250 5550 3250
Wire Wire Line
	4900 3050 5550 3050
Text Notes 4625 875  0    50   ~ 0
RineHart J1 and J2
Text Notes 8425 900  0    50   ~ 0
LV BOX
$EndSCHEMATC
