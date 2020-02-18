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
P 3500 2225
F 0 "J?" H 3550 2225 50  0000 C CNN
F 1 "22_PIN_CONNECTOR" H 3550 2851 50  0000 C CNN
F 2 "" H 3500 2225 50  0001 C CNN
F 3 "~" H 3500 2225 50  0001 C CNN
	1    3500 2225
	1    0    0    -1  
$EndComp
Text Label 4275 1725 2    50   ~ 0
+12V
Text Label 4275 1825 2    50   ~ 0
CELL_RX+
Wire Wire Line
	4275 1825 3800 1825
Text Label 4275 1925 2    50   ~ 0
CELL_TX+
Wire Wire Line
	4275 1925 3800 1925
Text Label 4275 2025 2    50   ~ 0
USB_PWR
Wire Wire Line
	4275 2025 3800 2025
Text Label 4275 2125 2    50   ~ 0
USB_D+
Wire Wire Line
	4275 2125 3800 2125
Text Label 4275 2225 2    50   ~ 0
DSP_TX
Wire Wire Line
	4275 2225 3800 2225
Text Label 4275 2325 2    50   ~ 0
HEATER
Wire Wire Line
	3800 2325 4275 2325
Text Label 4275 2425 2    50   ~ 0
BUZZER
Wire Wire Line
	4275 2425 3800 2425
Text Label 4275 2525 2    50   ~ 0
CHARGER
Wire Wire Line
	4275 2525 3800 2525
Text Label 4275 2625 2    50   ~ 0
IGN_IN
Wire Wire Line
	4275 2625 3800 2625
Text Label 4275 2725 2    50   ~ 0
CAN+
Text Label 2875 1725 0    50   ~ 0
GROUND
Text Label 2875 1825 0    50   ~ 0
CELL_RX-
Wire Wire Line
	2875 1825 3300 1825
Text Label 2875 1925 0    50   ~ 0
CELL_TX-
Wire Wire Line
	2875 1925 3300 1925
Text Label 2875 2025 0    50   ~ 0
GROUND
Wire Wire Line
	2875 2025 3300 2025
Text Label 2875 2125 0    50   ~ 0
USB_D-
Wire Wire Line
	2875 2125 3300 2125
Text Label 2875 2225 0    50   ~ 0
DSP_RX
Wire Wire Line
	2875 2225 3300 2225
Text Label 2875 2325 0    50   ~ 0
BAT_LOW
Wire Wire Line
	2875 2325 3300 2325
Text Label 2875 2425 0    50   ~ 0
CHG_IND
Wire Wire Line
	2875 2425 3300 2425
Text Label 2875 2525 0    50   ~ 0
FAST_CHG
Wire Wire Line
	2875 2525 3300 2525
Text Label 2875 2625 0    50   ~ 0
AC_SENSE
Wire Wire Line
	2875 2625 3300 2625
Text Label 2875 2725 0    50   ~ 0
CAN-
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5E4A3B9B
P 3500 3025
F 0 "J?" H 3550 2975 50  0000 C CNN
F 1 "8_PIN_CONNECTOR" H 3575 2700 50  0000 C CNN
F 2 "" H 3500 3025 50  0001 C CNN
F 3 "~" H 3500 3025 50  0001 C CNN
	1    3500 3025
	1    0    0    -1  
$EndComp
Text Label 4275 2925 2    50   ~ 0
SPEED_IN
Wire Wire Line
	3800 2925 4275 2925
Text Label 4275 3025 2    50   ~ 0
+5v_OUT
Wire Wire Line
	4275 3025 3800 3025
Text Label 4275 3125 2    50   ~ 0
INPUT_4
Wire Wire Line
	3800 3125 4275 3125
Text Label 4275 3225 2    50   ~ 0
INPUT_2
Wire Wire Line
	4275 3225 3800 3225
Text Label 2875 2925 0    50   ~ 0
SOC_OUT
Wire Wire Line
	2875 2925 3300 2925
Text Label 2875 3025 0    50   ~ 0
GROUND
Wire Wire Line
	2875 3025 3300 3025
Text Label 2875 3125 0    50   ~ 0
INPUT_3
Wire Wire Line
	2875 3125 3300 3125
Text Label 2875 3225 0    50   ~ 0
INPUT_1
Wire Wire Line
	2875 3225 3300 3225
Text Notes 3250 1525 0    50   ~ 0
BMS G1 CONTROL UNIT\n(EMUS)
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 5E4AE01D
P 7575 2225
F 0 "J?" H 7655 2267 50  0001 L CNN
F 1 "Cell Group Module" V 7675 1750 50  0000 L CNN
F 2 "" H 7575 2225 50  0001 C CNN
F 3 "~" H 7575 2225 50  0001 C CNN
	1    7575 2225
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5E4AE797
P 7575 2500
F 0 "J?" H 7655 2492 50  0001 L CNN
F 1 "Conn_01x02" H 7655 2401 50  0001 L CNN
F 2 "" H 7575 2500 50  0001 C CNN
F 3 "~" H 7575 2500 50  0001 C CNN
	1    7575 2500
	1    0    0    -1  
$EndComp
Text Label 6950 2125 0    50   ~ 0
TOP_CELL+
Text Label 6950 2225 0    50   ~ 0
UP
Text Label 6950 2325 0    50   ~ 0
TOP_CELL-
Text Label 7000 2500 0    50   ~ 0
DN
Text Label 7000 2600 0    50   ~ 0
BOT_CELL
Text Notes 7275 1950 0    50   ~ 0
G1 CAN CELL \nGROUP MODULE\n(EMUS)
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BAAA6
P 5250 2975
F 0 "BT?" H 5368 3071 50  0001 L CNN
F 1 "Battery_Cell" H 5368 2980 50  0001 L CNN
F 2 "" V 5250 3035 50  0001 C CNN
F 3 "~" V 5250 3035 50  0001 C CNN
	1    5250 2975
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BA49F
P 5250 2500
F 0 "BT?" H 5368 2596 50  0001 L CNN
F 1 "Battery_Cell" H 5368 2505 50  0001 L CNN
F 2 "" V 5250 2560 50  0001 C CNN
F 3 "~" V 5250 2560 50  0001 C CNN
	1    5250 2500
	1    0    0    -1  
$EndComp
Text Notes 4925 1425 0    50   ~ 0
BATTERY CELLS\nTotal of 6 in Series\nEnergus Li2x4p25RT
Text GLabel 8625 1975 2    50   Input ~ 0
CAN+
Wire Notes Line
	5850 3550 5175 3550
Wire Notes Line
	5175 3550 5175 4100
Wire Notes Line
	5175 4100 5850 4100
Wire Notes Line
	5850 4100 5850 3550
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4BA2E1
P 5250 2000
F 0 "BT?" H 5368 2096 50  0001 L CNN
F 1 "Battery_Cell" H 5368 2005 50  0001 L CNN
F 2 "" V 5250 2060 50  0001 C CNN
F 3 "~" V 5250 2060 50  0001 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
Text GLabel 6225 1900 0    50   Input ~ 0
UP
Text GLabel 6225 2025 0    50   Input ~ 0
DN
Text GLabel 5750 1900 2    50   Input ~ 0
CELL+
Text GLabel 5750 2025 2    50   Input ~ 0
CELL-
Wire Notes Line
	5725 1825 6275 1825
Wire Notes Line
	6275 1825 6275 2100
Wire Notes Line
	6275 2100 5725 2100
Wire Notes Line
	5725 2100 5725 1825
Text Notes 5725 1800 0    50   ~ 0
G1 Small Type\nCell Module\n(EMUS)
Text GLabel 6225 2375 0    50   Input ~ 0
UP
Text GLabel 6225 2500 0    50   Input ~ 0
DN
Text GLabel 5750 2375 2    50   Input ~ 0
CELL+
Text GLabel 5750 2500 2    50   Input ~ 0
CELL-
Wire Notes Line
	5725 2300 6275 2300
Wire Notes Line
	6275 2300 6275 2575
Wire Notes Line
	6275 2575 5725 2575
Wire Notes Line
	5725 2575 5725 2300
Text GLabel 6225 2850 0    50   Input ~ 0
UP
Text GLabel 6225 2975 0    50   Input ~ 0
DN
Text GLabel 5750 2850 2    50   Input ~ 0
CELL+
Text GLabel 5750 2975 2    50   Input ~ 0
CELL-
Wire Notes Line
	5725 2775 6275 2775
Wire Notes Line
	6275 2775 6275 3050
Wire Notes Line
	6275 3050 5725 3050
Wire Notes Line
	5725 3050 5725 2775
Wire Wire Line
	5250 2600 5250 2675
Wire Wire Line
	5250 3075 5625 3075
Wire Wire Line
	6725 3075 6725 2600
Wire Wire Line
	6625 2500 6625 2975
Wire Wire Line
	6625 2975 6225 2975
Wire Wire Line
	6625 2500 7375 2500
Wire Wire Line
	6225 2850 6400 2850
Wire Wire Line
	6400 2850 6400 2500
Wire Wire Line
	6400 2500 6225 2500
Wire Wire Line
	6225 2375 6400 2375
Wire Wire Line
	6400 2375 6400 2025
Wire Wire Line
	6400 2025 6225 2025
Wire Wire Line
	6225 1900 6625 1900
Wire Wire Line
	6625 1900 6625 2225
Wire Wire Line
	6625 2225 7375 2225
Wire Wire Line
	6700 1500 5625 1500
Wire Wire Line
	5250 1500 5250 1800
Wire Wire Line
	5625 1900 5625 1500
Wire Wire Line
	5625 1900 5750 1900
Connection ~ 5625 1500
Wire Wire Line
	5625 1500 5250 1500
Wire Wire Line
	6350 2225 6475 2325
Wire Wire Line
	6475 2325 7375 2325
Wire Wire Line
	5750 2025 5650 2025
Wire Wire Line
	5650 2025 5650 2100
Wire Wire Line
	5650 2100 5250 2100
Connection ~ 5250 2100
Wire Wire Line
	5750 2375 5650 2375
Wire Wire Line
	5650 2375 5650 2300
Wire Wire Line
	5650 2300 5250 2300
Connection ~ 5250 2300
Wire Wire Line
	5250 2100 5250 2300
Wire Wire Line
	6350 2225 5650 2225
Wire Wire Line
	5650 2225 5650 2100
Connection ~ 5650 2100
Wire Wire Line
	5750 2850 5625 2850
Wire Wire Line
	5750 2975 5625 2975
Wire Wire Line
	5625 2975 5625 3075
Connection ~ 5625 3075
Wire Wire Line
	5625 3075 6725 3075
Wire Wire Line
	6725 2600 7375 2600
Wire Wire Line
	6700 1500 6700 2125
Wire Wire Line
	6700 2125 7375 2125
Wire Notes Line
	6925 2725 6925 1975
$Comp
L power:+12V #PWR?
U 1 1 5E51C4B6
P 4400 1725
F 0 "#PWR?" H 4400 1575 50  0001 C CNN
F 1 "+12V" H 4415 1898 50  0000 C CNN
F 2 "" H 4400 1725 50  0001 C CNN
F 3 "" H 4400 1725 50  0001 C CNN
	1    4400 1725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1725 4400 1725
$Comp
L power:GND #PWR?
U 1 1 5E51E673
P 2650 1725
F 0 "#PWR?" H 2650 1475 50  0001 C CNN
F 1 "GND" H 2655 1552 50  0000 C CNN
F 2 "" H 2650 1725 50  0001 C CNN
F 3 "" H 2650 1725 50  0001 C CNN
	1    2650 1725
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1725 3300 1725
Text Notes 5225 3525 0    50   ~ 0
Ixxat \nUSB-to-CAN V2
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5E5496DE
P 7825 2375
F 0 "J?" H 7743 2042 50  0001 C CNN
F 1 "Conn_01x04" H 7743 2041 50  0001 C CNN
F 2 "" H 7825 2375 50  0001 C CNN
F 3 "~" H 7825 2375 50  0001 C CNN
	1    7825 2375
	-1   0    0    1   
$EndComp
Text Label 8250 2175 2    50   ~ 0
CAN+
Text Label 8250 2275 2    50   ~ 0
CAN-
Text Label 8250 2375 2    50   ~ 0
GND
Text Label 8250 2475 2    50   ~ 0
12V
Wire Notes Line
	8300 1975 8300 2725
Wire Notes Line
	6925 1975 8300 1975
Wire Notes Line
	6925 2725 8300 2725
Wire Wire Line
	5750 2500 5625 2500
Wire Wire Line
	5625 2500 5625 2675
Wire Wire Line
	5625 2675 5250 2675
Connection ~ 5625 2675
Wire Wire Line
	5625 2675 5625 2850
Connection ~ 5250 2675
Wire Wire Line
	5250 2675 5250 2775
$Comp
L power:GND #PWR?
U 1 1 5E581728
P 8825 2475
F 0 "#PWR?" H 8825 2225 50  0001 C CNN
F 1 "GND" H 8830 2302 50  0000 C CNN
F 2 "" H 8825 2475 50  0001 C CNN
F 3 "" H 8825 2475 50  0001 C CNN
	1    8825 2475
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5E58463D
P 8625 2475
F 0 "#PWR?" H 8625 2325 50  0001 C CNN
F 1 "+12V" H 8640 2648 50  0000 C CNN
F 2 "" H 8625 2475 50  0001 C CNN
F 3 "" H 8625 2475 50  0001 C CNN
	1    8625 2475
	-1   0    0    1   
$EndComp
Wire Wire Line
	8025 2475 8625 2475
Wire Wire Line
	8825 2375 8825 2475
Wire Wire Line
	8025 2375 8825 2375
Wire Wire Line
	8025 2175 8350 2175
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 5E592946
P 5250 3825
F 0 "J?" H 5168 3592 50  0001 C CNN
F 1 "Conn_01x03" H 5168 3591 50  0001 C CNN
F 2 "" H 5250 3825 50  0001 C CNN
F 3 "~" H 5250 3825 50  0001 C CNN
	1    5250 3825
	-1   0    0    1   
$EndComp
Text Label 5700 3725 2    50   ~ 0
CAN+
Text Label 5700 3825 2    50   ~ 0
CAN-
Text Label 5700 3925 2    50   ~ 0
GND
Text GLabel 5975 3725 1    50   Input ~ 0
CAN+
Text GLabel 6125 3725 1    50   Input ~ 0
CAN-
Wire Wire Line
	5450 3725 5975 3725
Wire Wire Line
	6125 3725 6125 3825
Wire Wire Line
	5450 3825 6125 3825
$Comp
L power:GND #PWR?
U 1 1 5E5B390B
P 5975 3925
F 0 "#PWR?" H 5975 3675 50  0001 C CNN
F 1 "GND" H 5980 3752 50  0000 C CNN
F 2 "" H 5975 3925 50  0001 C CNN
F 3 "" H 5975 3925 50  0001 C CNN
	1    5975 3925
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3925 5975 3925
$Comp
L Device:R R?
U 1 1 5E5BCBC5
P 8525 2125
F 0 "R?" H 8595 2171 50  0001 L CNN
F 1 "120" V 8525 2050 50  0000 L CNN
F 2 "" V 8455 2125 50  0001 C CNN
F 3 "~" H 8525 2125 50  0001 C CNN
	1    8525 2125
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2175 8350 1975
Wire Wire Line
	8025 2275 8525 2275
Wire Wire Line
	8350 1975 8525 1975
Connection ~ 8525 2275
Wire Wire Line
	8625 2275 8525 2275
Text GLabel 8625 2275 2    50   Input ~ 0
CAN-
Wire Wire Line
	8625 1975 8525 1975
Connection ~ 8525 1975
Wire Wire Line
	4400 2725 4400 3550
Wire Wire Line
	4400 3550 3700 3550
Wire Wire Line
	3700 3550 3700 3625
Wire Wire Line
	3800 2725 4400 2725
Wire Wire Line
	2675 2725 2675 3550
Wire Wire Line
	2675 3550 3400 3550
Wire Wire Line
	3400 3550 3400 3625
Wire Wire Line
	2675 2725 3300 2725
$Comp
L Device:R R?
U 1 1 5E5F2817
P 3550 3625
F 0 "R?" V 3343 3625 50  0001 C CNN
F 1 "120" V 3550 3625 50  0000 C CNN
F 2 "" V 3480 3625 50  0001 C CNN
F 3 "~" H 3550 3625 50  0001 C CNN
	1    3550 3625
	0    1    1    0   
$EndComp
Text GLabel 3700 3775 2    50   Input ~ 0
CAN+
Text GLabel 3400 3750 0    50   Input ~ 0
CAN-
Wire Wire Line
	3700 3775 3700 3625
Connection ~ 3700 3625
Wire Wire Line
	3400 3750 3400 3625
Connection ~ 3400 3625
$EndSCHEMATC
