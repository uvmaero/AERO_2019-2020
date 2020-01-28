EESchema Schematic File Version 4
LIBS:emrax-228-resolver-breakout-cache
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
L Connector_Generic:Conn_01x08 J1
U 1 1 5DD9EEA5
P 4150 3500
F 0 "J1" H 4300 3450 50  0000 C CNN
F 1 "AMPSEAL" H 4068 2966 50  0000 C CNN
F 2 "Connector_TE-AMPSEAL:TE_1-776280-1_8pin_Horizontal" H 4150 3500 50  0001 C CNN
F 3 "~" H 4150 3500 50  0001 C CNN
	1    4150 3500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 5DD9FB36
P 5550 3600
F 0 "J3" H 5700 3550 50  0000 C CNN
F 1 "RESOLVER" H 5550 3150 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B6B-PH-K_1x06_P2.00mm_Vertical" H 5550 3600 50  0001 C CNN
F 3 "~" H 5550 3600 50  0001 C CNN
	1    5550 3600
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5DDA0FAA
P 5550 2750
F 0 "J2" H 5650 2700 50  0000 L CNN
F 1 "THERMISTOR" H 5350 2900 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 5550 2750 50  0001 C CNN
F 3 "~" H 5550 2750 50  0001 C CNN
	1    5550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2750 4900 2750
Wire Wire Line
	5350 2850 4900 2850
Wire Wire Line
	5350 3300 5000 3300
Wire Wire Line
	5350 3400 5000 3400
Wire Wire Line
	5350 3500 5000 3500
Wire Wire Line
	5350 3600 5000 3600
Wire Wire Line
	5350 3700 5000 3700
$Comp
L power:GND #PWR0101
U 1 1 5DDA33F6
P 4450 3850
F 0 "#PWR0101" H 4450 3600 50  0001 C CNN
F 1 "GND" H 4455 3677 50  0000 C CNN
F 2 "" H 4450 3850 50  0001 C CNN
F 3 "" H 4450 3850 50  0001 C CNN
	1    4450 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3800 4450 3800
Wire Wire Line
	4450 3800 4450 3850
$Comp
L power:GND #PWR0102
U 1 1 5DDA3911
P 5250 3850
F 0 "#PWR0102" H 5250 3600 50  0001 C CNN
F 1 "GND" H 5255 3677 50  0000 C CNN
F 2 "" H 5250 3850 50  0001 C CNN
F 3 "" H 5250 3850 50  0001 C CNN
	1    5250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3800 5350 3800
Wire Wire Line
	5250 3850 5250 3800
Text Label 5000 3600 0    50   ~ 0
SIN+
Text Label 5000 3700 0    50   ~ 0
SIN-
Text Label 5000 3300 0    50   ~ 0
EXC+
Text Label 5000 3400 0    50   ~ 0
COS+
Text Label 5000 3500 0    50   ~ 0
COS-
Text Label 4900 2750 0    50   ~ 0
TEMP+
Text Label 4900 2850 0    50   ~ 0
TEMP-
Wire Wire Line
	4350 3400 4700 3400
Wire Wire Line
	4350 3600 4700 3600
Wire Wire Line
	4350 3300 4700 3300
Wire Wire Line
	4350 3700 4700 3700
Wire Wire Line
	4350 3500 4700 3500
Text Label 4700 3700 2    50   ~ 0
SIN+
Text Label 4700 3500 2    50   ~ 0
SIN-
Text Label 4700 3400 2    50   ~ 0
EXC+
Text Label 4700 3600 2    50   ~ 0
COS+
Text Label 4700 3300 2    50   ~ 0
COS-
Text Label 4700 3100 2    50   ~ 0
TEMP-
Text Label 4700 3200 2    50   ~ 0
TEMP+
Wire Wire Line
	4350 3200 4700 3200
Wire Wire Line
	4700 3100 4350 3100
$EndSCHEMATC
