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
L Connector_Generic:Conn_01x02 J?
U 1 1 5E30ADE1
P 1300 850
F 0 "J?" H 1380 842 50  0000 L CNN
F 1 "HV INPUT" H 1380 751 50  0000 L CNN
F 2 "" H 1300 850 50  0001 C CNN
F 3 "~" H 1300 850 50  0001 C CNN
	1    1300 850 
	1    0    0    -1  
$EndComp
Text Label 1000 850  2    50   ~ 0
HV+
Wire Wire Line
	1100 850  1000 850 
Text Label 1000 950  2    50   ~ 0
HV-
Wire Wire Line
	1000 950  1100 950 
$Comp
L Regulator_Linear:LR8K4-G U?
U 1 1 5E30BDB6
P 2650 1450
F 0 "U?" H 2650 1717 50  0000 C CNN
F 1 "LR8K4-G" H 2650 1626 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 2650 1000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005399B.pdf" H 2650 1450 50  0001 C CNN
	1    2650 1450
	1    0    0    -1  
$EndComp
Text Label 2050 1450 2    50   ~ 0
HV+
Wire Wire Line
	2250 1450 2050 1450
$Comp
L Timer:LM555 U?
U 1 1 5E389A17
P 6850 2900
F 0 "U?" H 6500 3500 50  0000 C CNN
F 1 "LM555" H 6500 3400 50  0000 C CNN
F 2 "" H 6850 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 6850 2900 50  0001 C CNN
	1    6850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3100 6150 3100
Wire Wire Line
	5650 2500 5650 2800
$Comp
L Device:R R?
U 1 1 5E38B417
P 5650 2950
F 0 "R?" H 5720 2996 50  0000 L CNN
F 1 "R" H 5720 2905 50  0000 L CNN
F 2 "" V 5580 2950 50  0001 C CNN
F 3 "~" H 5650 2950 50  0001 C CNN
	1    5650 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E390E32
P 5650 3950
F 0 "C?" H 5765 3996 50  0000 L CNN
F 1 "C" H 5765 3905 50  0000 L CNN
F 2 "" H 5688 3800 50  0001 C CNN
F 3 "~" H 5650 3950 50  0001 C CNN
	1    5650 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 3350 5650 3200
$Comp
L Device:R R?
U 1 1 5E3A5E0B
P 5650 3500
F 0 "R?" H 5720 3546 50  0000 L CNN
F 1 "R" H 5720 3455 50  0000 L CNN
F 2 "" V 5580 3500 50  0001 C CNN
F 3 "~" H 5650 3500 50  0001 C CNN
	1    5650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4100 6250 4100
Wire Wire Line
	6250 4100 6250 4200
Connection ~ 6250 4100
Wire Wire Line
	6250 4100 5650 4100
$Comp
L power:GND #PWR?
U 1 1 5E3B23B0
P 6250 4200
F 0 "#PWR?" H 6250 3950 50  0001 C CNN
F 1 "GND" H 6255 4027 50  0000 C CNN
F 2 "" H 6250 4200 50  0001 C CNN
F 3 "" H 6250 4200 50  0001 C CNN
	1    6250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3300 6850 4100
Text Label 3250 1450 0    50   ~ 0
12V
Wire Wire Line
	3250 1450 3050 1450
Text Label 6850 2400 1    50   ~ 0
12V
Wire Wire Line
	6850 2400 6850 2500
Text Label 6150 3100 0    50   ~ 0
12V
Text Label 6150 2700 0    50   ~ 0
CAP
Wire Wire Line
	6150 2700 6350 2700
Text Label 7550 3100 2    50   ~ 0
CAP
Wire Wire Line
	7550 3100 7350 3100
Text Label 5950 3700 2    50   ~ 0
CAP
Wire Wire Line
	5950 3700 5650 3700
Wire Wire Line
	5650 3650 5650 3700
Connection ~ 5650 3700
Wire Wire Line
	5650 3700 5650 3800
Text Label 7550 2900 2    50   ~ 0
DIS
Wire Wire Line
	7550 2900 7350 2900
Text Label 5950 3200 2    50   ~ 0
DIS
Wire Wire Line
	5950 3200 5650 3200
Connection ~ 5650 3200
Wire Wire Line
	5650 3200 5650 3100
Text Label 5650 2500 3    50   ~ 0
12V
$EndSCHEMATC
