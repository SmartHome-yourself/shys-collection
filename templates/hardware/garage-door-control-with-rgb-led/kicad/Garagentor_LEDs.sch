EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Garagentor LED Beleuchtung"
Date "2021-07-31"
Rev "1.0"
Comp "SmartHome yourself"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U2
U 1 1 61053ACD
P 7580 3430
F 0 "U2" H 7580 2449 50  0000 C CNN
F 1 "WeMos_D1_mini" H 7580 2540 50  0000 C CNN
F 2 "wemos-d1-mini:wemos-d1-mini-with-pin-header" H 7580 2280 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 5730 2280 50  0001 C CNN
	1    7580 3430
	-1   0    0    1   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:M20-9990246 J1
U 1 1 61056952
P 2260 1990
F 0 "J1" V 2035 1998 50  0000 C CNN
F 1 "Reed Sensor Oben" V 2126 1998 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm" H 2460 2190 60  0001 L CNN
F 3 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 2460 2290 60  0001 L CNN
F 4 "952-2262-ND" H 2460 2390 60  0001 L CNN "Digi-Key_PN"
F 5 "M20-9990246" H 2460 2490 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2460 2590 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2460 2690 60  0001 L CNN "Family"
F 8 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 2460 2790 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/harwin-inc/M20-9990246/952-2262-ND/3728226" H 2460 2890 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 2460 2990 60  0001 L CNN "Description"
F 11 "Harwin Inc." H 2460 3090 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2460 3190 60  0001 L CNN "Status"
	1    2260 1990
	0    1    1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:M20-9990246 J2
U 1 1 6105930C
P 2260 2840
F 0 "J2" V 2035 2848 50  0000 C CNN
F 1 "Reed Sensor Unten" V 2126 2848 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm" H 2460 3040 60  0001 L CNN
F 3 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 2460 3140 60  0001 L CNN
F 4 "952-2262-ND" H 2460 3240 60  0001 L CNN "Digi-Key_PN"
F 5 "M20-9990246" H 2460 3340 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2460 3440 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2460 3540 60  0001 L CNN "Family"
F 8 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 2460 3640 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/harwin-inc/M20-9990246/952-2262-ND/3728226" H 2460 3740 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 2460 3840 60  0001 L CNN "Description"
F 11 "Harwin Inc." H 2460 3940 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2460 4040 60  0001 L CNN "Status"
	1    2260 2840
	0    1    1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:M20-9990246 J3
U 1 1 6105A3BD
P 2260 3580
F 0 "J3" V 2035 3588 50  0000 C CNN
F 1 "Tor Taster" V 2126 3588 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm" H 2460 3780 60  0001 L CNN
F 3 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 2460 3880 60  0001 L CNN
F 4 "952-2262-ND" H 2460 3980 60  0001 L CNN "Digi-Key_PN"
F 5 "M20-9990246" H 2460 4080 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2460 4180 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2460 4280 60  0001 L CNN "Family"
F 8 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 2460 4380 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/harwin-inc/M20-9990246/952-2262-ND/3728226" H 2460 4480 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 2460 4580 60  0001 L CNN "Description"
F 11 "Harwin Inc." H 2460 4680 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2460 4780 60  0001 L CNN "Status"
	1    2260 3580
	0    1    1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J4
U 1 1 6105C6C0
P 2260 4370
F 0 "J4" V 2035 4378 50  0000 C CNN
F 1 "LED-Stripe" V 2126 4378 50  0000 C CNN
F 2 "terminalblocks:TerminalBlock_Altech_AK300-3_P5.00mm" H 2460 4570 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 2460 4670 60  0001 L CNN
F 4 "A19470-ND" H 2460 4770 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 2460 4870 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2460 4970 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2460 5070 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 2460 5170 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 2460 5270 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 2460 5370 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 2460 5470 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2460 5570 60  0001 L CNN "Status"
	1    2260 4370
	0    1    1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J5
U 1 1 6105D378
P 2260 5010
F 0 "J5" V 2035 5018 50  0000 C CNN
F 1 "Relais" V 2126 5018 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 2460 5210 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 2460 5310 60  0001 L CNN
F 4 "A19470-ND" H 2460 5410 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 2460 5510 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2460 5610 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2460 5710 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 2460 5810 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 2460 5910 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 2460 6010 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 2460 6110 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2460 6210 60  0001 L CNN "Status"
	1    2260 5010
	0    1    1    0   
$EndComp
Text GLabel 7680 4230 3    50   Input ~ 0
5V
Text GLabel 7580 2630 2    50   Input ~ 0
GND
Text GLabel 7180 3130 0    50   Input ~ 0
RELAIS_DATA
Text GLabel 7180 3230 0    50   Input ~ 0
DOOR_CLOSED
Text GLabel 7180 3330 0    50   Input ~ 0
DOOR_OPENED
Text GLabel 7180 3730 0    50   Input ~ 0
PUSH_BTN
Text GLabel 7180 3630 0    50   Input ~ 0
LED_DATA
Text GLabel 2360 5010 2    50   Input ~ 0
GND
Text GLabel 2360 5110 2    50   Input ~ 0
5V
Text GLabel 2360 4570 2    50   Input ~ 0
5V
Text GLabel 4710 4470 2    50   Input ~ 0
LED_DATA
Text GLabel 2360 5210 2    50   Input ~ 0
RELAIS_DATA
Text GLabel 2550 3680 2    50   Input ~ 0
PUSH_BTN
Text GLabel 2550 3980 2    50   Input ~ 0
GND
Wire Wire Line
	2360 3680 2550 3680
Text GLabel 2360 3580 2    50   Input ~ 0
5V
$Comp
L Device:R R3
U 1 1 610613B8
P 2360 3830
F 0 "R3" H 2430 3876 50  0000 L CNN
F 1 "10k" H 2430 3785 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2290 3830 50  0001 C CNN
F 3 "~" H 2360 3830 50  0001 C CNN
	1    2360 3830
	1    0    0    -1  
$EndComp
Connection ~ 2360 3680
Wire Wire Line
	2360 3980 2550 3980
Text GLabel 2550 3240 2    50   Input ~ 0
GND
Wire Wire Line
	2360 2940 2550 2940
$Comp
L Device:R R2
U 1 1 61067139
P 2360 3090
F 0 "R2" H 2430 3136 50  0000 L CNN
F 1 "10k" H 2430 3045 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2290 3090 50  0001 C CNN
F 3 "~" H 2360 3090 50  0001 C CNN
	1    2360 3090
	1    0    0    -1  
$EndComp
Wire Wire Line
	2360 3240 2550 3240
Connection ~ 2360 2940
$Comp
L Device:R R1
U 1 1 6107A8AD
P 2360 2240
F 0 "R1" H 2430 2286 50  0000 L CNN
F 1 "10k" H 2430 2195 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2290 2240 50  0001 C CNN
F 3 "~" H 2360 2240 50  0001 C CNN
	1    2360 2240
	1    0    0    -1  
$EndComp
Text GLabel 2550 2390 2    50   Input ~ 0
GND
Wire Wire Line
	2360 2090 2550 2090
Connection ~ 2360 2090
Wire Wire Line
	2360 2390 2550 2390
Text GLabel 2360 2840 2    50   Input ~ 0
5V
Text GLabel 2360 1990 2    50   Input ~ 0
5V
Text GLabel 2550 2940 2    50   Input ~ 0
DOOR_CLOSED
Text GLabel 2550 2090 2    50   Input ~ 0
DOOR_OPENED
$Comp
L levelshifter:4ch_levelshifter_bidir_BOB-12009 U1
U 1 1 6107ED47
P 4360 4720
F 0 "U1" H 4360 3805 50  0000 C CNN
F 1 "4ch_levelshifter_bidir_BOB-12009" H 4360 3896 50  0000 C CNN
F 2 "levelshifter:levelshifter_BOB12009" H 4360 4720 50  0001 C CNN
F 3 "" H 4360 4720 50  0001 C CNN
	1    4360 4720
	-1   0    0    1   
$EndComp
Text GLabel 7480 4230 3    50   Input ~ 0
3V3
Text GLabel 4710 4370 2    50   Input ~ 0
3V3
Text GLabel 4010 4370 0    50   Input ~ 0
5V
NoConn ~ 4010 4070
NoConn ~ 4010 4170
NoConn ~ 4710 4070
NoConn ~ 4710 4170
NoConn ~ 4710 4570
NoConn ~ 4010 4570
$Comp
L Device:R R4
U 1 1 6108509F
P 2960 4470
F 0 "R4" V 2870 4470 50  0000 C CNN
F 1 "62" V 2960 4470 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2890 4470 50  0001 C CNN
F 3 "~" H 2960 4470 50  0001 C CNN
	1    2960 4470
	0    1    1    0   
$EndComp
Wire Wire Line
	2360 4470 2810 4470
Wire Wire Line
	3110 4470 4010 4470
Text GLabel 4710 4270 2    50   Input ~ 0
GND
Text GLabel 2360 4370 2    50   Input ~ 0
GND
Text GLabel 4010 4270 0    50   Input ~ 0
GND
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:M20-9990246 J6
U 1 1 610A3159
P 5580 2040
F 0 "J6" H 5650 1820 50  0000 R CNN
F 1 "5V In" H 5730 1900 50  0000 R CNN
F 2 "terminalblocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 5780 2240 60  0001 L CNN
F 3 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 5780 2340 60  0001 L CNN
F 4 "952-2262-ND" H 5780 2440 60  0001 L CNN "Digi-Key_PN"
F 5 "M20-9990246" H 5780 2540 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 5780 2640 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 5780 2740 60  0001 L CNN "Family"
F 8 "https://cdn.harwin.com/pdfs/M20-999.pdf" H 5780 2840 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/harwin-inc/M20-9990246/952-2262-ND/3728226" H 5780 2940 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 5780 3040 60  0001 L CNN "Description"
F 11 "Harwin Inc." H 5780 3140 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5780 3240 60  0001 L CNN "Status"
	1    5580 2040
	-1   0    0    1   
$EndComp
Text GLabel 5480 2140 3    50   Input ~ 0
5V
Text GLabel 5580 2140 3    50   Input ~ 0
GND
$Comp
L Device:CP C1
U 1 1 610A9182
P 4480 2030
F 0 "C1" V 4690 1980 50  0000 L CNN
F 1 "16V 1000uF" V 4610 1790 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 4518 1880 50  0001 C CNN
F 3 "~" H 4480 2030 50  0001 C CNN
	1    4480 2030
	0    -1   -1   0   
$EndComp
Text GLabel 4330 2030 0    50   Input ~ 0
5V
Text GLabel 4630 2030 2    50   Input ~ 0
GND
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 610ACC24
P 5580 2140
F 0 "#FLG0101" H 5580 2215 50  0001 C CNN
F 1 "PWR_FLAG" V 5580 2268 50  0000 L CNN
F 2 "" H 5580 2140 50  0001 C CNN
F 3 "~" H 5580 2140 50  0001 C CNN
	1    5580 2140
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 610AD55E
P 5480 2140
F 0 "#FLG0102" H 5480 2215 50  0001 C CNN
F 1 "PWR_FLAG" V 5480 2267 50  0000 L CNN
F 2 "" H 5480 2140 50  0001 C CNN
F 3 "~" H 5480 2140 50  0001 C CNN
	1    5480 2140
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J8
U 1 1 6105C92C
P 5650 5150
F 0 "J8" V 5425 5158 50  0000 C CNN
F 1 "TX/RX" V 5516 5158 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5850 5350 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 5850 5450 60  0001 L CNN
F 4 "WM4200-ND" H 5850 5550 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 5850 5650 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 5850 5750 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 5850 5850 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 5850 5950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 5850 6050 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 5850 6150 60  0001 L CNN "Description"
F 11 "Molex" H 5850 6250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5850 6350 60  0001 L CNN "Status"
	1    5650 5150
	0    1    1    0   
$EndComp
Text GLabel 7980 3430 2    50   Input ~ 0
TX
Text GLabel 7980 3530 2    50   Input ~ 0
RX
Text GLabel 5750 5250 2    50   Input ~ 0
RX
Text GLabel 5750 5150 2    50   Input ~ 0
TX
$Comp
L Connector:Conn_01x06_Male J7
U 1 1 61065CBA
P 5610 4390
F 0 "J7" H 5718 4771 50  0000 C CNN
F 1 "Pinout" H 5718 4680 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 5610 4390 50  0001 C CNN
F 3 "~" H 5610 4390 50  0001 C CNN
	1    5610 4390
	1    0    0    -1  
$EndComp
Text GLabel 7180 3030 0    50   Input ~ 0
D8
Text GLabel 7180 3430 0    50   Input ~ 0
D4
Text GLabel 7180 3530 0    50   Input ~ 0
D3
Text GLabel 7180 3830 0    50   Input ~ 0
D0
Text GLabel 7180 3930 0    50   Input ~ 0
A0
Text GLabel 7980 3830 2    50   Input ~ 0
RST
Text GLabel 5810 4190 2    50   Input ~ 0
D8
Text GLabel 5810 4290 2    50   Input ~ 0
D4
Text GLabel 5810 4390 2    50   Input ~ 0
D3
Text GLabel 5810 4490 2    50   Input ~ 0
D0
Text GLabel 5810 4590 2    50   Input ~ 0
A0
Text GLabel 5810 4690 2    50   Input ~ 0
RST
$EndSCHEMATC
