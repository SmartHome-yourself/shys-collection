EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Neopixel Uhr"
Date "2022-07-07"
Rev "1.0"
Comp "SmartHome yourself"
Comment1 "https://smarthomeyourself.de/neopixeluhr"
Comment2 "Neopixel LED Uhr mit LED-Matrix Display"
Comment3 "ESPHome Projekt"
Comment4 ""
$EndDescr
$Comp
L ledmatrix:ledmatrix_mit_max7219 FC16-Matrix-Display1
U 1 1 62C82863
P 3030 2250
F 0 "FC16-Matrix-Display1" H 2955 2365 50  0000 C CNN
F 1 "ledmatrix_mit_max7219" H 2955 2274 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 3030 2250 50  0001 C CNN
F 3 "" H 3030 2250 50  0001 C CNN
	1    3030 2250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_PHOTO Photoresistor1
U 1 1 62C85B1F
P 3260 3840
F 0 "Photoresistor1" V 2935 3840 50  0000 C CNN
F 1 "R_PHOTO" V 3026 3840 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" V 3310 3590 50  0001 L CNN
F 3 "~" H 3260 3790 50  0001 C CNN
	1    3260 3840
	0    1    1    0   
$EndComp
$Comp
L Device:R 10k-Ohm1
U 1 1 62C89125
P 3530 3990
F 0 "10k-Ohm1" H 3460 3944 50  0000 R CNN
F 1 "R" H 3460 4035 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3460 3990 50  0001 C CNN
F 3 "~" H 3530 3990 50  0001 C CNN
	1    3530 3990
	-1   0    0    1   
$EndComp
$Comp
L Device:R 10k-Ohm2
U 1 1 62C9BAA8
P 3530 5350
F 0 "10k-Ohm2" H 3460 5304 50  0000 R CNN
F 1 "R" H 3460 5395 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3460 5350 50  0001 C CNN
F 3 "~" H 3530 5350 50  0001 C CNN
	1    3530 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:R 10k-Ohm3
U 1 1 62CA6C93
P 3530 6530
F 0 "10k-Ohm3" H 3460 6484 50  0000 R CNN
F 1 "R" H 3460 6575 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3460 6530 50  0001 C CNN
F 3 "~" H 3530 6530 50  0001 C CNN
	1    3530 6530
	-1   0    0    1   
$EndComp
Text GLabel 7310 2700 0    50   Input ~ 0
Neopixel-Ring
Text GLabel 7310 2800 0    50   Input ~ 0
LED-Matrix-DIN
Text GLabel 7310 2900 0    50   Input ~ 0
LED-Matrix-CS
Text GLabel 7310 3000 0    50   Input ~ 0
LED-Matrix-CLK
Text GLabel 7310 3600 0    50   Input ~ 0
Photoresistor
Text GLabel 7710 2300 2    50   Input ~ 0
GND
Text GLabel 7310 3300 0    50   Input ~ 0
RTC-SDA
Text GLabel 7310 3400 0    50   Input ~ 0
RTC-SCL
Text GLabel 7810 3900 3    50   Input ~ 0
5V
Text GLabel 7610 3900 3    50   Input ~ 0
3.3V
NoConn ~ 8110 3500
NoConn ~ 8110 3200
NoConn ~ 8110 3100
NoConn ~ 7310 3500
Text GLabel 7310 3100 0    50   Input ~ 0
Taster-1
Text GLabel 7310 3200 0    50   Input ~ 0
Taster-2
Text GLabel 3530 2500 2    50   Input ~ 0
GND
Text GLabel 2410 5200 0    50   Input ~ 0
GND
Text GLabel 2410 6380 0    50   Input ~ 0
GND
Text GLabel 3530 4140 3    50   Input ~ 0
GND
Wire Wire Line
	3530 3840 3410 3840
Wire Wire Line
	3410 5200 3530 5200
Wire Wire Line
	3410 6380 3530 6380
Text GLabel 3410 5200 1    50   Input ~ 0
Taster-1
Text GLabel 3410 6380 1    50   Input ~ 0
Taster-2
Text GLabel 3110 3840 0    50   Input ~ 0
5V
Text GLabel 3530 3840 1    50   Input ~ 0
Photoresistor
Text GLabel 3530 2400 2    50   Input ~ 0
5V
Text GLabel 3530 2600 2    50   Input ~ 0
LED-Matrix-DIN
Text GLabel 3530 2800 2    50   Input ~ 0
LED-Matrix-CLK
Text GLabel 3530 2700 2    50   Input ~ 0
LED-Matrix-CS
Text GLabel 3510 1350 2    50   Input ~ 0
Neopixel-Ring
Text GLabel 3530 5500 3    50   Input ~ 0
3.3V
Text GLabel 3530 6680 3    50   Input ~ 0
3.3V
Text GLabel 3510 1450 2    50   Input ~ 0
GND
Text GLabel 3510 1550 2    50   Input ~ 0
5V
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 62CC9439
P 9070 5420
F 0 "J1" H 9150 5412 50  0000 L CNN
F 1 "5V Input - Screw_Terminal_01x02" H 9150 5321 50  0000 L CNN
F 2 "digikey-footprints:Term_Block_1x2_P5.08MM" H 9070 5420 50  0001 C CNN
F 3 "~" H 9070 5420 50  0001 C CNN
	1    9070 5420
	1    0    0    -1  
$EndComp
Text GLabel 8460 5320 1    50   Input ~ 0
5V
Text GLabel 8460 5620 3    50   Input ~ 0
GND
$Comp
L Device:CP 1000uF1
U 1 1 62CCBA94
P 8460 5470
F 0 "1000uF1" H 8578 5516 50  0000 L CNN
F 1 "CP" H 8578 5425 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 8498 5320 50  0001 C CNN
F 3 "~" H 8460 5470 50  0001 C CNN
	1    8460 5470
	1    0    0    -1  
$EndComp
Wire Wire Line
	8460 5320 8870 5320
Wire Wire Line
	8870 5320 8870 5420
Wire Wire Line
	8460 5620 8870 5620
Wire Wire Line
	8870 5620 8870 5520
$Comp
L rtc:TinyRTC-I2C U1
U 1 1 62CD6F9F
P 6160 5050
F 0 "U1" H 6160 5165 50  0000 C CNN
F 1 "TinyRTC-I2C" H 6160 5074 50  0000 C CNN
F 2 "rtc:tinyRTC I2C" H 6210 5050 50  0001 C CNN
F 3 "" H 6210 5050 50  0001 C CNN
	1    6160 5050
	1    0    0    -1  
$EndComp
Text GLabel 6560 5500 2    50   Input ~ 0
RTC-SDA
Text GLabel 6560 5400 2    50   Input ~ 0
RTC-SCL
Text GLabel 6560 5600 2    50   Input ~ 0
5V
Text GLabel 6560 5700 2    50   Input ~ 0
GND
NoConn ~ 6560 5800
NoConn ~ 6560 5200
NoConn ~ 6560 5300
NoConn ~ 5760 5400
NoConn ~ 5760 5500
NoConn ~ 5760 5600
NoConn ~ 5760 5700
NoConn ~ 5760 5800
$Comp
L MCU_Module:WeMos_D1_mini D1-Mini1
U 1 1 62C748E7
P 7710 3100
F 0 "D1-Mini1" H 7710 2119 50  0000 C CNN
F 1 "WeMos_D1_mini" H 7710 2210 50  0000 C CNN
F 2 "wemos-d1-mini:wemos-d1-mini-connectors-only" H 7710 1950 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 5860 1950 50  0001 C CNN
	1    7710 3100
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 62CDB3B5
P 8870 5320
F 0 "#FLG0101" H 8870 5395 50  0001 C CNN
F 1 "PWR_FLAG" H 8870 5493 50  0000 C CNN
F 2 "" H 8870 5320 50  0001 C CNN
F 3 "~" H 8870 5320 50  0001 C CNN
	1    8870 5320
	1    0    0    -1  
$EndComp
Connection ~ 8870 5320
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 62CDC19A
P 8870 5620
F 0 "#FLG0102" H 8870 5695 50  0001 C CNN
F 1 "PWR_FLAG" H 8870 5793 50  0000 C CNN
F 2 "" H 8870 5620 50  0001 C CNN
F 3 "~" H 8870 5620 50  0001 C CNN
	1    8870 5620
	-1   0    0    1   
$EndComp
Connection ~ 8870 5620
$Comp
L hc-und-co:WS2812B_LED_connector LED1
U 1 1 62CF2FEC
P 3160 1450
F 0 "LED1" H 3102 1113 60  0000 C CNN
F 1 "WS2812B_LED_connector" H 3102 1219 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3160 1450 60  0001 C CNN
F 3 "" H 3160 1450 60  0000 C CNN
	1    3160 1450
	-1   0    0    1   
$EndComp
$Comp
L hc-und-co:SPST SW2
U 1 1 62CF6DD2
P 2910 6380
F 0 "SW2" H 2910 6645 50  0000 C CNN
F 1 "SPST" H 2910 6554 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2910 6380 50  0001 C CNN
F 3 "" H 2910 6380 50  0000 C CNN
	1    2910 6380
	1    0    0    -1  
$EndComp
$Comp
L hc-und-co:SPST SW1
U 1 1 62CF8046
P 2910 5200
F 0 "SW1" H 2910 5465 50  0000 C CNN
F 1 "SPST" H 2910 5374 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2910 5200 50  0001 C CNN
F 3 "" H 2910 5200 50  0000 C CNN
	1    2910 5200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
