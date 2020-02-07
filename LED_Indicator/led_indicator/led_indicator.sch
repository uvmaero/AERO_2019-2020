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
L Device:LED_PAD D1
U 1 1 5E3B173C
P 3675 2775
F 0 "D1" H 3675 2962 50  0000 C CNN
F 1 "LED_PAD" H 3675 3053 50  0000 C CNN
F 2 "aero_footprint:LXML-PM01" H 3675 2775 50  0001 C CNN
F 3 "~" H 3675 2775 50  0001 C CNN
	1    3675 2775
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_PAD D3
U 1 1 5E3B1C57
P 4375 2775
F 0 "D3" H 4375 2962 50  0000 C CNN
F 1 "LED_PAD" H 4375 3053 50  0000 C CNN
F 2 "aero_footprint:LXML-PM01" H 4375 2775 50  0001 C CNN
F 3 "~" H 4375 2775 50  0001 C CNN
	1    4375 2775
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_PAD D2
U 1 1 5E3B23E8
P 3625 3450
F 0 "D2" H 3625 3637 50  0000 C CNN
F 1 "LED_PAD" H 3625 3728 50  0000 C CNN
F 2 "aero_footprint:LXML-PM01" H 3625 3450 50  0001 C CNN
F 3 "~" H 3625 3450 50  0001 C CNN
	1    3625 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3825 2775 4225 2775
$Comp
L Connector:TestPoint TP3
U 1 1 5E3B34FE
P 4775 2775
F 0 "TP3" H 4833 2893 50  0000 L CNN
F 1 "TestPoint" H 4900 3025 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 4975 2775 50  0001 C CNN
F 3 "~" H 4975 2775 50  0001 C CNN
	1    4775 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	4775 2775 4525 2775
Wire Wire Line
	3475 3450 3325 3450
$Comp
L Connector:TestPoint TP4
U 1 1 5E3B42D1
P 4800 3450
F 0 "TP4" H 4858 3568 50  0000 L CNN
F 1 "TestPoint" H 4900 3650 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 5000 3450 50  0001 C CNN
F 3 "~" H 5000 3450 50  0001 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5E3BA7A9
P 3325 3450
F 0 "TP2" H 3383 3568 50  0000 L CNN
F 1 "TestPoint" H 3383 3477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 3525 3450 50  0001 C CNN
F 3 "~" H 3525 3450 50  0001 C CNN
	1    3325 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5E3BC1D9
P 3300 2775
F 0 "TP1" H 3050 2950 50  0000 L CNN
F 1 "TestPoint" H 3000 3050 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 3500 2775 50  0001 C CNN
F 3 "~" H 3500 2775 50  0001 C CNN
	1    3300 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2775 3525 2775
$Comp
L Device:LED_PAD D4
U 1 1 5E3C7379
P 4325 3450
F 0 "D4" H 4325 3637 50  0000 C CNN
F 1 "LED_PAD" H 4325 3728 50  0000 C CNN
F 2 "aero_footprint:LXML-PM01" H 4325 3450 50  0001 C CNN
F 3 "~" H 4325 3450 50  0001 C CNN
	1    4325 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3775 3450 4175 3450
Wire Wire Line
	4475 3450 4800 3450
Text Label 3300 2775 2    50   ~ 0
R_IN
Text Label 3325 3450 2    50   ~ 0
G_IN
Text Label 4775 2775 0    50   ~ 0
R_OUT
Text Label 4800 3450 0    50   ~ 0
G_OUT
Text Label 3675 2575 0    50   ~ 0
THM
Text Label 4375 2575 0    50   ~ 0
THM
Text Label 3625 3250 0    50   ~ 0
THM
Text Label 4325 3250 0    50   ~ 0
THM
$EndSCHEMATC
