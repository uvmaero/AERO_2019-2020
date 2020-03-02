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
L Power_Protection:SP0502BAHT D1
U 1 1 5E92F356
P 8775 6025
AR Path="/5E92F356" Ref="D1"  Part="1" 
AR Path="/5E92554D/5E92F356" Ref="D?"  Part="1" 
F 0 "D1" H 8980 6071 50  0000 L CNN
F 1 "SP0502BAHT" H 8980 5980 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9000 5975 50  0001 L CNN
F 3 "http://www.littelfuse.com/~/media/files/littelfuse/technical%20resources/documents/data%20sheets/sp05xxba.pdf" H 8900 6150 50  0001 C CNN
	1    8775 6025
	1    0    0    -1  
$EndComp
Text Label 8850 5550 2    50   ~ 0
BMS_USB+
Text Label 8825 5650 2    50   ~ 0
BMS_USB-
Wire Wire Line
	8825 5650 8675 5650
Wire Wire Line
	8875 5825 8875 5550
Wire Wire Line
	8375 5550 8875 5550
Wire Wire Line
	8675 5650 8675 5825
Connection ~ 8675 5650
Wire Wire Line
	8675 5650 8375 5650
Text Label 8900 5350 2    50   ~ 0
BMS_USB_5V
Wire Wire Line
	8900 5350 8375 5350
$Comp
L power:GND #PWR015
U 1 1 5E92F366
P 8025 6050
AR Path="/5E92F366" Ref="#PWR015"  Part="1" 
AR Path="/5E92554D/5E92F366" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H 8025 5800 50  0001 C CNN
F 1 "GND" H 8030 5877 50  0000 C CNN
F 2 "" H 8025 6050 50  0001 C CNN
F 3 "" H 8025 6050 50  0001 C CNN
	1    8025 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7975 5950 8025 5950
Wire Wire Line
	8025 5950 8025 6050
Connection ~ 8025 5950
Wire Wire Line
	8025 5950 8075 5950
$Comp
L power:GND #PWR020
U 1 1 5E92F370
P 8775 6225
AR Path="/5E92F370" Ref="#PWR020"  Part="1" 
AR Path="/5E92554D/5E92F370" Ref="#PWR?"  Part="1" 
F 0 "#PWR020" H 8775 5975 50  0001 C CNN
F 1 "GND" H 8780 6052 50  0000 C CNN
F 2 "" H 8775 6225 50  0001 C CNN
F 3 "" H 8775 6225 50  0001 C CNN
	1    8775 6225
	1    0    0    -1  
$EndComp
$Comp
L Connector:RJ45 J6
U 1 1 5E92F376
P 9425 4425
AR Path="/5E92F376" Ref="J6"  Part="1" 
AR Path="/5E92554D/5E92F376" Ref="J?"  Part="1" 
F 0 "J6" H 9096 4429 50  0000 R CNN
F 1 "RJ45" H 9096 4520 50  0000 R CNN
F 2 "Connector_RJ:RJ45_OST_PJ012-8P8CX_Vertical" V 9425 4450 50  0001 C CNN
F 3 "~" V 9425 4450 50  0001 C CNN
	1    9425 4425
	1    0    0    1   
$EndComp
$Comp
L Connector:DB9_Female_MountingHoles J4
U 1 1 5E92F38B
P 4425 1550
AR Path="/5E92F38B" Ref="J4"  Part="1" 
AR Path="/5E92554D/5E92F38B" Ref="J?"  Part="1" 
F 0 "J4" H 4343 2242 50  0000 C CNN
F 1 "171-009-213R001" H 4343 2151 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-9_Female_Vertical_P2.77x2.84mm_MountingHoles" H 4425 1550 50  0001 C CNN
F 3 " ~" H 4425 1550 50  0001 C CNN
	1    4425 1550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5E92F391
P 5000 1150
AR Path="/5E92F391" Ref="#PWR019"  Part="1" 
AR Path="/5E92554D/5E92F391" Ref="#PWR?"  Part="1" 
F 0 "#PWR019" H 5000 900 50  0001 C CNN
F 1 "GND" H 5005 977 50  0000 C CNN
F 2 "" H 5000 1150 50  0001 C CNN
F 3 "" H 5000 1150 50  0001 C CNN
	1    5000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1150 4725 1150
Text Label 5300 1550 2    50   ~ 0
RINEHART_RX
Wire Wire Line
	5300 1550 4725 1550
Text Label 5300 1750 2    50   ~ 0
RINEHART_TX
Wire Wire Line
	5300 1750 4725 1750
$Comp
L power:GND #PWR016
U 1 1 5E92F39C
P 4425 2150
AR Path="/5E92F39C" Ref="#PWR016"  Part="1" 
AR Path="/5E92554D/5E92F39C" Ref="#PWR?"  Part="1" 
F 0 "#PWR016" H 4425 1900 50  0001 C CNN
F 1 "GND" H 4430 1977 50  0000 C CNN
F 2 "" H 4425 2150 50  0001 C CNN
F 3 "" H 4425 2150 50  0001 C CNN
	1    4425 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J5
U 1 1 5E92F3A2
P 8075 5550
AR Path="/5E92F3A2" Ref="J5"  Part="1" 
AR Path="/5E92554D/5E92F3A2" Ref="J?"  Part="1" 
F 0 "J5" H 8132 6017 50  0000 C CNN
F 1 "USB_B" H 8132 5926 50  0000 C CNN
F 2 "Connector_USB:USB_B_TE_5787834_Vertical" H 8225 5500 50  0001 C CNN
F 3 " ~" H 8225 5500 50  0001 C CNN
	1    8075 5550
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATmega:ATmega328P-AU U1
U 1 1 5E386332
P 2000 2775
F 0 "U1" H 1375 1075 50  0000 C CNN
F 1 "ATmega328P-AU" H 1475 1225 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 2000 2775 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2000 2775 50  0001 C CNN
	1    2000 2775
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5E395648
P 6150 7150
F 0 "#PWR017" H 6150 7000 50  0001 C CNN
F 1 "+5V" H 6165 7323 50  0000 C CNN
F 2 "" H 6150 7150 50  0001 C CNN
F 3 "" H 6150 7150 50  0001 C CNN
	1    6150 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E395DE1
P 6150 7350
F 0 "#PWR018" H 6150 7100 50  0001 C CNN
F 1 "GND" H 6155 7177 50  0000 C CNN
F 2 "" H 6150 7350 50  0001 C CNN
F 3 "" H 6150 7350 50  0001 C CNN
	1    6150 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1875 3000 1875
Wire Wire Line
	2600 1975 3000 1975
Wire Wire Line
	2600 2075 3000 2075
Wire Wire Line
	2600 3775 3025 3775
Wire Wire Line
	2600 3475 3025 3475
Text Label 3025 3475 2    50   ~ 0
CAN_INT
Text Label 3025 3775 2    50   ~ 0
CAN_CS
Text Label 3000 1875 2    50   ~ 0
MOSI
Text Label 3000 1975 2    50   ~ 0
MISO
Text Label 3000 2075 2    50   ~ 0
SCK
Text Label 3025 3075 2    50   ~ 0
RESET
Wire Wire Line
	3025 3075 2600 3075
$Comp
L Device:C C3
U 1 1 5E3D9506
P 1025 1750
F 0 "C3" H 1140 1796 50  0000 L CNN
F 1 "0.1u" H 1140 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1063 1600 50  0001 C CNN
F 3 "~" H 1025 1750 50  0001 C CNN
	1    1025 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1575 1025 1575
Wire Wire Line
	1025 1575 1025 1600
$Comp
L power:GND #PWR02
U 1 1 5E3DB206
P 1025 1900
F 0 "#PWR02" H 1025 1650 50  0001 C CNN
F 1 "GND" H 1030 1727 50  0000 C CNN
F 2 "" H 1025 1900 50  0001 C CNN
F 3 "" H 1025 1900 50  0001 C CNN
	1    1025 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5E3DBFAD
P 1000 1125
F 0 "C2" H 1115 1171 50  0000 L CNN
F 1 "0.1u" H 1115 1080 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1038 975 50  0001 C CNN
F 3 "~" H 1000 1125 50  0001 C CNN
	1    1000 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 975  2050 1275
Wire Wire Line
	2050 1275 2000 1275
Wire Wire Line
	2100 1275 2050 1275
Connection ~ 2050 1275
$Comp
L power:GND #PWR01
U 1 1 5E3F56B9
P 1000 1275
F 0 "#PWR01" H 1000 1025 50  0001 C CNN
F 1 "GND" H 1005 1102 50  0000 C CNN
F 2 "" H 1000 1275 50  0001 C CNN
F 3 "" H 1000 1275 50  0001 C CNN
	1    1000 1275
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5E3F472C
P 2050 975
F 0 "#PWR05" H 2050 825 50  0001 C CNN
F 1 "+5V" H 2065 1148 50  0000 C CNN
F 2 "" H 2050 975 50  0001 C CNN
F 3 "" H 2050 975 50  0001 C CNN
	1    2050 975 
	1    0    0    -1  
$EndComp
Connection ~ 2050 975 
Wire Wire Line
	3000 2475 2600 2475
Wire Wire Line
	3000 2675 2600 2675
$Comp
L power:GND #PWR04
U 1 1 5E4F613C
P 2000 4425
F 0 "#PWR04" H 2000 4175 50  0001 C CNN
F 1 "GND" H 2005 4252 50  0000 C CNN
F 2 "" H 2000 4425 50  0001 C CNN
F 3 "" H 2000 4425 50  0001 C CNN
	1    2000 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4275 2000 4425
Wire Wire Line
	3025 3575 2600 3575
Wire Wire Line
	3025 3675 2600 3675
Wire Wire Line
	3025 3975 2600 3975
Wire Wire Line
	3025 3875 2600 3875
Text Label 3025 3575 2    50   ~ 0
Sensor_1
Text Label 3025 3675 2    50   ~ 0
Sensor_2
Text Label 3025 3875 2    50   ~ 0
Sensor_3
Text Label 3025 3975 2    50   ~ 0
Sensor_4
Text Label 3000 1575 2    50   ~ 0
Sensor_5
Text Label 3000 1675 2    50   ~ 0
Sensor_6
$Comp
L Connector_Generic:Conn_01x23 J10
U 1 1 5E5779A1
P 10825 1925
F 0 "J10" H 10905 1967 50  0000 L CNN
F 1 "TE 776228-1" V 10975 2525 50  0000 L CNN
F 2 "AERO_CUSTOM:TE_1-776200-1_23pin_Vertical" H 10825 1925 50  0001 C CNN
F 3 "~" H 10825 1925 50  0001 C CNN
	1    10825 1925
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Counter_Clockwise J8
U 1 1 5E5B056E
P 8450 2775
F 0 "J8" H 8500 3192 50  0000 C CNN
F 1 "B12B-PUDSS-1(LF)(SN)" H 8500 3101 50  0000 C CNN
F 2 "Connector_JST:JST_PHD_B12B-PHDSS_2x06_P2.00mm_Vertical" H 8450 2775 50  0001 C CNN
F 3 "~" H 8450 2775 50  0001 C CNN
	1    8450 2775
	1    0    0    -1  
$EndComp
Text Label 9275 2975 2    50   ~ 0
BMS_USB+
Text Label 7550 3075 0    50   ~ 0
BMS_USB-
Wire Wire Line
	7650 2775 8250 2775
Text Label 9275 3075 2    50   ~ 0
BMS_FAULT
Text Label 7650 2975 0    50   ~ 0
CAN+
Wire Wire Line
	7650 2975 8250 2975
$Comp
L power:GND #PWR025
U 1 1 5E5C1626
P 7350 2700
F 0 "#PWR025" H 7350 2450 50  0001 C CNN
F 1 "GND" H 7355 2527 50  0000 C CNN
F 2 "" H 7350 2700 50  0001 C CNN
F 3 "" H 7350 2700 50  0001 C CNN
	1    7350 2700
	1    0    0    -1  
$EndComp
Text Label 7650 2775 0    50   ~ 0
CAN-
Wire Wire Line
	9275 2875 8750 2875
Text Label 7550 2875 0    50   ~ 0
BMS_USB_5V
Wire Wire Line
	9275 2975 8750 2975
Wire Wire Line
	9425 2775 8750 2775
Wire Wire Line
	10050 2125 10625 2125
Wire Wire Line
	10050 2925 10625 2925
Wire Wire Line
	10050 1325 10625 1325
Wire Wire Line
	10050 2025 10625 2025
Wire Wire Line
	10625 2825 10050 2825
Wire Wire Line
	10625 2725 10050 2725
Text Label 10050 2825 0    50   ~ 0
Sensor_1
Text Label 10050 2225 0    50   ~ 0
Sensor_2
Text Label 10050 2025 0    50   ~ 0
Sensor_3
Text Label 10050 1325 0    50   ~ 0
Sensor_4
Text Label 10050 2925 0    50   ~ 0
Sensor_5
Text Label 10050 2125 0    50   ~ 0
Sensor_6
Text Label 3000 2475 2    50   ~ 0
Sensor_8
Text Label 3000 1775 2    50   ~ 0
Sensor_7
Wire Wire Line
	10625 2225 10050 2225
Text Label 10050 2625 0    50   ~ 0
CAN+
Wire Wire Line
	10050 1425 10625 1425
Wire Wire Line
	10050 1525 10625 1525
Wire Wire Line
	10050 3025 10625 3025
Text Label 10050 1525 0    50   ~ 0
Sensor_8
Wire Wire Line
	10050 2625 10625 2625
Text Label 10050 2725 0    50   ~ 0
CAN-
Wire Wire Line
	10050 1925 10625 1925
$Comp
L power:GND #PWR026
U 1 1 5E62FDAB
P 9875 1225
F 0 "#PWR026" H 9875 975 50  0001 C CNN
F 1 "GND" H 9880 1052 50  0000 C CNN
F 2 "" H 9875 1225 50  0001 C CNN
F 3 "" H 9875 1225 50  0001 C CNN
	1    9875 1225
	1    0    0    -1  
$EndComp
Wire Wire Line
	9875 1225 10625 1225
Wire Wire Line
	10625 1125 9875 1125
Wire Wire Line
	9875 1125 9875 1225
Connection ~ 9875 1225
Wire Wire Line
	10625 1025 9875 1025
Wire Wire Line
	9875 1025 9875 1125
Connection ~ 9875 1125
Wire Wire Line
	10625 925  9875 925 
Wire Wire Line
	9875 925  9875 1025
Connection ~ 9875 1025
Text Label 10050 1625 0    50   ~ 0
RINEHART_RX
Wire Wire Line
	10050 2425 10625 2425
Text Label 10050 825  0    50   ~ 0
RINEHART_TX
Wire Wire Line
	10050 2325 10625 2325
Text Label 10050 2525 0    50   ~ 0
BMS_FAULT
Wire Wire Line
	10050 1725 10625 1725
Text Label 10050 1825 0    50   ~ 0
CAN+
Wire Wire Line
	10050 2525 10625 2525
Text Label 10050 1925 0    50   ~ 0
CAN-
Wire Wire Line
	10050 1825 10625 1825
$Comp
L Connector_Generic:Conn_01x06 J7
U 1 1 5E685331
P 9175 1250
F 0 "J7" H 9225 1567 50  0000 C CNN
F 1 "B6B-XH-A(LF)(SN)" H 9225 1650 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B6B-PH-K_1x06_P2.00mm_Vertical" H 9175 1250 50  0001 C CNN
F 3 "~" H 9175 1250 50  0001 C CNN
	1    9175 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 5E68B39B
P 8550 1250
F 0 "#PWR022" H 8550 1100 50  0001 C CNN
F 1 "+5V" H 8565 1423 50  0000 C CNN
F 2 "" H 8550 1250 50  0001 C CNN
F 3 "" H 8550 1250 50  0001 C CNN
	1    8550 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR021
U 1 1 5E694921
P 8375 1350
F 0 "#PWR021" H 8375 1200 50  0001 C CNN
F 1 "+12V" H 8390 1523 50  0000 C CNN
F 2 "" H 8375 1350 50  0001 C CNN
F 3 "" H 8375 1350 50  0001 C CNN
	1    8375 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9825 4125 10325 4125
Wire Wire Line
	9825 4225 10325 4225
Wire Wire Line
	9825 4325 10325 4325
Wire Wire Line
	9825 4425 10325 4425
Wire Wire Line
	9825 4525 10325 4525
Wire Wire Line
	9825 4625 10325 4625
Wire Wire Line
	9825 4725 10325 4725
Wire Wire Line
	9825 4825 10325 4825
$Comp
L power:+12V #PWR024
U 1 1 5E6CC3D5
P 9425 2775
F 0 "#PWR024" H 9425 2625 50  0001 C CNN
F 1 "+12V" H 9440 2948 50  0000 C CNN
F 2 "" H 9425 2775 50  0001 C CNN
F 3 "" H 9425 2775 50  0001 C CNN
	1    9425 2775
	1    0    0    -1  
$EndComp
Text Label 8675 1050 0    50   ~ 0
SDA
Wire Wire Line
	8675 1050 8975 1050
Text Label 8675 1150 0    50   ~ 0
SCL
Wire Wire Line
	8675 1150 8975 1150
Text Label 3000 2975 2    50   ~ 0
SCL
Text Label 3000 2875 2    50   ~ 0
SDA
Wire Wire Line
	3000 1775 2600 1775
Wire Wire Line
	3000 1675 2600 1675
Wire Wire Line
	3000 1575 2600 1575
$Comp
L power:GND #PWR023
U 1 1 5E734B03
P 8775 1700
F 0 "#PWR023" H 8775 1450 50  0001 C CNN
F 1 "GND" H 8780 1527 50  0000 C CNN
F 2 "" H 8775 1700 50  0001 C CNN
F 3 "" H 8775 1700 50  0001 C CNN
	1    8775 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 1550 8775 1700
Text Notes 9800 3875 0    50   ~ 0
Pass Through for\nLOGIC Ethernet\n
Text Notes 9050 750  0    50   ~ 0
Jumper from\nLVPDU
Text Notes 8300 2300 0    50   ~ 0
OUTPUT\nTo BMS Unit
Text Notes 8375 5150 0    50   ~ 0
USB Port \nfor BMS
Text Notes 4350 750  0    50   ~ 0
Serial Port\nfor RineHart
Text Notes 10100 625  0    50   ~ 0
Main Ampseal
Text Label 9250 2675 2    50   ~ 0
EMUS_Curr2
Text Label 10050 2325 0    50   ~ 0
EMUS_Curr1
Text Notes 10100 3375 0    50   ~ 0
EMUS TX- is for \nEMUS Current Monitor RX
Wire Wire Line
	10625 1625 10050 1625
Wire Wire Line
	10625 825  10050 825 
$Comp
L Device:R R1
U 1 1 5E55ED38
P 3325 2700
F 0 "R1" H 3395 2746 50  0000 L CNN
F 1 "2.2k" H 3395 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3255 2700 50  0001 C CNN
F 3 "~" H 3325 2700 50  0001 C CNN
	1    3325 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E55F3A2
P 3675 2700
F 0 "R3" H 3745 2746 50  0000 L CNN
F 1 "2.2k" H 3745 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3605 2700 50  0001 C CNN
F 3 "~" H 3675 2700 50  0001 C CNN
	1    3675 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3325 2875 3325 2850
Wire Wire Line
	2600 2875 3325 2875
Wire Wire Line
	3675 2975 3675 2850
Wire Wire Line
	2600 2975 3675 2975
$Comp
L power:+5V #PWR09
U 1 1 5E56B20C
P 3500 2475
F 0 "#PWR09" H 3500 2325 50  0001 C CNN
F 1 "+5V" H 3515 2648 50  0000 C CNN
F 2 "" H 3500 2475 50  0001 C CNN
F 3 "" H 3500 2475 50  0001 C CNN
	1    3500 2475
	1    0    0    -1  
$EndComp
Wire Wire Line
	3325 2550 3500 2550
Wire Wire Line
	3500 2550 3500 2475
Wire Wire Line
	3675 2550 3500 2550
Connection ~ 3500 2550
$Comp
L Device:C C1
U 1 1 5E57AAC9
P 700 1125
F 0 "C1" H 815 1171 50  0000 L CNN
F 1 "0.1u" H 815 1080 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 738 975 50  0001 C CNN
F 3 "~" H 700 1125 50  0001 C CNN
	1    700  1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  975  1000 975 
Connection ~ 1000 975 
Wire Wire Line
	1000 975  2050 975 
Wire Wire Line
	1000 1275 700  1275
Connection ~ 1000 1275
$Comp
L Connector:DB9_Male_MountingHoles J1
U 1 1 5E589081
P 6550 1600
F 0 "J1" H 6525 2350 50  0000 L CNN
F 1 "171-009-113R001" H 6150 2225 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Vertical_P2.77x2.84mm_MountingHoles" H 6550 1600 50  0001 C CNN
F 3 " ~" H 6550 1600 50  0001 C CNN
	1    6550 1600
	1    0    0    -1  
$EndComp
Text Notes 6325 775  0    50   ~ 0
Serial for IMU
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5E595554
P 7850 1125
F 0 "J2" H 7900 1442 50  0000 C CNN
F 1 "B3B-PH-K-S(LF)(SN)" H 7900 1351 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 7850 1125 50  0001 C CNN
F 3 "~" H 7850 1125 50  0001 C CNN
	1    7850 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 1550 8975 1550
Wire Wire Line
	8775 1550 8775 1450
Wire Wire Line
	8775 1450 8975 1450
Connection ~ 8775 1550
Wire Wire Line
	8375 1350 8975 1350
Wire Wire Line
	8550 1250 8975 1250
$Comp
L power:GND #PWR012
U 1 1 5E5F7A90
P 7475 1225
F 0 "#PWR012" H 7475 975 50  0001 C CNN
F 1 "GND" H 7480 1052 50  0000 C CNN
F 2 "" H 7475 1225 50  0001 C CNN
F 3 "" H 7475 1225 50  0001 C CNN
	1    7475 1225
	1    0    0    -1  
$EndComp
Wire Wire Line
	7475 1225 7650 1225
Wire Wire Line
	7250 1025 7650 1025
Wire Wire Line
	7250 1125 7650 1125
Text Notes 7475 775  0    50   ~ 0
IMU pass through\nto LOGIC
Text Label 2975 2175 2    50   ~ 0
CLK
Wire Wire Line
	2975 2175 2600 2175
Text Notes 9850 5525 0    50   ~ 0
fan control\n
Text Label 3000 2675 2    50   ~ 0
FAN_SIG
Text Label 9675 5725 0    50   ~ 0
FAN_SIG
Wire Wire Line
	9675 5725 10125 5725
$Comp
L Device:R R5
U 1 1 5E5C2565
P 10125 5875
F 0 "R5" H 10195 5921 50  0000 L CNN
F 1 "100" H 10195 5830 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10055 5875 50  0001 C CNN
F 3 "~" H 10125 5875 50  0001 C CNN
	1    10125 5875
	1    0    0    -1  
$EndComp
Connection ~ 10125 5725
Wire Wire Line
	10125 5725 10275 5725
$Comp
L power:GND #PWR0101
U 1 1 5E5C32FB
P 10575 6150
F 0 "#PWR0101" H 10575 5900 50  0001 C CNN
F 1 "GND" H 10580 5977 50  0000 C CNN
F 2 "" H 10575 6150 50  0001 C CNN
F 3 "" H 10575 6150 50  0001 C CNN
	1    10575 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10125 6025 10125 6150
Wire Wire Line
	10125 6150 10575 6150
Wire Wire Line
	10575 6150 10575 5925
Connection ~ 10575 6150
Text Label 10575 5300 0    50   ~ 0
FAN_OUT
Wire Wire Line
	10575 5300 10575 5525
Text Label 10050 3025 0    50   ~ 0
FAN_OUT
$Comp
L Transistor_FET:PSMN5R2-60YL Q1
U 1 1 5E5DFCCF
P 10475 5725
F 0 "Q1" H 10680 5771 50  0000 L CNN
F 1 "PSMN5R2-60YL" H 10680 5680 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:LFPAK56" H 10625 5725 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PSMN5R2-60YL.pdf" H 10475 5725 50  0001 C CNN
	1    10475 5725
	1    0    0    -1  
$EndComp
Text Label 10050 1425 0    50   ~ 0
Sensor_7
Text Label 10050 2425 0    50   ~ 0
EMUS_Curr2
Text Label 9250 2575 2    50   ~ 0
EMUS_Curr1
Text Label 10050 1725 0    50   ~ 0
EMUS_Curr3
Text Label 9275 2875 2    50   ~ 0
EMUS_Curr3
Wire Wire Line
	9275 3075 8750 3075
Wire Wire Line
	9250 2575 8750 2575
Wire Wire Line
	9250 2675 8750 2675
Wire Wire Line
	7550 3075 8250 3075
Wire Wire Line
	7550 2875 8250 2875
$Comp
L power:GND #PWR0102
U 1 1 5E5CDF08
P 5925 1200
F 0 "#PWR0102" H 5925 950 50  0001 C CNN
F 1 "GND" H 5930 1027 50  0000 C CNN
F 2 "" H 5925 1200 50  0001 C CNN
F 3 "" H 5925 1200 50  0001 C CNN
	1    5925 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5925 1200 6250 1200
$Comp
L Interface_UART:MAX232 U4
U 1 1 5E5F24F6
P 5725 3600
F 0 "U4" V 6000 4825 50  0000 L CNN
F 1 "MAX232" V 6150 4775 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5775 2550 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 5725 3700 50  0001 C CNN
	1    5725 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 6775 1925 6775
Text Label 1925 6775 0    50   ~ 0
CLK
Text Label 5725 6075 2    50   ~ 0
CAN-
Text Label 5725 5875 2    50   ~ 0
CAN+
Connection ~ 4750 6375
$Comp
L power:GND #PWR014
U 1 1 5E539AEC
P 4750 6375
F 0 "#PWR014" H 4750 6125 50  0001 C CNN
F 1 "GND" H 4755 6202 50  0000 C CNN
F 2 "" H 4750 6375 50  0001 C CNN
F 3 "" H 4750 6375 50  0001 C CNN
	1    4750 6375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E538D42
P 2750 7175
F 0 "#PWR08" H 2750 6925 50  0001 C CNN
F 1 "GND" H 2755 7002 50  0000 C CNN
F 2 "" H 2750 7175 50  0001 C CNN
F 3 "" H 2750 7175 50  0001 C CNN
	1    2750 7175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4175 6375 4750 6375
Wire Wire Line
	4175 6175 4175 6375
Wire Wire Line
	4250 6175 4175 6175
Wire Wire Line
	1500 6675 1500 7075
Wire Wire Line
	5250 6075 5725 6075
Wire Wire Line
	5725 6125 5850 6125
Wire Wire Line
	5725 6075 5725 6125
Wire Wire Line
	5250 5875 5725 5875
Wire Wire Line
	5725 5825 5725 5875
Wire Wire Line
	5850 5825 5725 5825
$Comp
L Device:R R4
U 1 1 5E3AF9C1
P 5850 5975
F 0 "R4" H 5920 6021 50  0000 L CNN
F 1 "120" H 5920 5930 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5780 5975 50  0001 C CNN
F 3 "~" H 5850 5975 50  0001 C CNN
	1    5850 5975
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6375 3350 6375
Text Label 3750 6375 2    50   ~ 0
CAN_INT
Connection ~ 4750 5050
$Comp
L power:+5V #PWR013
U 1 1 5E3F1A89
P 4750 5050
F 0 "#PWR013" H 4750 4900 50  0001 C CNN
F 1 "+5V" H 4765 5223 50  0000 C CNN
F 2 "" H 4750 5050 50  0001 C CNN
F 3 "" H 4750 5050 50  0001 C CNN
	1    4750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5050 4750 5575
Wire Wire Line
	4475 5050 4750 5050
$Comp
L power:GND #PWR011
U 1 1 5E3F0299
P 4475 5350
F 0 "#PWR011" H 4475 5100 50  0001 C CNN
F 1 "GND" H 4480 5177 50  0000 C CNN
F 2 "" H 4475 5350 50  0001 C CNN
F 3 "" H 4475 5350 50  0001 C CNN
	1    4475 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E3EFBEB
P 4475 5200
F 0 "C5" H 4590 5246 50  0000 L CNN
F 1 "0.1u" H 4590 5155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4513 5050 50  0001 C CNN
F 3 "~" H 4475 5200 50  0001 C CNN
	1    4475 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E3EED26
P 2100 5275
F 0 "#PWR06" H 2100 5025 50  0001 C CNN
F 1 "GND" H 2105 5102 50  0000 C CNN
F 2 "" H 2100 5275 50  0001 C CNN
F 3 "" H 2100 5275 50  0001 C CNN
	1    2100 5275
	1    0    0    -1  
$EndComp
Connection ~ 2750 4975
$Comp
L power:+5V #PWR07
U 1 1 5E3EE1D9
P 2750 4975
F 0 "#PWR07" H 2750 4825 50  0001 C CNN
F 1 "+5V" H 2765 5148 50  0000 C CNN
F 2 "" H 2750 4975 50  0001 C CNN
F 3 "" H 2750 4975 50  0001 C CNN
	1    2750 4975
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4975 2100 4975
Wire Wire Line
	2750 5575 2750 4975
$Comp
L Device:C C4
U 1 1 5E3EB510
P 2100 5125
F 0 "C4" H 2215 5171 50  0000 L CNN
F 1 "0.1u" H 2215 5080 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2138 4975 50  0001 C CNN
F 3 "~" H 2100 5125 50  0001 C CNN
	1    2100 5125
	1    0    0    -1  
$EndComp
Text Label 1875 6075 0    50   ~ 0
SCK
Text Label 1875 5975 0    50   ~ 0
CAN_CS
Text Label 1875 5875 0    50   ~ 0
MISO
Text Label 1875 5775 0    50   ~ 0
MOSI
Wire Wire Line
	2150 6075 1875 6075
Wire Wire Line
	2150 5975 1875 5975
Wire Wire Line
	2150 5875 1875 5875
Wire Wire Line
	2150 5775 1875 5775
Wire Wire Line
	1200 6575 2150 6575
Wire Wire Line
	1200 7075 1200 6575
Wire Wire Line
	1500 6675 2150 6675
Wire Wire Line
	1350 7425 1350 7275
$Comp
L power:GND #PWR03
U 1 1 5E3B3CB5
P 1350 7425
F 0 "#PWR03" H 1350 7175 50  0001 C CNN
F 1 "GND" H 1355 7252 50  0000 C CNN
F 2 "" H 1350 7425 50  0001 C CNN
F 3 "" H 1350 7425 50  0001 C CNN
	1    1350 7425
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6975 3900 6975
Wire Wire Line
	3450 6975 3350 6975
$Comp
L power:+5V #PWR010
U 1 1 5E3AFB65
P 3900 6975
F 0 "#PWR010" H 3900 6825 50  0001 C CNN
F 1 "+5V" H 3915 7148 50  0000 C CNN
F 2 "" H 3900 6975 50  0001 C CNN
F 3 "" H 3900 6975 50  0001 C CNN
	1    3900 6975
	1    0    0    -1  
$EndComp
Text Label 3750 5875 2    50   ~ 0
TXCAN
Text Label 3750 5775 2    50   ~ 0
RXCAN
Wire Wire Line
	3875 5875 4250 5875
Wire Wire Line
	3775 5775 3875 5875
Wire Wire Line
	3350 5775 3775 5775
Wire Wire Line
	3775 5875 3350 5875
Wire Wire Line
	3875 5775 3775 5875
Wire Wire Line
	4250 5775 3875 5775
$Comp
L Device:R R2
U 1 1 5E3A7D6D
P 3600 6975
F 0 "R2" V 3393 6975 50  0000 C CNN
F 1 "10k" V 3484 6975 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3530 6975 50  0001 C CNN
F 3 "~" H 3600 6975 50  0001 C CNN
	1    3600 6975
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 7350 5300 7350
Text Label 4950 7350 0    50   ~ 0
RESET
Wire Wire Line
	4950 7250 5300 7250
Text Label 4950 7250 0    50   ~ 0
SCK
Wire Wire Line
	4950 7150 5300 7150
Text Label 4950 7150 0    50   ~ 0
MISO
Wire Wire Line
	6150 7250 5800 7250
Text Label 6150 7250 2    50   ~ 0
MOSI
Wire Wire Line
	6150 7350 5800 7350
Wire Wire Line
	6150 7150 5800 7150
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J3
U 1 1 5E394445
P 5500 7250
F 0 "J3" H 5550 7567 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 5550 7476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 5500 7250 50  0001 C CNN
F 3 "~" H 5500 7250 50  0001 C CNN
	1    5500 7250
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:MCP2551-I-SN U3
U 1 1 5E391B78
P 4750 5975
F 0 "U3" H 5125 6500 50  0000 C CNN
F 1 "MCP2551-I-SN" H 5150 6350 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4750 5475 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/21667d.pdf" H 4750 5975 50  0001 C CNN
	1    4750 5975
	1    0    0    -1  
$EndComp
$Comp
L Device:Resonator Y1
U 1 1 5E390803
P 1350 7075
F 0 "Y1" H 1350 7323 50  0000 C CNN
F 1 "16MHz" H 1350 7232 50  0000 C CNN
F 2 "Crystal:Resonator_SMD_muRata_CSTxExxV-3Pin_3.0x1.1mm_HandSoldering" H 1325 7075 50  0001 C CNN
F 3 "~" H 1325 7075 50  0001 C CNN
	1    1350 7075
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:MCP2515-xSO U2
U 1 1 5E38FEF2
P 2750 6375
F 0 "U2" H 3150 7375 50  0000 C CNN
F 1 "MCP2515-xSO" H 3150 7225 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 2750 5475 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21801e.pdf" H 2850 5575 50  0001 C CNN
	1    2750 6375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E6D1440
P 4375 3600
F 0 "#PWR0103" H 4375 3350 50  0001 C CNN
F 1 "GND" H 4380 3427 50  0000 C CNN
F 2 "" H 4375 3600 50  0001 C CNN
F 3 "" H 4375 3600 50  0001 C CNN
	1    4375 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4375 3600 4525 3600
$Comp
L power:+5V #PWR0104
U 1 1 5E70954B
P 7000 3600
F 0 "#PWR0104" H 7000 3450 50  0001 C CNN
F 1 "+5V" H 7015 3773 50  0000 C CNN
F 2 "" H 7000 3600 50  0001 C CNN
F 3 "" H 7000 3600 50  0001 C CNN
	1    7000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3600 6925 3600
$Comp
L Connector:RJ45 J9
U 1 1 5E6A2329
P 10725 4425
AR Path="/5E6A2329" Ref="J9"  Part="1" 
AR Path="/5E92554D/5E6A2329" Ref="J?"  Part="1" 
F 0 "J9" H 10396 4429 50  0000 R CNN
F 1 "RJ45" H 10396 4520 50  0000 R CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 10725 4450 50  0001 C CNN
F 3 "~" V 10725 4450 50  0001 C CNN
	1    10725 4425
	-1   0    0    1   
$EndComp
Text Label 9875 4125 0    50   ~ 0
E1_P
Text Label 9875 4225 0    50   ~ 0
E1_N
Text Label 9875 4425 0    50   ~ 0
E2_P
Text Label 9875 4525 0    50   ~ 0
E2_N
Text Label 9875 4325 0    50   ~ 0
E3_P
Text Label 9875 4625 0    50   ~ 0
E3_N
Text Label 9875 4725 0    50   ~ 0
E4_P
Text Label 9875 4825 0    50   ~ 0
E4_N
Wire Wire Line
	7350 2575 8250 2575
Wire Wire Line
	7350 2675 7350 2700
Wire Wire Line
	7350 2675 8250 2675
Wire Wire Line
	7350 2575 7350 2675
Connection ~ 7350 2675
Text Label 5900 1600 0    50   ~ 0
IMU_TX
Text Label 5900 1800 0    50   ~ 0
IMU_RX
Wire Wire Line
	5900 1600 6250 1600
Wire Wire Line
	6250 1800 5900 1800
Text Label 5625 5025 0    50   ~ 0
IMU_TX
Wire Wire Line
	5625 5025 5625 4400
Text Label 5225 5025 0    50   ~ 0
IMU_RX
Wire Wire Line
	5225 5025 5225 4400
Text Label 5225 2550 0    50   ~ 0
IMU_RX_U
Text Label 7250 1025 0    50   ~ 0
IMU_TX_U
Wire Wire Line
	5225 2550 5225 2800
Text Label 7250 1125 0    50   ~ 0
IMU_RX_U
Text Label 5625 2625 0    50   ~ 0
IMU_TX_U
Wire Wire Line
	5625 2625 5625 2800
$Comp
L Device:C C7
U 1 1 5E8C2645
P 6125 4550
F 0 "C7" H 6240 4596 50  0000 L CNN
F 1 "1u" H 6240 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6163 4400 50  0001 C CNN
F 3 "~" H 6125 4550 50  0001 C CNN
	1    6125 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5E8D5DE7
P 5825 4550
F 0 "C6" H 5940 4596 50  0000 L CNN
F 1 "1u" H 5940 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5863 4400 50  0001 C CNN
F 3 "~" H 5825 4550 50  0001 C CNN
	1    5825 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5E8D6411
P 7275 3750
F 0 "C10" H 7390 3796 50  0000 L CNN
F 1 "1u" H 7390 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7313 3600 50  0001 C CNN
F 3 "~" H 7275 3750 50  0001 C CNN
	1    7275 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7275 3600 7000 3600
Connection ~ 7000 3600
$Comp
L power:GND #PWR0105
U 1 1 5E8E23DC
P 7275 3900
F 0 "#PWR0105" H 7275 3650 50  0001 C CNN
F 1 "GND" H 7280 3727 50  0000 C CNN
F 2 "" H 7275 3900 50  0001 C CNN
F 3 "" H 7275 3900 50  0001 C CNN
	1    7275 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E8E2D56
P 6125 4700
F 0 "#PWR0106" H 6125 4450 50  0001 C CNN
F 1 "GND" H 6130 4527 50  0000 C CNN
F 2 "" H 6125 4700 50  0001 C CNN
F 3 "" H 6125 4700 50  0001 C CNN
	1    6125 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 4700 5825 4700
Connection ~ 6125 4700
$Comp
L Device:C C9
U 1 1 5E8ED77D
P 6475 4400
F 0 "C9" V 6625 4525 50  0000 C CNN
F 1 "1u" V 6625 4400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6513 4250 50  0001 C CNN
F 3 "~" H 6475 4400 50  0001 C CNN
	1    6475 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 5E8EE481
P 6475 2800
F 0 "C8" V 6223 2800 50  0000 C CNN
F 1 "1u" V 6314 2800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6513 2650 50  0001 C CNN
F 3 "~" H 6475 2800 50  0001 C CNN
	1    6475 2800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E8F290A
P 5025 4400
F 0 "#PWR0107" H 5025 4150 50  0001 C CNN
F 1 "GND" H 5030 4227 50  0000 C CNN
F 2 "" H 5025 4400 50  0001 C CNN
F 3 "" H 5025 4400 50  0001 C CNN
	1    5025 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5E8F2F15
P 5425 2800
F 0 "#PWR0108" H 5425 2550 50  0001 C CNN
F 1 "GND" H 5430 2627 50  0000 C CNN
F 2 "" H 5425 2800 50  0001 C CNN
F 3 "" H 5425 2800 50  0001 C CNN
	1    5425 2800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5E906186
P 6550 2200
F 0 "#PWR0109" H 6550 1950 50  0001 C CNN
F 1 "GND" H 6555 2027 50  0000 C CNN
F 2 "" H 6550 2200 50  0001 C CNN
F 3 "" H 6550 2200 50  0001 C CNN
	1    6550 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0110
U 1 1 5E927753
P 5700 1300
F 0 "#PWR0110" H 5700 1150 50  0001 C CNN
F 1 "+12V" H 5715 1473 50  0000 C CNN
F 2 "" H 5700 1300 50  0001 C CNN
F 3 "" H 5700 1300 50  0001 C CNN
	1    5700 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1300 6250 1300
Text Label 7325 1950 0    50   ~ 0
RXD
Wire Wire Line
	3000 3275 2600 3275
Text Label 7325 2050 0    50   ~ 0
TXD
Wire Wire Line
	3000 3375 2600 3375
$Comp
L Connector_Generic:Conn_01x03 J11
U 1 1 5E94E6CF
P 7825 2050
F 0 "J11" H 7875 2367 50  0000 C CNN
F 1 "2.54mmPins" H 7875 2276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7825 2050 50  0001 C CNN
F 3 "~" H 7825 2050 50  0001 C CNN
	1    7825 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7325 1950 7625 1950
Text Label 3000 3275 2    50   ~ 0
RXD
Wire Wire Line
	7325 2050 7625 2050
$Comp
L power:GND #PWR0111
U 1 1 5E98AF31
P 7350 2150
F 0 "#PWR0111" H 7350 1900 50  0001 C CNN
F 1 "GND" H 7355 1977 50  0000 C CNN
F 2 "" H 7350 2150 50  0001 C CNN
F 3 "" H 7350 2150 50  0001 C CNN
	1    7350 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2150 7625 2150
Text Label 3000 3375 2    50   ~ 0
TXD
Text Notes 7400 1675 0    50   ~ 0
UART for ATMEGA\n
$EndSCHEMATC
