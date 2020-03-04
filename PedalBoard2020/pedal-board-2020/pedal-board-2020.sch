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
L pedal-board-2020-rescue:ATmega328P-AU-MCU_Microchip_ATmega U1
U 1 1 5E386332
P 2750 4200
F 0 "U1" H 2125 2500 50  0000 C CNN
F 1 "ATmega328P-AU" H 2225 2650 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 2750 4200 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2750 4200 50  0001 C CNN
	1    2750 4200
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:R-785.0-1.0 U4
U 1 1 5E387DA7
P 4525 6125
F 0 "U4" H 4525 6367 50  0000 C CNN
F 1 "R-785.0-1.0" H 4525 6276 50  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_RECOM_R-78E-0.5_THT" H 4575 5875 50  0001 L CIN
F 3 "https://www.recom-power.com/pdf/Innoline/R-78xx-1.0.pdf" H 4525 6125 50  0001 C CNN
	1    4525 6125
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E3888C4
P 4075 6350
F 0 "C5" H 3960 6304 50  0000 R CNN
F 1 "1u" H 3960 6395 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4113 6200 50  0001 C CNN
F 3 "~" H 4075 6350 50  0001 C CNN
	1    4075 6350
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 5E388BA2
P 5050 6350
F 0 "C6" H 5165 6396 50  0000 L CNN
F 1 "10u" H 5165 6305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5088 6200 50  0001 C CNN
F 3 "~" H 5050 6350 50  0001 C CNN
	1    5050 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E388F7F
P 4525 6525
F 0 "#PWR0101" H 4525 6275 50  0001 C CNN
F 1 "GND" H 4530 6352 50  0000 C CNN
F 2 "" H 4525 6525 50  0001 C CNN
F 3 "" H 4525 6525 50  0001 C CNN
	1    4525 6525
	1    0    0    -1  
$EndComp
Wire Wire Line
	4525 6525 4525 6500
$Comp
L power:+12V #PWR0102
U 1 1 5E389EFD
P 4075 5925
F 0 "#PWR0102" H 4075 5775 50  0001 C CNN
F 1 "+12V" H 4090 6098 50  0000 C CNN
F 2 "" H 4075 5925 50  0001 C CNN
F 3 "" H 4075 5925 50  0001 C CNN
	1    4075 5925
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5E38A48B
P 5050 5950
F 0 "#PWR0103" H 5050 5800 50  0001 C CNN
F 1 "+5V" H 5065 6123 50  0000 C CNN
F 2 "" H 5050 5950 50  0001 C CNN
F 3 "" H 5050 5950 50  0001 C CNN
	1    5050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5950 5050 6125
Wire Wire Line
	5050 6125 4825 6125
Wire Wire Line
	4075 5925 4075 6125
Wire Wire Line
	4075 6125 4225 6125
Wire Wire Line
	4075 6500 4525 6500
Connection ~ 4525 6500
Wire Wire Line
	4525 6500 4525 6425
Wire Wire Line
	4075 6200 4075 6125
Connection ~ 4075 6125
Wire Wire Line
	5050 6500 4525 6500
Wire Wire Line
	5050 6200 5050 6125
Connection ~ 5050 6125
$Comp
L Interface_CAN_LIN:MCP2515-xSO U2
U 1 1 5E38FEF2
P 5950 3900
F 0 "U2" H 6350 4900 50  0000 C CNN
F 1 "MCP2515-xSO" H 6350 4750 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 5950 3000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21801e.pdf" H 6050 3100 50  0001 C CNN
	1    5950 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:Resonator Y1
U 1 1 5E390803
P 4900 4600
F 0 "Y1" H 4900 4848 50  0000 C CNN
F 1 "16MHz" H 4900 4757 50  0000 C CNN
F 2 "Crystal:Resonator_SMD_muRata_CSTxExxV-3Pin_3.0x1.1mm_HandSoldering" H 4875 4600 50  0001 C CNN
F 3 "~" H 4875 4600 50  0001 C CNN
	1    4900 4600
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:MCP2551-I-SN U3
U 1 1 5E391B78
P 7950 3500
F 0 "U3" H 8325 4025 50  0000 C CNN
F 1 "MCP2551-I-SN" H 8350 3875 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7950 3000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/21667d.pdf" H 7950 3500 50  0001 C CNN
	1    7950 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5E394445
P 6225 5925
F 0 "J1" H 6275 6242 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 6275 6151 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6225 5925 50  0001 C CNN
F 3 "~" H 6225 5925 50  0001 C CNN
	1    6225 5925
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5E395648
P 6875 5825
F 0 "#PWR0104" H 6875 5675 50  0001 C CNN
F 1 "+5V" H 6890 5998 50  0000 C CNN
F 2 "" H 6875 5825 50  0001 C CNN
F 3 "" H 6875 5825 50  0001 C CNN
	1    6875 5825
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 5825 6525 5825
$Comp
L power:GND #PWR0105
U 1 1 5E395DE1
P 6875 6025
F 0 "#PWR0105" H 6875 5775 50  0001 C CNN
F 1 "GND" H 6880 5852 50  0000 C CNN
F 2 "" H 6875 6025 50  0001 C CNN
F 3 "" H 6875 6025 50  0001 C CNN
	1    6875 6025
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 6025 6525 6025
Text Label 6875 5925 2    50   ~ 0
MOSI
Wire Wire Line
	6875 5925 6525 5925
Text Label 5675 5825 0    50   ~ 0
MISO
Wire Wire Line
	5675 5825 6025 5825
Text Label 5675 5925 0    50   ~ 0
SCK
Wire Wire Line
	5675 5925 6025 5925
Text Label 5675 6025 0    50   ~ 0
RESET
Wire Wire Line
	5675 6025 6025 6025
$Comp
L Device:R R3
U 1 1 5E3A7D6D
P 6800 4500
F 0 "R3" V 6593 4500 50  0000 C CNN
F 1 "10k" V 6684 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6730 4500 50  0001 C CNN
F 3 "~" H 6800 4500 50  0001 C CNN
	1    6800 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 3300 7075 3300
Wire Wire Line
	7075 3300 6975 3400
Wire Wire Line
	6975 3400 6550 3400
Wire Wire Line
	6550 3300 6975 3300
Wire Wire Line
	6975 3300 7075 3400
Wire Wire Line
	7075 3400 7450 3400
Text Label 6950 3300 2    50   ~ 0
RXCAN
Text Label 6950 3400 2    50   ~ 0
TXCAN
$Comp
L power:+5V #PWR0106
U 1 1 5E3AFB65
P 7100 4500
F 0 "#PWR0106" H 7100 4350 50  0001 C CNN
F 1 "+5V" H 7115 4673 50  0000 C CNN
F 2 "" H 7100 4500 50  0001 C CNN
F 3 "" H 7100 4500 50  0001 C CNN
	1    7100 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4500 6550 4500
Wire Wire Line
	6950 4500 7100 4500
$Comp
L power:GND #PWR0107
U 1 1 5E3B3CB5
P 4900 4950
F 0 "#PWR0107" H 4900 4700 50  0001 C CNN
F 1 "GND" H 4905 4777 50  0000 C CNN
F 2 "" H 4900 4950 50  0001 C CNN
F 3 "" H 4900 4950 50  0001 C CNN
	1    4900 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4950 4900 4800
Wire Wire Line
	5050 4200 5350 4200
Wire Wire Line
	4750 4600 4750 4100
Wire Wire Line
	4750 4100 5350 4100
Wire Wire Line
	3350 3300 3750 3300
Wire Wire Line
	3350 3400 3750 3400
Wire Wire Line
	3350 3500 3750 3500
Wire Wire Line
	3350 5200 3775 5200
Wire Wire Line
	3350 4900 3775 4900
$Comp
L Device:R R1
U 1 1 5E3C6F00
P 4075 4575
F 0 "R1" H 3875 4625 50  0000 L CNN
F 1 "100k" H 3825 4525 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4005 4575 50  0001 C CNN
F 3 "~" H 4075 4575 50  0001 C CNN
	1    4075 4575
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E3C800A
P 4350 4575
F 0 "R2" H 4420 4621 50  0000 L CNN
F 1 "100k" H 4420 4530 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4280 4575 50  0001 C CNN
F 3 "~" H 4350 4575 50  0001 C CNN
	1    4350 4575
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4200 4350 4425
Wire Wire Line
	3350 4200 4350 4200
Wire Wire Line
	4075 4300 4075 4425
Wire Wire Line
	3350 4300 4075 4300
Wire Wire Line
	4075 4725 4075 4900
Wire Wire Line
	4075 4900 4225 4900
Wire Wire Line
	4350 4900 4350 4725
$Comp
L power:GND #PWR0108
U 1 1 5E3CBE0C
P 4225 5025
F 0 "#PWR0108" H 4225 4775 50  0001 C CNN
F 1 "GND" H 4230 4852 50  0000 C CNN
F 2 "" H 4225 5025 50  0001 C CNN
F 3 "" H 4225 5025 50  0001 C CNN
	1    4225 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	4225 5025 4225 4900
Connection ~ 4225 4900
Wire Wire Line
	4225 4900 4350 4900
Text Label 3775 4900 2    50   ~ 0
CAN_INT
Text Label 3775 5200 2    50   ~ 0
CAN_CS
Text Label 3750 3300 2    50   ~ 0
MOSI
Text Label 3750 3400 2    50   ~ 0
MISO
Text Label 3750 3500 2    50   ~ 0
SCK
Wire Wire Line
	5350 3300 5075 3300
Wire Wire Line
	5350 3400 5075 3400
Wire Wire Line
	5350 3500 5075 3500
Wire Wire Line
	5350 3600 5075 3600
Text Label 5075 3300 0    50   ~ 0
MOSI
Text Label 5075 3400 0    50   ~ 0
MISO
Text Label 5075 3500 0    50   ~ 0
CAN_CS
Text Label 5075 3600 0    50   ~ 0
SCK
Text Label 3775 4500 2    50   ~ 0
RESET
Wire Wire Line
	3775 4500 3350 4500
$Comp
L Device:C C2
U 1 1 5E3D9506
P 1775 3175
F 0 "C2" H 1890 3221 50  0000 L CNN
F 1 "0.1u" H 1890 3130 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1813 3025 50  0001 C CNN
F 3 "~" H 1775 3175 50  0001 C CNN
	1    1775 3175
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3000 1775 3000
Wire Wire Line
	1775 3000 1775 3025
$Comp
L power:GND #PWR0109
U 1 1 5E3DB206
P 1775 3325
F 0 "#PWR0109" H 1775 3075 50  0001 C CNN
F 1 "GND" H 1780 3152 50  0000 C CNN
F 2 "" H 1775 3325 50  0001 C CNN
F 3 "" H 1775 3325 50  0001 C CNN
	1    1775 3325
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E3DBFAD
P 1750 2550
F 0 "C1" H 1865 2596 50  0000 L CNN
F 1 "0.1u" H 1865 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1788 2400 50  0001 C CNN
F 3 "~" H 1750 2550 50  0001 C CNN
	1    1750 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5E3EB510
P 5300 2650
F 0 "C3" H 5415 2696 50  0000 L CNN
F 1 "0.1u" H 5415 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5338 2500 50  0001 C CNN
F 3 "~" H 5300 2650 50  0001 C CNN
	1    5300 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3100 5950 2500
Wire Wire Line
	5950 2500 5300 2500
$Comp
L power:+5V #PWR0110
U 1 1 5E3EE1D9
P 5950 2500
F 0 "#PWR0110" H 5950 2350 50  0001 C CNN
F 1 "+5V" H 5965 2673 50  0000 C CNN
F 2 "" H 5950 2500 50  0001 C CNN
F 3 "" H 5950 2500 50  0001 C CNN
	1    5950 2500
	1    0    0    -1  
$EndComp
Connection ~ 5950 2500
$Comp
L power:GND #PWR0111
U 1 1 5E3EED26
P 5300 2800
F 0 "#PWR0111" H 5300 2550 50  0001 C CNN
F 1 "GND" H 5305 2627 50  0000 C CNN
F 2 "" H 5300 2800 50  0001 C CNN
F 3 "" H 5300 2800 50  0001 C CNN
	1    5300 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5E3EFBEB
P 7675 2725
F 0 "C4" H 7790 2771 50  0000 L CNN
F 1 "0.1u" H 7790 2680 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7713 2575 50  0001 C CNN
F 3 "~" H 7675 2725 50  0001 C CNN
	1    7675 2725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5E3F0299
P 7675 2875
F 0 "#PWR0112" H 7675 2625 50  0001 C CNN
F 1 "GND" H 7680 2702 50  0000 C CNN
F 2 "" H 7675 2875 50  0001 C CNN
F 3 "" H 7675 2875 50  0001 C CNN
	1    7675 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	7675 2575 7950 2575
Wire Wire Line
	7950 2575 7950 3100
$Comp
L power:+5V #PWR0113
U 1 1 5E3F1A89
P 7950 2575
F 0 "#PWR0113" H 7950 2425 50  0001 C CNN
F 1 "+5V" H 7965 2748 50  0000 C CNN
F 2 "" H 7950 2575 50  0001 C CNN
F 3 "" H 7950 2575 50  0001 C CNN
	1    7950 2575
	1    0    0    -1  
$EndComp
Connection ~ 7950 2575
Wire Wire Line
	1750 2400 2800 2400
Wire Wire Line
	2800 2400 2800 2700
Wire Wire Line
	2800 2700 2750 2700
Wire Wire Line
	2850 2700 2800 2700
Connection ~ 2800 2700
$Comp
L power:GND #PWR0114
U 1 1 5E3F56B9
P 1750 2700
F 0 "#PWR0114" H 1750 2450 50  0001 C CNN
F 1 "GND" H 1755 2527 50  0000 C CNN
F 2 "" H 1750 2700 50  0001 C CNN
F 3 "" H 1750 2700 50  0001 C CNN
	1    1750 2700
	1    0    0    -1  
$EndComp
Text Label 6950 3900 2    50   ~ 0
CAN_INT
Wire Wire Line
	6950 3900 6550 3900
Text Label 3750 4200 2    50   ~ 0
ACC1
Text Label 3750 4300 2    50   ~ 0
ACC0
Wire Wire Line
	10000 4725 9850 4725
Connection ~ 9850 4725
Wire Wire Line
	10000 4625 9850 4625
Connection ~ 9850 4625
Wire Wire Line
	9850 4625 9850 4725
Wire Wire Line
	10000 4525 9850 4525
Wire Wire Line
	9850 4525 9850 4625
Text Label 9650 2925 0    50   ~ 0
ACC0
Wire Wire Line
	9850 4725 9850 4850
$Comp
L power:GND #PWR0117
U 1 1 5E418443
P 9850 4850
F 0 "#PWR0117" H 9850 4600 50  0001 C CNN
F 1 "GND" H 9855 4677 50  0000 C CNN
F 2 "" H 9850 4850 50  0001 C CNN
F 3 "" H 9850 4850 50  0001 C CNN
	1    9850 4850
	1    0    0    -1  
$EndComp
Text Label 8775 3400 2    50   ~ 0
CAN+
Text Label 8775 3600 2    50   ~ 0
CAN-
$Comp
L Device:R R4
U 1 1 5E3AF9C1
P 9050 3500
F 0 "R4" H 9120 3546 50  0000 L CNN
F 1 "120" H 9120 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8980 3500 50  0001 C CNN
F 3 "~" H 9050 3500 50  0001 C CNN
	1    9050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3350 8925 3350
Wire Wire Line
	8925 3350 8925 3400
Wire Wire Line
	8450 3400 8925 3400
Wire Wire Line
	8925 3600 8925 3650
Wire Wire Line
	8925 3650 9050 3650
Wire Wire Line
	8450 3600 8925 3600
Wire Wire Line
	5050 4200 5050 4600
Text Label 9675 3125 0    50   ~ 0
CAN+
Text Label 9700 3825 0    50   ~ 0
CAN-
$Comp
L power:+5V #PWR0118
U 1 1 5E3F472C
P 2800 2400
F 0 "#PWR0118" H 2800 2250 50  0001 C CNN
F 1 "+5V" H 2815 2573 50  0000 C CNN
F 2 "" H 2800 2400 50  0001 C CNN
F 3 "" H 2800 2400 50  0001 C CNN
	1    2800 2400
	1    0    0    -1  
$EndComp
Connection ~ 2800 2400
Wire Wire Line
	7450 3700 7375 3700
Wire Wire Line
	7375 3700 7375 3900
Wire Wire Line
	7375 3900 7950 3900
Text Label 3750 3900 2    50   ~ 0
STEER
Wire Wire Line
	3750 3900 3350 3900
Text Label 3750 4000 2    50   ~ 0
BRAKE0
Wire Wire Line
	3750 4000 3350 4000
Text Label 3750 4100 2    50   ~ 0
BRAKE1
Wire Wire Line
	3750 4100 3350 4100
$Comp
L Connector_Generic:Conn_01x23 J2
U 1 1 5E419ADB
P 10200 3625
F 0 "J2" H 10280 3667 50  0000 L CNN
F 1 "Conn_01x23" H 10280 3576 50  0000 L CNN
F 2 "Connector_TE-Connectivity:TE_AMPSEAL_1-776087-x_3Rows_23_P0.4mm_Horizontal" H 10200 3625 50  0001 C CNN
F 3 "~" H 10200 3625 50  0001 C CNN
	1    10200 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4425 9850 4425
Wire Wire Line
	9850 4425 9850 4525
Connection ~ 9850 4525
Wire Wire Line
	10000 4325 9850 4325
Wire Wire Line
	9850 4325 9850 4225
Wire Wire Line
	9850 4225 10000 4225
Wire Wire Line
	10000 4025 9850 4025
Wire Wire Line
	9850 4025 9850 4125
Connection ~ 9850 4225
Wire Wire Line
	10000 4125 9850 4125
Connection ~ 9850 4125
$Comp
L power:+5V #PWR0115
U 1 1 5E440FA4
P 9425 3325
F 0 "#PWR0115" H 9425 3175 50  0001 C CNN
F 1 "+5V" H 9440 3498 50  0000 C CNN
F 2 "" H 9425 3325 50  0001 C CNN
F 3 "" H 9425 3325 50  0001 C CNN
	1    9425 3325
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4125 9850 4225
Wire Wire Line
	9450 4025 9850 4025
Connection ~ 9850 4025
Wire Wire Line
	10000 3325 9850 3325
Wire Wire Line
	9850 3325 9850 3425
Wire Wire Line
	9850 3625 10000 3625
Wire Wire Line
	10000 3525 9850 3525
Connection ~ 9850 3525
Wire Wire Line
	9850 3525 9850 3625
Wire Wire Line
	10000 3425 9850 3425
Connection ~ 9850 3425
Wire Wire Line
	9850 3425 9850 3525
$Comp
L power:+12V #PWR0116
U 1 1 5E4534A3
P 9450 4025
F 0 "#PWR0116" H 9450 3875 50  0001 C CNN
F 1 "+12V" H 9465 4198 50  0000 C CNN
F 2 "" H 9450 4025 50  0001 C CNN
F 3 "" H 9450 4025 50  0001 C CNN
	1    9450 4025
	1    0    0    -1  
$EndComp
Wire Wire Line
	9425 3325 9850 3325
Connection ~ 9850 3325
Text Label 9650 2625 0    50   ~ 0
BRAKE0
Wire Wire Line
	9650 2725 10000 2725
Wire Wire Line
	9650 2625 10000 2625
Wire Wire Line
	9650 2525 10000 2525
Wire Wire Line
	10000 2825 9650 2825
Wire Wire Line
	10000 2925 9650 2925
Text Label 9650 2725 0    50   ~ 0
BRAKE1
Wire Wire Line
	9700 3825 9850 3825
Wire Wire Line
	10000 3925 9850 3925
Wire Wire Line
	10000 3225 9850 3225
Wire Wire Line
	10000 3125 9850 3125
Wire Wire Line
	9850 3925 9850 3825
Connection ~ 9850 3825
Wire Wire Line
	9850 3825 10000 3825
Wire Wire Line
	9850 3225 9850 3125
Connection ~ 9850 3125
Wire Wire Line
	9850 3125 9675 3125
Text Label 9650 2825 0    50   ~ 0
ACC1
Text Label 9650 2525 0    50   ~ 0
STEER
$Comp
L power:GND #PWR0119
U 1 1 5E4F613C
P 2750 5850
F 0 "#PWR0119" H 2750 5600 50  0001 C CNN
F 1 "GND" H 2755 5677 50  0000 C CNN
F 2 "" H 2750 5850 50  0001 C CNN
F 3 "" H 2750 5850 50  0001 C CNN
	1    2750 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5700 2750 5850
$Comp
L power:GND #PWR0120
U 1 1 5E538D42
P 5950 4700
F 0 "#PWR0120" H 5950 4450 50  0001 C CNN
F 1 "GND" H 5955 4527 50  0000 C CNN
F 2 "" H 5950 4700 50  0001 C CNN
F 3 "" H 5950 4700 50  0001 C CNN
	1    5950 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5E539AEC
P 7950 3900
F 0 "#PWR0121" H 7950 3650 50  0001 C CNN
F 1 "GND" H 7955 3727 50  0000 C CNN
F 2 "" H 7950 3900 50  0001 C CNN
F 3 "" H 7950 3900 50  0001 C CNN
	1    7950 3900
	1    0    0    -1  
$EndComp
Connection ~ 7950 3900
Text Label 9650 3025 0    50   ~ 0
SENSOR_1
Wire Wire Line
	9650 3025 10000 3025
Text Label 9650 3700 0    50   ~ 0
SENSOR_2
Wire Wire Line
	9650 3700 10000 3700
Wire Wire Line
	10000 3700 10000 3725
Text Label 3750 5000 2    50   ~ 0
SENSOR_1
Wire Wire Line
	3750 5000 3350 5000
Text Label 3750 5100 2    50   ~ 0
SENSOR_2
Wire Wire Line
	3750 5100 3350 5100
Text Notes 8500 7375 0    50   ~ 0
Front DAQ board\nG.Spearing\n20.0303
$EndSCHEMATC
