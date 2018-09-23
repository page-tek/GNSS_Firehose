EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 10 11
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
L GNSS_Firehose:PJ-063BH J8
U 1 1 58DB547A
P 1400 2300
F 0 "J8" H 1050 1950 60  0000 C CNN
F 1 "PJ-063BH" H 1050 1800 60  0000 C CNN
F 2 "footprints:PJ-063BH" H 1400 2300 60  0001 C CNN
F 3 "" H 1400 2300 60  0001 C CNN
	1    1400 2300
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:PMOSFET Q1
U 1 1 58DB5B80
P 3100 2350
F 0 "Q1" V 2650 2350 60  0000 C CNN
F 1 "Si2369DS" V 2550 2350 60  0000 C CNN
F 2 "footprints:SOT23" H 3110 2350 60  0001 C CNN
F 3 "" H 3110 2350 60  0001 C CNN
	1    3100 2350
	0    1    -1   0   
$EndComp
$Comp
L GNSS_Firehose:TVS Z1
U 1 1 58DB5D9E
P 1950 2500
F 0 "Z1" V 1450 2500 60  0000 C CNN
F 1 "SMAJ9.0CA" V 1550 2500 60  0000 C CNN
F 2 "footprints:SMAJ" H 1950 2500 60  0001 C CNN
F 3 "" H 1950 2500 60  0001 C CNN
	1    1950 2500
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0215
U 1 1 58DB5E05
P 1950 2700
F 0 "#PWR0215" H 2150 2600 50  0001 C CNN
F 1 "GND" H 2150 2500 50  0001 C CNN
F 2 "" H 1950 2700 50  0001 C CNN
F 3 "" H 1950 2700 50  0001 C CNN
	1    1950 2700
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0216
U 1 1 58DB80EE
P 3200 2650
F 0 "#PWR0216" H 3400 2550 50  0001 C CNN
F 1 "GND" H 3400 2450 50  0001 C CNN
F 2 "" H 3200 2650 50  0001 C CNN
F 3 "" H 3200 2650 50  0001 C CNN
	1    3200 2650
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0217
U 1 1 58DB812C
P 1700 2600
F 0 "#PWR0217" H 1900 2500 50  0001 C CNN
F 1 "GND" H 1900 2400 50  0001 C CNN
F 2 "" H 1700 2600 50  0001 C CNN
F 3 "" H 1700 2600 50  0001 C CNN
	1    1700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2450 1700 2450
Wire Wire Line
	1700 2450 1700 2550
Wire Wire Line
	1600 2300 1950 2300
Wire Wire Line
	2700 2300 2850 2300
Connection ~ 3450 2300
Connection ~ 3750 2300
$Comp
L GNSS_Firehose:R R75
U 1 1 58DB8DDF
P 8600 5200
F 0 "R75" H 8600 5050 50  0000 C CNN
F 1 "330" H 8600 4950 50  0000 C CNN
F 2 "footprints:0402" H 8600 5200 50  0001 C CNN
F 3 "" H 8600 5200 50  0001 C CNN
	1    8600 5200
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:LED LED4
U 1 1 58DB8E71
P 9000 5200
F 0 "LED4" H 9050 5050 60  0000 C CNN
F 1 "LED" H 9050 4900 60  0001 C CNN
F 2 "footprints:APA2106" H 9010 5200 60  0001 C CNN
F 3 "" H 9010 5200 60  0001 C CNN
	1    9000 5200
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0218
U 1 1 58DB8ECB
P 9300 5300
F 0 "#PWR0218" H 9500 5200 50  0001 C CNN
F 1 "GND" H 9500 5100 50  0001 C CNN
F 2 "" H 9300 5300 50  0001 C CNN
F 3 "" H 9300 5300 50  0001 C CNN
	1    9300 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5200 8300 5200
Wire Wire Line
	8750 5200 8850 5200
Wire Wire Line
	9150 5200 9300 5200
Wire Wire Line
	9300 5200 9300 5250
$Comp
L GNSS_Firehose:VCC_3V3_DIG #PWR0219
U 1 1 58E06686
P 8300 5200
F 0 "#PWR0219" H 8480 4970 50  0001 C CNN
F 1 "VCC_3V3_DIG" H 8430 5070 50  0001 C CNN
F 2 "" H 8300 5200 50  0001 C CNN
F 3 "" H 8300 5200 50  0001 C CNN
	1    8300 5200
	1    0    0    -1  
$EndComp
Text Notes 9050 950  0    150  ~ 30
Power
Text Notes 1050 3150 0    100  ~ 20
DC input
Text Notes 1250 3400 0    100  ~ 20
5V
$Comp
L GNSS_Firehose:LMZ10501 U13
U 1 1 5AB8A5F4
P 6150 2950
F 0 "U13" H 6200 3250 60  0000 L CNN
F 1 "LMZ10501" H 6200 3150 60  0000 L CNN
F 2 "footprints:LDFN8" H 6150 2950 60  0001 C CNN
F 3 "" H 6150 2950 60  0001 C CNN
	1    6150 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2300 3350 2300
Wire Wire Line
	6150 2300 6150 2650
$Comp
L GNSS_Firehose:GND #PWR0220
U 1 1 5AB8AB56
P 6250 3650
F 0 "#PWR0220" H 6450 3550 50  0001 C CNN
F 1 "GND" H 6450 3450 50  0001 C CNN
F 2 "" H 6250 3650 50  0001 C CNN
F 3 "" H 6250 3650 50  0001 C CNN
	1    6250 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3450 6150 3500
Wire Wire Line
	6150 3500 6250 3500
Wire Wire Line
	6350 3500 6350 3450
Wire Wire Line
	6250 3450 6250 3500
Connection ~ 6250 3500
$Comp
L GNSS_Firehose:VCC_1V2 #PWR0221
U 1 1 5AB8AC48
P 8300 2850
F 0 "#PWR0221" H 8480 2620 50  0001 C CNN
F 1 "VCC_1V2" H 8430 2720 50  0001 C CNN
F 2 "" H 8300 2850 50  0001 C CNN
F 3 "" H 8300 2850 50  0001 C CNN
	1    8300 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2900 6750 2900
Wire Wire Line
	8300 2900 8300 2850
Wire Wire Line
	6600 3050 6750 3050
Wire Wire Line
	6750 3050 6750 2900
Connection ~ 6750 2900
$Comp
L GNSS_Firehose:test_point TP21
U 1 1 5AB8ACB7
P 5450 2800
F 0 "TP21" H 5450 3050 50  0000 C CNN
F 1 "test_point" H 5450 2950 50  0000 C CNN
F 2 "footprints:TP_SMT" H 5450 2800 50  0001 C CNN
F 3 "" H 5450 2800 50  0001 C CNN
	1    5450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2900 5450 2900
Wire Wire Line
	5450 2900 5450 2800
$Comp
L GNSS_Firehose:R R61
U 1 1 5AB8ADE6
P 4900 3200
F 0 "R61" H 4910 3300 50  0000 C CNN
F 1 "R" H 4900 3090 50  0000 C CNN
F 2 "footprints:0402" H 4900 3200 50  0001 C CNN
F 3 "" H 4900 3200 50  0001 C CNN
	1    4900 3200
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:R R64
U 1 1 5AB8AE25
P 5200 3400
F 0 "R64" H 5210 3500 50  0000 C CNN
F 1 "R" H 5200 3290 50  0000 C CNN
F 2 "footprints:0402" H 5200 3400 50  0001 C CNN
F 3 "" H 5200 3400 50  0001 C CNN
	1    5200 3400
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C180
U 1 1 5AB8AE6E
P 5500 3400
F 0 "C180" H 5510 3520 50  0000 C CNN
F 1 "C" H 5490 3290 50  0000 C CNN
F 2 "footprints:0402" H 5500 3400 50  0001 C CNN
F 3 "" H 5500 3400 50  0001 C CNN
	1    5500 3400
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0222
U 1 1 5AB8AEDC
P 5200 3600
F 0 "#PWR0222" H 5400 3500 50  0001 C CNN
F 1 "GND" H 5400 3400 50  0001 C CNN
F 2 "" H 5200 3600 50  0001 C CNN
F 3 "" H 5200 3600 50  0001 C CNN
	1    5200 3600
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0223
U 1 1 5AB8AF0E
P 5500 3600
F 0 "#PWR0223" H 5700 3500 50  0001 C CNN
F 1 "GND" H 5700 3400 50  0001 C CNN
F 2 "" H 5500 3600 50  0001 C CNN
F 3 "" H 5500 3600 50  0001 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3200 5200 3200
Wire Wire Line
	5500 3250 5500 3200
Connection ~ 5500 3200
Wire Wire Line
	5200 3250 5200 3200
Connection ~ 5200 3200
Wire Wire Line
	5700 3050 4700 3050
Wire Wire Line
	4700 3050 4700 3200
Wire Wire Line
	4700 3200 4750 3200
$Comp
L GNSS_Firehose:LMZ10501 U14
U 1 1 5AB8B1BA
P 6250 4600
F 0 "U14" H 6300 4900 60  0000 L CNN
F 1 "LMZ10501" H 6300 4800 60  0000 L CNN
F 2 "footprints:LDFN8" H 6250 4600 60  0001 C CNN
F 3 "" H 6250 4600 60  0001 C CNN
	1    6250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3950 6250 4300
$Comp
L GNSS_Firehose:GND #PWR0224
U 1 1 5AB8B1C1
P 6350 5300
F 0 "#PWR0224" H 6550 5200 50  0001 C CNN
F 1 "GND" H 6550 5100 50  0001 C CNN
F 2 "" H 6350 5300 50  0001 C CNN
F 3 "" H 6350 5300 50  0001 C CNN
	1    6350 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 5100 6250 5150
Wire Wire Line
	6250 5150 6350 5150
Wire Wire Line
	6450 5150 6450 5100
Wire Wire Line
	6350 5100 6350 5150
Connection ~ 6350 5150
Wire Wire Line
	6700 4550 6850 4550
Wire Wire Line
	8300 4550 8300 4500
Wire Wire Line
	6700 4700 6850 4700
Wire Wire Line
	6850 4700 6850 4550
Connection ~ 6850 4550
$Comp
L GNSS_Firehose:test_point TP23
U 1 1 5AB8B1D7
P 5550 4450
F 0 "TP23" H 5550 4700 50  0000 C CNN
F 1 "test_point" H 5550 4600 50  0000 C CNN
F 2 "footprints:TP_SMT" H 5550 4450 50  0001 C CNN
F 3 "" H 5550 4450 50  0001 C CNN
	1    5550 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4550 5550 4550
Wire Wire Line
	5550 4550 5550 4450
$Comp
L GNSS_Firehose:R R62
U 1 1 5AB8B1DF
P 5000 4850
F 0 "R62" H 5010 4950 50  0000 C CNN
F 1 "R" H 5000 4740 50  0000 C CNN
F 2 "footprints:0402" H 5000 4850 50  0001 C CNN
F 3 "" H 5000 4850 50  0001 C CNN
	1    5000 4850
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:R R65
U 1 1 5AB8B1E5
P 5300 5050
F 0 "R65" H 5310 5150 50  0000 C CNN
F 1 "R" H 5300 4940 50  0000 C CNN
F 2 "footprints:0402" H 5300 5050 50  0001 C CNN
F 3 "" H 5300 5050 50  0001 C CNN
	1    5300 5050
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C181
U 1 1 5AB8B1EB
P 5600 5050
F 0 "C181" H 5610 5170 50  0000 C CNN
F 1 "C" H 5590 4940 50  0000 C CNN
F 2 "footprints:0402" H 5600 5050 50  0001 C CNN
F 3 "" H 5600 5050 50  0001 C CNN
	1    5600 5050
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0225
U 1 1 5AB8B1F1
P 5300 5250
F 0 "#PWR0225" H 5500 5150 50  0001 C CNN
F 1 "GND" H 5500 5050 50  0001 C CNN
F 2 "" H 5300 5250 50  0001 C CNN
F 3 "" H 5300 5250 50  0001 C CNN
	1    5300 5250
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0226
U 1 1 5AB8B1F7
P 5600 5250
F 0 "#PWR0226" H 5800 5150 50  0001 C CNN
F 1 "GND" H 5800 5050 50  0001 C CNN
F 2 "" H 5600 5250 50  0001 C CNN
F 3 "" H 5600 5250 50  0001 C CNN
	1    5600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4850 5300 4850
Wire Wire Line
	5600 4900 5600 4850
Connection ~ 5600 4850
Wire Wire Line
	5300 4900 5300 4850
Connection ~ 5300 4850
Wire Wire Line
	5800 4700 4800 4700
Wire Wire Line
	4800 4700 4800 4850
Wire Wire Line
	4800 4850 4850 4850
$Comp
L GNSS_Firehose:LMZ10501 U16
U 1 1 5AB8B4CB
P 6250 6250
F 0 "U16" H 6300 6550 60  0000 L CNN
F 1 "LMZ10501" H 6300 6450 60  0000 L CNN
F 2 "footprints:LDFN8" H 6250 6250 60  0001 C CNN
F 3 "" H 6250 6250 60  0001 C CNN
	1    6250 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 5600 6250 5950
$Comp
L GNSS_Firehose:GND #PWR0227
U 1 1 5AB8B4D2
P 6350 6950
F 0 "#PWR0227" H 6550 6850 50  0001 C CNN
F 1 "GND" H 6550 6750 50  0001 C CNN
F 2 "" H 6350 6950 50  0001 C CNN
F 3 "" H 6350 6950 50  0001 C CNN
	1    6350 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 6750 6250 6800
Wire Wire Line
	6250 6800 6350 6800
Wire Wire Line
	6450 6800 6450 6750
Wire Wire Line
	6350 6750 6350 6800
Connection ~ 6350 6800
Wire Wire Line
	6700 6200 6850 6200
Wire Wire Line
	8600 6200 8600 6150
Wire Wire Line
	6700 6350 6850 6350
Wire Wire Line
	6850 6350 6850 6200
Connection ~ 6850 6200
$Comp
L GNSS_Firehose:test_point TP24
U 1 1 5AB8B4E8
P 5550 6100
F 0 "TP24" H 5550 6350 50  0000 C CNN
F 1 "test_point" H 5550 6250 50  0000 C CNN
F 2 "footprints:TP_SMT" H 5550 6100 50  0001 C CNN
F 3 "" H 5550 6100 50  0001 C CNN
	1    5550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 6200 5550 6200
Wire Wire Line
	5550 6200 5550 6100
$Comp
L GNSS_Firehose:R R63
U 1 1 5AB8B4F0
P 5000 6500
F 0 "R63" H 5010 6600 50  0000 C CNN
F 1 "R" H 5000 6390 50  0000 C CNN
F 2 "footprints:0402" H 5000 6500 50  0001 C CNN
F 3 "" H 5000 6500 50  0001 C CNN
	1    5000 6500
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:R R66
U 1 1 5AB8B4F6
P 5300 6700
F 0 "R66" H 5310 6800 50  0000 C CNN
F 1 "R" H 5300 6590 50  0000 C CNN
F 2 "footprints:0402" H 5300 6700 50  0001 C CNN
F 3 "" H 5300 6700 50  0001 C CNN
	1    5300 6700
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C188
U 1 1 5AB8B4FC
P 5600 6700
F 0 "C188" H 5610 6820 50  0000 C CNN
F 1 "C" H 5590 6590 50  0000 C CNN
F 2 "footprints:0402" H 5600 6700 50  0001 C CNN
F 3 "" H 5600 6700 50  0001 C CNN
	1    5600 6700
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0228
U 1 1 5AB8B502
P 5300 6900
F 0 "#PWR0228" H 5500 6800 50  0001 C CNN
F 1 "GND" H 5500 6700 50  0001 C CNN
F 2 "" H 5300 6900 50  0001 C CNN
F 3 "" H 5300 6900 50  0001 C CNN
	1    5300 6900
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0229
U 1 1 5AB8B508
P 5600 6900
F 0 "#PWR0229" H 5800 6800 50  0001 C CNN
F 1 "GND" H 5800 6700 50  0001 C CNN
F 2 "" H 5600 6900 50  0001 C CNN
F 3 "" H 5600 6900 50  0001 C CNN
	1    5600 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 6500 5300 6500
Wire Wire Line
	5600 6550 5600 6500
Connection ~ 5600 6500
Wire Wire Line
	5300 6550 5300 6500
Connection ~ 5300 6500
Wire Wire Line
	5800 6350 4800 6350
Wire Wire Line
	4800 6350 4800 6500
Wire Wire Line
	4800 6500 4850 6500
$Comp
L GNSS_Firehose:VCC_3V3_DIG #PWR0230
U 1 1 5AB8B55F
P 8300 4500
F 0 "#PWR0230" H 8480 4270 50  0001 C CNN
F 1 "VCC_3V3_DIG" H 8430 4370 50  0001 C CNN
F 2 "" H 8300 4500 50  0001 C CNN
F 3 "" H 8300 4500 50  0001 C CNN
	1    8300 4500
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:VCC_3V3_AN #PWR0231
U 1 1 5AB8B5A1
P 8600 6150
F 0 "#PWR0231" H 8780 5920 50  0001 C CNN
F 1 "VCC_3V3_AN" H 8730 6020 50  0001 C CNN
F 2 "" H 8600 6150 50  0001 C CNN
F 3 "" H 8600 6150 50  0001 C CNN
	1    8600 6150
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:L FB19
U 1 1 5AB8B651
P 7850 6200
F 0 "FB19" H 7860 6280 50  0000 C CNN
F 1 "L" H 7860 6120 50  0000 C CNN
F 2 "footprints:0603" H 7850 6200 50  0001 C CNN
F 3 "" H 7850 6200 50  0001 C CNN
	1    7850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 6200 8100 6200
Wire Wire Line
	7000 4650 7000 4550
Connection ~ 7000 4550
Wire Wire Line
	7300 4650 7300 4550
Connection ~ 7300 4550
Wire Wire Line
	7600 4550 7600 4650
Connection ~ 7600 4550
$Comp
L GNSS_Firehose:GND #PWR0232
U 1 1 5AB8C57B
P 7600 5000
F 0 "#PWR0232" H 7800 4900 50  0001 C CNN
F 1 "GND" H 7800 4800 50  0001 C CNN
F 2 "" H 7600 5000 50  0001 C CNN
F 3 "" H 7600 5000 50  0001 C CNN
	1    7600 5000
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0233
U 1 1 5AB8C50D
P 7300 5000
F 0 "#PWR0233" H 7500 4900 50  0001 C CNN
F 1 "GND" H 7500 4800 50  0001 C CNN
F 2 "" H 7300 5000 50  0001 C CNN
F 3 "" H 7300 5000 50  0001 C CNN
	1    7300 5000
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0234
U 1 1 5AB8C49F
P 7000 5000
F 0 "#PWR0234" H 7200 4900 50  0001 C CNN
F 1 "GND" H 7200 4800 50  0001 C CNN
F 2 "" H 7000 5000 50  0001 C CNN
F 3 "" H 7000 5000 50  0001 C CNN
	1    7000 5000
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:C C197
U 1 1 5AB8C004
P 7600 4800
F 0 "C197" V 7900 4800 50  0000 C CNN
F 1 "10uF" V 8000 4800 50  0000 C CNN
F 2 "footprints:0805" H 7600 4800 50  0001 C CNN
F 3 "" H 7600 4800 50  0001 C CNN
	1    7600 4800
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C194
U 1 1 5AB8BFFE
P 7300 4800
F 0 "C194" V 7600 4800 50  0000 C CNN
F 1 "10uF" V 7700 4800 50  0000 C CNN
F 2 "footprints:0805" H 7300 4800 50  0001 C CNN
F 3 "" H 7300 4800 50  0001 C CNN
	1    7300 4800
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C190
U 1 1 5AB8BFF8
P 7000 4800
F 0 "C190" V 7300 4800 50  0000 C CNN
F 1 "10uF" V 7400 4800 50  0000 C CNN
F 2 "footprints:0805" H 7000 4800 50  0001 C CNN
F 3 "" H 7000 4800 50  0001 C CNN
	1    7000 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 3000 7000 2900
Wire Wire Line
	7300 3000 7300 2900
Wire Wire Line
	7600 2900 7600 3000
$Comp
L GNSS_Firehose:GND #PWR0235
U 1 1 5AB8D421
P 7600 3350
F 0 "#PWR0235" H 7800 3250 50  0001 C CNN
F 1 "GND" H 7800 3150 50  0001 C CNN
F 2 "" H 7600 3350 50  0001 C CNN
F 3 "" H 7600 3350 50  0001 C CNN
	1    7600 3350
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0236
U 1 1 5AB8D427
P 7300 3350
F 0 "#PWR0236" H 7500 3250 50  0001 C CNN
F 1 "GND" H 7500 3150 50  0001 C CNN
F 2 "" H 7300 3350 50  0001 C CNN
F 3 "" H 7300 3350 50  0001 C CNN
	1    7300 3350
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0237
U 1 1 5AB8D42D
P 7000 3350
F 0 "#PWR0237" H 7200 3250 50  0001 C CNN
F 1 "GND" H 7200 3150 50  0001 C CNN
F 2 "" H 7000 3350 50  0001 C CNN
F 3 "" H 7000 3350 50  0001 C CNN
	1    7000 3350
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:C C196
U 1 1 5AB8D433
P 7600 3150
F 0 "C196" V 7900 3150 50  0000 C CNN
F 1 "10uF" V 8000 3150 50  0000 C CNN
F 2 "footprints:0805" H 7600 3150 50  0001 C CNN
F 3 "" H 7600 3150 50  0001 C CNN
	1    7600 3150
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C192
U 1 1 5AB8D439
P 7300 3150
F 0 "C192" V 7600 3150 50  0000 C CNN
F 1 "10uF" V 7700 3150 50  0000 C CNN
F 2 "footprints:0805" H 7300 3150 50  0001 C CNN
F 3 "" H 7300 3150 50  0001 C CNN
	1    7300 3150
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C189
U 1 1 5AB8D43F
P 7000 3150
F 0 "C189" V 7300 3150 50  0000 C CNN
F 1 "10uF" V 7400 3150 50  0000 C CNN
F 2 "footprints:0805" H 7000 3150 50  0001 C CNN
F 3 "" H 7000 3150 50  0001 C CNN
	1    7000 3150
	0    1    1    0   
$EndComp
Connection ~ 7000 2900
Connection ~ 7300 2900
Connection ~ 7600 2900
$Comp
L GNSS_Firehose:R R67
U 1 1 5AB8D5C7
P 8000 2900
F 0 "R67" H 7900 3150 50  0000 C CNN
F 1 "0" H 7900 3050 50  0000 C CNN
F 2 "footprints:0402" H 8000 2900 50  0001 C CNN
F 3 "" H 8000 2900 50  0001 C CNN
	1    8000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 6300 7000 6200
Wire Wire Line
	7300 6300 7300 6200
Wire Wire Line
	7600 6300 7600 6200
$Comp
L GNSS_Firehose:GND #PWR0238
U 1 1 5AB8D7BD
P 7600 6650
F 0 "#PWR0238" H 7800 6550 50  0001 C CNN
F 1 "GND" H 7800 6450 50  0001 C CNN
F 2 "" H 7600 6650 50  0001 C CNN
F 3 "" H 7600 6650 50  0001 C CNN
	1    7600 6650
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0239
U 1 1 5AB8D7C3
P 7300 6650
F 0 "#PWR0239" H 7500 6550 50  0001 C CNN
F 1 "GND" H 7500 6450 50  0001 C CNN
F 2 "" H 7300 6650 50  0001 C CNN
F 3 "" H 7300 6650 50  0001 C CNN
	1    7300 6650
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0240
U 1 1 5AB8D7C9
P 7000 6650
F 0 "#PWR0240" H 7200 6550 50  0001 C CNN
F 1 "GND" H 7200 6450 50  0001 C CNN
F 2 "" H 7000 6650 50  0001 C CNN
F 3 "" H 7000 6650 50  0001 C CNN
	1    7000 6650
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:C C198
U 1 1 5AB8D7CF
P 7600 6450
F 0 "C198" V 7900 6450 50  0000 C CNN
F 1 "10uF" V 8000 6450 50  0000 C CNN
F 2 "footprints:0805" H 7600 6450 50  0001 C CNN
F 3 "" H 7600 6450 50  0001 C CNN
	1    7600 6450
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C195
U 1 1 5AB8D7D5
P 7300 6450
F 0 "C195" V 7600 6450 50  0000 C CNN
F 1 "10uF" V 7700 6450 50  0000 C CNN
F 2 "footprints:0805" H 7300 6450 50  0001 C CNN
F 3 "" H 7300 6450 50  0001 C CNN
	1    7300 6450
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C191
U 1 1 5AB8D7DB
P 7000 6450
F 0 "C191" V 7300 6450 50  0000 C CNN
F 1 "10uF" V 7400 6450 50  0000 C CNN
F 2 "footprints:0805" H 7000 6450 50  0001 C CNN
F 3 "" H 7000 6450 50  0001 C CNN
	1    7000 6450
	0    1    1    0   
$EndComp
Connection ~ 7000 6200
Connection ~ 7300 6200
Connection ~ 7600 6200
Wire Wire Line
	8100 6300 8100 6200
Wire Wire Line
	8400 6300 8400 6200
$Comp
L GNSS_Firehose:GND #PWR0241
U 1 1 5AB8D97B
P 8400 6650
F 0 "#PWR0241" H 8600 6550 50  0001 C CNN
F 1 "GND" H 8600 6450 50  0001 C CNN
F 2 "" H 8400 6650 50  0001 C CNN
F 3 "" H 8400 6650 50  0001 C CNN
	1    8400 6650
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0242
U 1 1 5AB8D981
P 8100 6650
F 0 "#PWR0242" H 8300 6550 50  0001 C CNN
F 1 "GND" H 8300 6450 50  0001 C CNN
F 2 "" H 8100 6650 50  0001 C CNN
F 3 "" H 8100 6650 50  0001 C CNN
	1    8100 6650
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:C C200
U 1 1 5AB8D987
P 8400 6450
F 0 "C200" V 8700 6450 50  0000 C CNN
F 1 "10uF" V 8800 6450 50  0000 C CNN
F 2 "footprints:0805" H 8400 6450 50  0001 C CNN
F 3 "" H 8400 6450 50  0001 C CNN
	1    8400 6450
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C199
U 1 1 5AB8D98D
P 8100 6450
F 0 "C199" V 8400 6450 50  0000 C CNN
F 1 "10uF" V 8500 6450 50  0000 C CNN
F 2 "footprints:0805" H 8100 6450 50  0001 C CNN
F 3 "" H 8100 6450 50  0001 C CNN
	1    8100 6450
	0    1    1    0   
$EndComp
Connection ~ 8100 6200
Connection ~ 8400 6200
Wire Wire Line
	8150 2900 8300 2900
$Comp
L GNSS_Firehose:R R68
U 1 1 5AB8DEFD
P 8000 4550
F 0 "R68" H 7900 4800 50  0000 C CNN
F 1 "0" H 7900 4700 50  0000 C CNN
F 2 "footprints:0402" H 8000 4550 50  0001 C CNN
F 3 "" H 8000 4550 50  0001 C CNN
	1    8000 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4550 8300 4550
Wire Wire Line
	4400 5600 6250 5600
Wire Wire Line
	4400 2300 4400 3950
Connection ~ 4400 2300
Wire Wire Line
	6250 3950 4400 3950
Connection ~ 4400 3950
$Comp
L GNSS_Firehose:L FB18
U 1 1 5AB8E9BC
P 2550 2300
F 0 "FB18" H 2550 2650 50  0000 C CNN
F 1 "L" H 2550 2550 50  0000 C CNN
F 2 "footprints:0603" H 2550 2300 50  0001 C CNN
F 3 "" H 2550 2300 50  0001 C CNN
	1    2550 2300
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:C C174
U 1 1 5AB8F02B
P 2300 2450
F 0 "C174" V 2650 2450 50  0000 C CNN
F 1 "100nF" V 2750 2450 50  0000 C CNN
F 2 "footprints:0402" H 2300 2450 50  0001 C CNN
F 3 "" H 2300 2450 50  0001 C CNN
	1    2300 2450
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0243
U 1 1 5AB8F031
P 2300 2650
F 0 "#PWR0243" H 2500 2550 50  0001 C CNN
F 1 "GND" H 2500 2450 50  0001 C CNN
F 2 "" H 2300 2650 50  0001 C CNN
F 3 "" H 2300 2650 50  0001 C CNN
	1    2300 2650
	1    0    0    -1  
$EndComp
Connection ~ 2300 2300
Wire Wire Line
	3450 2400 3450 2300
Wire Wire Line
	3750 2400 3750 2300
Wire Wire Line
	4050 2300 4050 2400
$Comp
L GNSS_Firehose:GND #PWR0244
U 1 1 5AB8F8F1
P 4050 2750
F 0 "#PWR0244" H 4250 2650 50  0001 C CNN
F 1 "GND" H 4250 2550 50  0001 C CNN
F 2 "" H 4050 2750 50  0001 C CNN
F 3 "" H 4050 2750 50  0001 C CNN
	1    4050 2750
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0245
U 1 1 5AB8F8F7
P 3750 2750
F 0 "#PWR0245" H 3950 2650 50  0001 C CNN
F 1 "GND" H 3950 2550 50  0001 C CNN
F 2 "" H 3750 2750 50  0001 C CNN
F 3 "" H 3750 2750 50  0001 C CNN
	1    3750 2750
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:GND #PWR0246
U 1 1 5AB8F8FD
P 3450 2750
F 0 "#PWR0246" H 3650 2650 50  0001 C CNN
F 1 "GND" H 3650 2550 50  0001 C CNN
F 2 "" H 3450 2750 50  0001 C CNN
F 3 "" H 3450 2750 50  0001 C CNN
	1    3450 2750
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:C C179
U 1 1 5AB8F903
P 4050 2550
F 0 "C179" V 4350 2550 50  0000 C CNN
F 1 "10uF" V 4450 2550 50  0000 C CNN
F 2 "footprints:0805" H 4050 2550 50  0001 C CNN
F 3 "" H 4050 2550 50  0001 C CNN
	1    4050 2550
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C178
U 1 1 5AB8F909
P 3750 2550
F 0 "C178" V 4050 2550 50  0000 C CNN
F 1 "10uF" V 4150 2550 50  0000 C CNN
F 2 "footprints:0805" H 3750 2550 50  0001 C CNN
F 3 "" H 3750 2550 50  0001 C CNN
	1    3750 2550
	0    1    1    0   
$EndComp
$Comp
L GNSS_Firehose:C C175
U 1 1 5AB8F90F
P 3450 2550
F 0 "C175" V 3750 2550 50  0000 C CNN
F 1 "10uF" V 3850 2550 50  0000 C CNN
F 2 "footprints:0805" H 3450 2550 50  0001 C CNN
F 3 "" H 3450 2550 50  0001 C CNN
	1    3450 2550
	0    1    1    0   
$EndComp
Connection ~ 4050 2300
$Comp
L GNSS_Firehose:R R69
U 1 1 5AB9373D
P 3100 1950
F 0 "R69" H 3000 2200 50  0000 C CNN
F 1 "0" H 3000 2100 50  0000 C CNN
F 2 "footprints:0402" H 3100 1950 50  0001 C CNN
F 3 "" H 3100 1950 50  0001 C CNN
	1    3100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1950 3350 1950
Wire Wire Line
	3350 1950 3350 2300
Connection ~ 3350 2300
Wire Wire Line
	2950 1950 2850 1950
Wire Wire Line
	2850 1950 2850 2300
Connection ~ 2850 2300
Wire Wire Line
	1950 2350 1950 2300
Connection ~ 1950 2300
$Comp
L GNSS_Firehose:test_point TP1
U 1 1 5AD2E395
P 8650 2750
F 0 "TP1" H 8650 3000 50  0000 C CNN
F 1 "1V2" H 8650 2900 50  0000 C CNN
F 2 "footprints:TP_SMT2MM" H 8650 2750 50  0001 C CNN
F 3 "" H 8650 2750 50  0001 C CNN
	1    8650 2750
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:test_point TP5
U 1 1 5AD2E432
P 8900 2750
F 0 "TP5" H 9100 2800 50  0000 C CNN
F 1 "1V2" H 9100 2700 50  0000 C CNN
F 2 "footprints:TP_SMT2MM" H 8900 2750 50  0001 C CNN
F 3 "" H 8900 2750 50  0001 C CNN
	1    8900 2750
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:test_point TP2
U 1 1 5AD2E4C3
P 8650 4400
F 0 "TP2" H 8650 4650 50  0000 C CNN
F 1 "3V3_DIG" H 8650 4550 50  0000 C CNN
F 2 "footprints:TP_SMT2MM" H 8650 4400 50  0001 C CNN
F 3 "" H 8650 4400 50  0001 C CNN
	1    8650 4400
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:test_point TP6
U 1 1 5AD2E59C
P 8900 4400
F 0 "TP6" H 9100 4450 50  0000 C CNN
F 1 "3V3_DIG" H 9200 4350 50  0000 C CNN
F 2 "footprints:TP_SMT2MM" H 8900 4400 50  0001 C CNN
F 3 "" H 8900 4400 50  0001 C CNN
	1    8900 4400
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:test_point TP7
U 1 1 5AD2E742
P 8950 6050
F 0 "TP7" H 8950 6300 50  0000 C CNN
F 1 "3V3_AN" H 8950 6200 50  0000 C CNN
F 2 "footprints:TP_SMT2MM" H 8950 6050 50  0001 C CNN
F 3 "" H 8950 6050 50  0001 C CNN
	1    8950 6050
	1    0    0    -1  
$EndComp
$Comp
L GNSS_Firehose:test_point TP8
U 1 1 5AD2E815
P 9200 6050
F 0 "TP8" H 9400 6100 50  0000 C CNN
F 1 "3V3_AN" H 9450 6000 50  0000 C CNN
F 2 "footprints:TP_SMT2MM" H 9200 6050 50  0001 C CNN
F 3 "" H 9200 6050 50  0001 C CNN
	1    9200 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2900 8900 2750
Connection ~ 8300 2900
Wire Wire Line
	8650 2750 8650 2900
Connection ~ 8650 2900
Wire Wire Line
	8900 4550 8900 4400
Connection ~ 8300 4550
Wire Wire Line
	8650 4400 8650 4550
Connection ~ 8650 4550
Wire Wire Line
	9200 6200 9200 6050
Connection ~ 8600 6200
Wire Wire Line
	8950 6050 8950 6200
Connection ~ 8950 6200
Wire Wire Line
	3450 2300 3750 2300
Wire Wire Line
	3750 2300 4050 2300
Wire Wire Line
	6250 3500 6350 3500
Wire Wire Line
	6250 3500 6250 3600
Wire Wire Line
	6750 2900 7000 2900
Wire Wire Line
	5500 3200 5700 3200
Wire Wire Line
	5200 3200 5500 3200
Wire Wire Line
	6350 5150 6450 5150
Wire Wire Line
	6350 5150 6350 5250
Wire Wire Line
	6850 4550 7000 4550
Wire Wire Line
	5600 4850 5800 4850
Wire Wire Line
	5300 4850 5600 4850
Wire Wire Line
	6350 6800 6450 6800
Wire Wire Line
	6350 6800 6350 6900
Wire Wire Line
	6850 6200 7000 6200
Wire Wire Line
	5600 6500 5800 6500
Wire Wire Line
	5300 6500 5600 6500
Wire Wire Line
	7000 4550 7300 4550
Wire Wire Line
	7300 4550 7600 4550
Wire Wire Line
	7600 4550 7850 4550
Wire Wire Line
	7000 2900 7300 2900
Wire Wire Line
	7300 2900 7600 2900
Wire Wire Line
	7600 2900 7850 2900
Wire Wire Line
	7000 6200 7300 6200
Wire Wire Line
	7300 6200 7600 6200
Wire Wire Line
	7600 6200 7700 6200
Wire Wire Line
	8100 6200 8400 6200
Wire Wire Line
	8400 6200 8600 6200
Wire Wire Line
	4400 2300 6150 2300
Wire Wire Line
	4400 3950 4400 5600
Wire Wire Line
	2300 2300 2400 2300
Wire Wire Line
	4050 2300 4400 2300
Wire Wire Line
	3350 2300 3450 2300
Wire Wire Line
	2850 2300 2900 2300
Wire Wire Line
	1950 2300 2300 2300
Wire Wire Line
	8300 2900 8650 2900
Wire Wire Line
	8650 2900 8900 2900
Wire Wire Line
	8300 4550 8650 4550
Wire Wire Line
	8650 4550 8900 4550
Wire Wire Line
	8600 6200 8950 6200
Wire Wire Line
	8950 6200 9200 6200
$EndSCHEMATC