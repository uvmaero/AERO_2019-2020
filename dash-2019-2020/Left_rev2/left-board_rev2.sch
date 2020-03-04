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
L Device:LED D1
U 1 1 5DF93AE7
P 3875 3725
AR Path="/5DF93AE7" Ref="D1"  Part="1" 
AR Path="/5DF8F110/5DF93AE7" Ref="D?"  Part="1" 
F 0 "D1" H 3725 3825 50  0000 C CNN
F 1 "FAULT_IND_1" H 4125 3825 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 3875 3725 50  0001 C CNN
F 3 "~" H 3875 3725 50  0001 C CNN
	1    3875 3725
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5DF93AED
P 3875 3975
AR Path="/5DF93AED" Ref="D2"  Part="1" 
AR Path="/5DF8F110/5DF93AED" Ref="D?"  Part="1" 
F 0 "D2" H 3725 4075 50  0000 C CNN
F 1 "FAULT_IND_2" H 4125 4075 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 3875 3975 50  0001 C CNN
F 3 "~" H 3875 3975 50  0001 C CNN
	1    3875 3975
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5DF93AF3
P 3875 4225
AR Path="/5DF93AF3" Ref="D3"  Part="1" 
AR Path="/5DF8F110/5DF93AF3" Ref="D?"  Part="1" 
F 0 "D3" H 3725 4325 50  0000 C CNN
F 1 "FAULT_IND_3" H 4125 4325 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 3875 4225 50  0001 C CNN
F 3 "~" H 3875 4225 50  0001 C CNN
	1    3875 4225
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5DF93AF9
P 3725 3725
AR Path="/5DF93AF9" Ref="#PWR0106"  Part="1" 
AR Path="/5DF8F110/5DF93AF9" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 3725 3575 50  0001 C CNN
F 1 "+5V" V 3740 3853 50  0000 L CNN
F 2 "" H 3725 3725 50  0001 C CNN
F 3 "" H 3725 3725 50  0001 C CNN
	1    3725 3725
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5DF93AFF
P 3725 3975
AR Path="/5DF93AFF" Ref="#PWR0107"  Part="1" 
AR Path="/5DF8F110/5DF93AFF" Ref="#PWR?"  Part="1" 
F 0 "#PWR0107" H 3725 3825 50  0001 C CNN
F 1 "+5V" V 3740 4103 50  0000 L CNN
F 2 "" H 3725 3975 50  0001 C CNN
F 3 "" H 3725 3975 50  0001 C CNN
	1    3725 3975
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5DF93B05
P 3725 4225
AR Path="/5DF93B05" Ref="#PWR0108"  Part="1" 
AR Path="/5DF8F110/5DF93B05" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 3725 4075 50  0001 C CNN
F 1 "+5V" V 3740 4353 50  0000 L CNN
F 2 "" H 3725 4225 50  0001 C CNN
F 3 "" H 3725 4225 50  0001 C CNN
	1    3725 4225
	0    -1   1    0   
$EndComp
Wire Wire Line
	4025 4225 4575 4225
Wire Wire Line
	4025 3975 4575 3975
Text Label 4575 3725 2    50   ~ 0
~FAULT_IND_3
Wire Wire Line
	4575 3725 4025 3725
Text Label 4575 4225 2    50   ~ 0
~FAULT_IND_1
$Comp
L power:GND #PWR0109
U 1 1 5DD67590
P 5700 3700
F 0 "#PWR0109" H 5700 3450 50  0001 C CNN
F 1 "GND" V 5705 3572 50  0000 R CNN
F 2 "" H 5700 3700 50  0001 C CNN
F 3 "" H 5700 3700 50  0001 C CNN
	1    5700 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 3900 6250 3900
Text Label 6250 3900 2    50   ~ 0
~FAULT_IND_2
Wire Wire Line
	6250 4000 5700 4000
Text Label 6250 3600 2    50   ~ 0
~FAULT_IND_3
Text Label 6250 4000 2    50   ~ 0
~FAULT_IND_1
$Comp
L Mechanical:MountingHole H2
U 1 1 5DDB773D
P 4400 5350
F 0 "H2" H 4500 5396 50  0000 L CNN
F 1 "MountingHole" H 4500 5305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 4400 5350 50  0001 C CNN
F 3 "~" H 4400 5350 50  0001 C CNN
	1    4400 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5DDB98BF
P 4400 5100
F 0 "H1" H 4500 5146 50  0000 L CNN
F 1 "MountingHole" H 4500 5055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 4400 5100 50  0001 C CNN
F 3 "~" H 4400 5100 50  0001 C CNN
	1    4400 5100
	1    0    0    -1  
$EndComp
Text Label 4575 3975 2    50   ~ 0
~FAULT_IND_2
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5E5D5BD7
P 5500 3800
F 0 "J1" H 5418 4217 50  0000 C CNN
F 1 "B5B-PH-SM4-TB(LF)(SN)" H 5418 4126 50  0000 C CNN
F 2 "Connector_JST:JST_PH_S5B-PH-K_1x05_P2.00mm_Horizontal" H 5500 3800 50  0001 C CNN
F 3 "~" H 5500 3800 50  0001 C CNN
	1    5500 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5700 3800 6425 3800
$Comp
L power:+5V #PWR0110
U 1 1 5DD68AD3
P 6425 3800
F 0 "#PWR0110" H 6425 3650 50  0001 C CNN
F 1 "+5V" H 6440 3928 50  0000 L CNN
F 2 "" H 6425 3800 50  0001 C CNN
F 3 "" H 6425 3800 50  0001 C CNN
	1    6425 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3600 5700 3600
$EndSCHEMATC
