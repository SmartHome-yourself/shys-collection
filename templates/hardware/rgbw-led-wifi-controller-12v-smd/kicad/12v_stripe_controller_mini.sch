EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "12V RGB Stripe Controller"
Date "2020-11-20"
Rev "1.0"
Comp "Scheidler IT Solutions"
Comment1 "SmartHomeYourself.de"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L hc-und-co:MOSFET_N_CH Q1
U 1 1 5FB86DF2
P 7870 3880
F 0 "Q1" H 8060 3926 50  0000 L CNN
F 1 "IRLZ34N-Blue" H 8060 3835 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 8070 3980 50  0001 C CNN
F 3 "" H 7870 3880 50  0000 C CNN
	1    7870 3880
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5FB8D6FC
P 7290 3880
F 0 "D1" H 7280 3720 50  0000 C CNN
F 1 "1N4007" H 7270 3800 50  0000 C CNN
F 2 "Source_Footprints:DO-214AC" H 7290 3880 50  0001 C CNN
F 3 "~" H 7290 3880 50  0001 C CNN
	1    7290 3880
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 5FB8F4B3
P 7290 4010
F 0 "R1" V 7370 4010 50  0000 C CNN
F 1 "10k" V 7290 4010 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 7220 4010 50  0001 C CNN
F 3 "~" H 7290 4010 50  0001 C CNN
	1    7290 4010
	0    1    1    0   
$EndComp
Wire Wire Line
	7440 4010 7440 3880
Wire Wire Line
	7440 3880 7670 3880
Connection ~ 7440 3880
Text GLabel 6380 2970 0    50   Input ~ 0
RED
Text GLabel 6970 4010 0    50   Input ~ 0
GND
Wire Wire Line
	7140 4010 6970 4010
$Comp
L hc-und-co:MOSFET_N_CH Q2
U 1 1 5FB9AF02
P 7880 2970
F 0 "Q2" H 8071 3016 50  0000 L CNN
F 1 "IRLZ34N-Red" H 8071 2925 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 8080 3070 50  0001 C CNN
F 3 "" H 7880 2970 50  0000 C CNN
	1    7880 2970
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FB9CDBB
P 7300 3110
F 0 "R2" V 7390 3120 50  0000 C CNN
F 1 "10k" V 7300 3110 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 7230 3110 50  0001 C CNN
F 3 "~" H 7300 3110 50  0001 C CNN
	1    7300 3110
	0    1    1    0   
$EndComp
$Comp
L Device:D D2
U 1 1 5FB9E30B
P 7300 2970
F 0 "D2" H 7300 2810 50  0000 C CNN
F 1 "1N4007" H 7290 2890 50  0000 C CNN
F 2 "Source_Footprints:DO-214AC" H 7300 2970 50  0001 C CNN
F 3 "~" H 7300 2970 50  0001 C CNN
	1    7300 2970
	-1   0    0    1   
$EndComp
Wire Wire Line
	7450 2970 7680 2970
Wire Wire Line
	7450 3110 7450 2970
Connection ~ 7450 2970
Text GLabel 6370 3880 0    50   Input ~ 0
BLUE
Text GLabel 6980 3110 0    50   Input ~ 0
GND
Wire Wire Line
	6980 2970 7150 2970
Wire Wire Line
	7150 3110 6980 3110
Text GLabel 7970 4170 3    50   Input ~ 0
GND
Text GLabel 7980 3270 3    50   Input ~ 0
GND
Wire Wire Line
	7970 4080 7970 4170
Wire Wire Line
	7980 3170 7980 3270
Text GLabel 10040 1910 0    50   Input ~ 0
12V
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5FBB01D0
P 1070 730
F 0 "J1" V 1034 542 50  0000 R CNN
F 1 "12V Input" V 943 542 50  0000 R CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 1070 730 50  0001 C CNN
F 3 "~" H 1070 730 50  0001 C CNN
	1    1070 730 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1170 930  1170 1160
Wire Wire Line
	1170 1310 1510 1310
Wire Wire Line
	1070 930  1070 1610
Wire Wire Line
	1070 1610 1180 1610
Text GLabel 930  1610 0    50   Input ~ 0
GND
Text GLabel 1250 1160 2    50   Input ~ 0
12V
Wire Wire Line
	1250 1160 1170 1160
Connection ~ 1170 1160
Wire Wire Line
	1170 1160 1170 1310
Wire Wire Line
	930  1610 1070 1610
Connection ~ 1070 1610
Text GLabel 1210 3570 0    50   Input ~ 0
RED
Text GLabel 1210 3670 0    50   Input ~ 0
GREEN
Text GLabel 1210 3770 0    50   Input ~ 0
BLUE
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J4
U 1 1 5FBBA719
P 9030 5140
F 0 "J4" V 9121 5012 50  0000 R CNN
F 1 "3V3 Out" V 9030 5012 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9230 5340 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 9230 5440 60  0001 L CNN
F 4 "WM4200-ND" H 9230 5540 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 9230 5640 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 9230 5740 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 9230 5840 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 9230 5940 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 9230 6040 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 9230 6140 60  0001 L CNN "Description"
F 11 "Molex" H 9230 6240 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9230 6340 60  0001 L CNN "Status"
	1    9030 5140
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J6
U 1 1 5FBC0146
P 9040 5550
F 0 "J6" V 9131 5422 50  0000 R CNN
F 1 "RX/TX" V 9040 5422 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9240 5750 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 9240 5850 60  0001 L CNN
F 4 "WM4200-ND" H 9240 5950 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 9240 6050 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 9240 6150 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 9240 6250 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 9240 6350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 9240 6450 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 9240 6550 60  0001 L CNN "Description"
F 11 "Molex" H 9240 6650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9240 6750 60  0001 L CNN "Status"
	1    9040 5550
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232041 J2
U 1 1 5FBC3CB3
P 9040 6170
F 0 "J2" V 9230 5980 50  0000 C CNN
F 1 "SPI" V 9140 5960 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9240 6370 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 9240 6470 60  0001 L CNN
F 4 "WM4202-ND" H 9240 6570 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232041" H 9240 6670 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 9240 6770 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 9240 6870 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 9240 6970 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232041/WM4202-ND/26671" H 9240 7070 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 4POS 2.54MM" H 9240 7170 60  0001 L CNN "Description"
F 11 "Molex" H 9240 7270 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9240 7370 60  0001 L CNN "Status"
	1    9040 6170
	0    -1   -1   0   
$EndComp
Text GLabel 2450 1310 2    50   Input ~ 0
3V3
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:B5B-XH-A_LF__SN_ J7
U 1 1 62CC7648
P 10140 2310
F 0 "J7" V 10381 2182 50  0000 R CNN
F 1 "B5B-XH-A_LF__SN_" V 10290 2182 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 10340 2510 60  0001 L CNN
F 3 "http://www.jst-mfg.com/product/pdf/eng/eXH.pdf" H 10340 2610 60  0001 L CNN
F 4 "455-2270-ND" H 10340 2710 60  0001 L CNN "Digi-Key_PN"
F 5 "B5B-XH-A(LF)(SN)" H 10340 2810 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10340 2910 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 10340 3010 60  0001 L CNN "Family"
F 8 "http://www.jst-mfg.com/product/pdf/eng/eXH.pdf" H 10340 3110 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/jst-sales-america-inc/B5B-XH-A(LF)(SN)/455-2270-ND/1530483" H 10340 3210 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 5POS 2.5MM" H 10340 3310 60  0001 L CNN "Description"
F 11 "JST Sales America Inc." H 10340 3410 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10340 3510 60  0001 L CNN "Status"
	1    10140 2310
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7990 2190 7990 2310
Text GLabel 7990 2310 3    50   Input ~ 0
GND
Wire Wire Line
	6990 2130 7160 2130
Wire Wire Line
	6990 1990 7160 1990
Text GLabel 6990 2130 0    50   Input ~ 0
GND
Text GLabel 6390 1990 0    50   Input ~ 0
GREEN
Connection ~ 7460 1990
Wire Wire Line
	7460 1990 7690 1990
Wire Wire Line
	7460 2130 7460 1990
$Comp
L Device:D D3
U 1 1 5FB9F617
P 7310 1990
F 0 "D3" H 7300 1820 50  0000 C CNN
F 1 "1N4007" H 7300 1900 50  0000 C CNN
F 2 "Source_Footprints:DO-214AC" H 7310 1990 50  0001 C CNN
F 3 "~" H 7310 1990 50  0001 C CNN
	1    7310 1990
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5FB9D700
P 7310 2130
F 0 "R3" V 7400 2140 50  0000 C CNN
F 1 "10k" V 7310 2130 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 7240 2130 50  0001 C CNN
F 3 "~" H 7310 2130 50  0001 C CNN
	1    7310 2130
	0    1    1    0   
$EndComp
$Comp
L hc-und-co:MOSFET_N_CH Q3
U 1 1 5FB9BAD7
P 7890 1990
F 0 "Q3" H 8080 2036 50  0000 L CNN
F 1 "IRLZ34N-Green" H 8080 1945 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 8090 2090 50  0001 C CNN
F 3 "" H 7890 1990 50  0000 C CNN
	1    7890 1990
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1210 8000 1330
Text GLabel 8000 1330 3    50   Input ~ 0
GND
Wire Wire Line
	7000 1150 7170 1150
Wire Wire Line
	7000 1010 7170 1010
Text GLabel 7000 1150 0    50   Input ~ 0
GND
Connection ~ 7470 1010
Wire Wire Line
	7470 1010 7700 1010
Wire Wire Line
	7470 1150 7470 1010
$Comp
L Device:D D4
U 1 1 62CF643F
P 7320 1010
F 0 "D4" H 7310 840 50  0000 C CNN
F 1 "1N4007" H 7310 920 50  0000 C CNN
F 2 "Source_Footprints:DO-214AC" H 7320 1010 50  0001 C CNN
F 3 "~" H 7320 1010 50  0001 C CNN
	1    7320 1010
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 62CF6449
P 7320 1150
F 0 "R4" V 7410 1160 50  0000 C CNN
F 1 "10k" V 7320 1150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 7250 1150 50  0001 C CNN
F 3 "~" H 7320 1150 50  0001 C CNN
	1    7320 1150
	0    1    1    0   
$EndComp
$Comp
L hc-und-co:MOSFET_N_CH Q4
U 1 1 62CF6453
P 7900 1010
F 0 "Q4" H 8090 1056 50  0000 L CNN
F 1 "IRLZ34N-White" H 8090 965 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 8100 1110 50  0001 C CNN
F 3 "" H 7900 1010 50  0000 C CNN
	1    7900 1010
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 810  9360 810 
Wire Wire Line
	9360 810  9360 2010
Wire Wire Line
	9360 2010 10040 2010
Wire Wire Line
	10040 2110 9190 2110
Wire Wire Line
	9190 2110 9190 1790
Wire Wire Line
	9190 1790 7990 1790
Wire Wire Line
	7980 2770 9190 2770
Wire Wire Line
	9190 2770 9190 2210
Wire Wire Line
	9190 2210 10040 2210
Wire Wire Line
	10040 2310 9360 2310
Wire Wire Line
	9360 2310 9360 3680
Wire Wire Line
	9360 3680 7970 3680
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 62D0B6B7
P 1180 1610
F 0 "#FLG0101" H 1180 1685 50  0001 C CNN
F 1 "PWR_FLAG" H 1180 1783 50  0000 C CNN
F 2 "" H 1180 1610 50  0001 C CNN
F 3 "~" H 1180 1610 50  0001 C CNN
	1    1180 1610
	1    0    0    -1  
$EndComp
Connection ~ 1180 1610
Wire Wire Line
	1180 1610 2030 1610
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 62D0D100
P 1510 1310
F 0 "#FLG0102" H 1510 1385 50  0001 C CNN
F 1 "PWR_FLAG" H 1510 1483 50  0000 C CNN
F 2 "" H 1510 1310 50  0001 C CNN
F 3 "~" H 1510 1310 50  0001 C CNN
	1    1510 1310
	1    0    0    -1  
$EndComp
Connection ~ 1510 1310
Wire Wire Line
	1510 1310 1730 1310
Text GLabel 6400 1010 0    50   Input ~ 0
WHITE
$Comp
L Regulator_Linear:NCP1117-12_SOT223 U2
U 1 1 64C728AA
P 2030 1310
F 0 "U2" H 2030 1552 50  0000 C CNN
F 1 "NCP1117-12_SOT223" H 2030 1461 50  0000 C CNN
F 2 "Source_Footprints:SOT-223" H 2030 1510 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/NCP1117-D.PDF" H 2130 1060 50  0001 C CNN
	1    2030 1310
	1    0    0    -1  
$EndComp
Text Notes 710  2060 0    50   ~ 0
Spannungsregulator: ZLDO1117  (3.3V)\n\nhttps://cdn-reichelt.de/documents/datenblatt/A100/ZETEX_1117_ENG_TDS.pdf
Wire Wire Line
	2330 1310 2450 1310
Text GLabel 890  3870 0    50   Input ~ 0
3V3
Text GLabel 3110 3870 2    50   Input ~ 0
GND
$Comp
L Device:C C1
U 1 1 64C9112B
P 1030 4020
F 0 "C1" H 915 3974 50  0000 R CNN
F 1 "100nF" H 915 4065 50  0000 R CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P1.50mm" H 1068 3870 50  0001 C CNN
F 3 "~" H 1030 4020 50  0001 C CNN
	1    1030 4020
	-1   0    0    1   
$EndComp
Text GLabel 1030 4170 3    50   Input ~ 0
GND
Wire Wire Line
	890  3870 1030 3870
$Comp
L esp:ESP-12F U1
U 1 1 64C788B9
P 1210 3170
F 0 "U1" H 2160 3460 60  0000 C CNN
F 1 "ESP-12F" H 2160 3354 60  0000 C CNN
F 2 "ESP8266:ESP-12E" H 1210 3170 50  0001 C CNN
F 3 "http://www.esp8266.com/wiki/doku.php?id=esp8266-module-family" H 1210 3170 50  0001 C CNN
	1    1210 3170
	1    0    0    -1  
$EndComp
Wire Wire Line
	1210 3870 1030 3870
Connection ~ 1030 3870
$Comp
L dk_Tactile-Switches:B3F-1000 S1
U 1 1 64C9A363
P 1160 6790
F 0 "S1" H 1160 7137 60  0000 C CNN
F 1 "B3F-1000" H 1160 7031 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_B3F-1xxx" H 1360 6990 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 1360 7090 60  0001 L CNN
F 4 "SW400-ND" H 1360 7190 60  0001 L CNN "Digi-Key_PN"
F 5 "B3F-1000" H 1360 7290 60  0001 L CNN "MPN"
F 6 "Switches" H 1360 7390 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 1360 7490 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 1360 7590 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3F-1000/SW400-ND/33150" H 1360 7690 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 1360 7790 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 1360 7890 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1360 7990 60  0001 L CNN "Status"
	1    1160 6790
	1    0    0    -1  
$EndComp
Text GLabel 1210 3170 0    50   Input ~ 0
RST
Text GLabel 960  6690 0    50   Input ~ 0
RST
Text GLabel 960  7190 3    50   Input ~ 0
3V3
$Comp
L Device:R R5
U 1 1 64CA351B
P 960 7040
F 0 "R5" H 1030 7086 50  0000 L CNN
F 1 "10K" H 1030 6995 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 890 7040 50  0001 C CNN
F 3 "~" H 960 7040 50  0001 C CNN
	1    960  7040
	1    0    0    -1  
$EndComp
Text Notes 870  6340 0    50   ~ 0
RESET BUTTON
Text GLabel 1210 3370 0    50   Input ~ 0
EN
Text GLabel 6040 6880 1    50   Input ~ 0
EN
$Comp
L Device:R R9
U 1 1 64CA8E4E
P 6040 7030
F 0 "R9" H 6110 7076 50  0000 L CNN
F 1 "10K" H 6110 6985 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 5970 7030 50  0001 C CNN
F 3 "~" H 6040 7030 50  0001 C CNN
	1    6040 7030
	1    0    0    -1  
$EndComp
Text GLabel 6040 7180 3    50   Input ~ 0
3V3
Text Notes 5870 6710 0    50   ~ 0
EN PullUp
Text GLabel 1360 6690 2    50   Input ~ 0
GND
Wire Wire Line
	1360 6690 1360 6890
$Comp
L Device:R R10
U 1 1 64CAC6DB
P 6430 7020
F 0 "R10" H 6500 7066 50  0000 L CNN
F 1 "10K" H 6500 6975 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 6360 7020 50  0001 C CNN
F 3 "~" H 6430 7020 50  0001 C CNN
	1    6430 7020
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 64CAD044
P 5680 7020
F 0 "R8" H 5750 7066 50  0000 L CNN
F 1 "10K" H 5750 6975 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 5610 7020 50  0001 C CNN
F 3 "~" H 5680 7020 50  0001 C CNN
	1    5680 7020
	1    0    0    -1  
$EndComp
Text GLabel 5680 7170 3    50   Input ~ 0
GND
Text GLabel 3110 3770 2    50   Input ~ 0
GPIO15
Text GLabel 5680 6870 1    50   Input ~ 0
GPIO15
Text GLabel 6430 7170 3    50   Input ~ 0
3V3
Text Notes 5510 6530 0    50   ~ 0
PullDown
Text GLabel 3110 3670 2    50   Input ~ 0
GPIO2
Text GLabel 6430 6870 1    50   Input ~ 0
GPIO2
Text Notes 6310 6580 0    50   ~ 0
PullUp
$Comp
L dk_Tactile-Switches:B3F-1000 S2
U 1 1 64CB3913
P 2480 6780
F 0 "S2" H 2480 7127 60  0000 C CNN
F 1 "B3F-1000" H 2480 7021 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_B3F-1xxx" H 2680 6980 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 2680 7080 60  0001 L CNN
F 4 "SW400-ND" H 2680 7180 60  0001 L CNN "Digi-Key_PN"
F 5 "B3F-1000" H 2680 7280 60  0001 L CNN "MPN"
F 6 "Switches" H 2680 7380 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 2680 7480 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 2680 7580 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3F-1000/SW400-ND/33150" H 2680 7680 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 2680 7780 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 2680 7880 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2680 7980 60  0001 L CNN "Status"
	1    2480 6780
	1    0    0    -1  
$EndComp
Text GLabel 3110 3570 2    50   Input ~ 0
FLASH-BTN
Text GLabel 2280 6680 0    50   Input ~ 0
FLASH-BTN
$Comp
L Device:R R6
U 1 1 64CB87AB
P 2280 7030
F 0 "R6" H 2350 7076 50  0000 L CNN
F 1 "10K" H 2350 6985 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 2210 7030 50  0001 C CNN
F 3 "~" H 2280 7030 50  0001 C CNN
	1    2280 7030
	1    0    0    -1  
$EndComp
Text GLabel 2280 7180 3    50   Input ~ 0
3V3
Text Notes 2210 6330 0    50   ~ 0
FLASH BUTTON
Text GLabel 2680 6680 2    50   Input ~ 0
GND
Wire Wire Line
	2680 6680 2680 6880
NoConn ~ 1210 3470
Text GLabel 3110 3370 2    50   Input ~ 0
WHITE
Text GLabel 8940 5450 0    50   Input ~ 0
RX
Text GLabel 8940 5550 0    50   Input ~ 0
TX
Text GLabel 3110 3170 2    50   Input ~ 0
TX
Text GLabel 3110 3270 2    50   Input ~ 0
RX
NoConn ~ 2110 4570
NoConn ~ 2210 4570
Text GLabel 1210 3270 0    50   Input ~ 0
A0
Text GLabel 8930 5140 0    50   Input ~ 0
3V3
Text GLabel 8930 5040 0    50   Input ~ 0
GND
Text GLabel 8940 5870 0    50   Input ~ 0
SCLK
Text GLabel 8940 5970 0    50   Input ~ 0
MOSI
Text GLabel 8940 6070 0    50   Input ~ 0
MISO
Text GLabel 8940 6170 0    50   Input ~ 0
CS
Text GLabel 2410 4570 3    50   Input ~ 0
SCLK
Text GLabel 2310 4570 3    50   Input ~ 0
MOSI
Text GLabel 2010 4570 3    50   Input ~ 0
MISO
Text GLabel 1910 4570 3    50   Input ~ 0
CS
$Comp
L Device:R R14
U 1 1 64CC9251
P 6550 1010
F 0 "R14" V 6343 1010 50  0000 C CNN
F 1 "10" V 6434 1010 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6480 1010 50  0001 C CNN
F 3 "~" H 6550 1010 50  0001 C CNN
	1    6550 1010
	0    1    1    0   
$EndComp
$Comp
L Device:LED D8
U 1 1 64CCA99F
P 6850 1010
F 0 "D8" H 6843 755 50  0000 C CNN
F 1 "LED" H 6843 846 50  0000 C CNN
F 2 "LEDs:LED_0805" H 6850 1010 50  0001 C CNN
F 3 "~" H 6850 1010 50  0001 C CNN
	1    6850 1010
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 64CCDF3E
P 6840 1990
F 0 "D7" H 6833 1735 50  0000 C CNN
F 1 "LED" H 6833 1826 50  0000 C CNN
F 2 "LEDs:LED_0805" H 6840 1990 50  0001 C CNN
F 3 "~" H 6840 1990 50  0001 C CNN
	1    6840 1990
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 64CCEB95
P 6540 1990
F 0 "R13" V 6333 1990 50  0000 C CNN
F 1 "10" V 6424 1990 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6470 1990 50  0001 C CNN
F 3 "~" H 6540 1990 50  0001 C CNN
	1    6540 1990
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 64CD0033
P 6530 2970
F 0 "R12" V 6323 2970 50  0000 C CNN
F 1 "10" V 6414 2970 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6460 2970 50  0001 C CNN
F 3 "~" H 6530 2970 50  0001 C CNN
	1    6530 2970
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 64CD073B
P 6520 3880
F 0 "R11" V 6313 3880 50  0000 C CNN
F 1 "10" V 6404 3880 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6450 3880 50  0001 C CNN
F 3 "~" H 6520 3880 50  0001 C CNN
	1    6520 3880
	0    1    1    0   
$EndComp
$Comp
L Device:LED D6
U 1 1 64CD10E9
P 6830 2970
F 0 "D6" H 6823 2715 50  0000 C CNN
F 1 "LED" H 6823 2806 50  0000 C CNN
F 2 "LEDs:LED_0805" H 6830 2970 50  0001 C CNN
F 3 "~" H 6830 2970 50  0001 C CNN
	1    6830 2970
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 64CD24E5
P 6820 3880
F 0 "D5" H 6813 3625 50  0000 C CNN
F 1 "LED" H 6813 3716 50  0000 C CNN
F 2 "LEDs:LED_0805" H 6820 3880 50  0001 C CNN
F 3 "~" H 6820 3880 50  0001 C CNN
	1    6820 3880
	-1   0    0    1   
$EndComp
Wire Wire Line
	6970 3880 7140 3880
$Comp
L dk_Tactile-Switches:B3F-1000 S3
U 1 1 64CD94F1
P 4310 6780
F 0 "S3" H 4310 7127 60  0000 C CNN
F 1 "B3F-1000" H 4310 7021 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_B3F-1xxx" H 4510 6980 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 4510 7080 60  0001 L CNN
F 4 "SW400-ND" H 4510 7180 60  0001 L CNN "Digi-Key_PN"
F 5 "B3F-1000" H 4510 7280 60  0001 L CNN "MPN"
F 6 "Switches" H 4510 7380 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 4510 7480 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 4510 7580 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3F-1000/SW400-ND/33150" H 4510 7680 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 4510 7780 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 4510 7880 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4510 7980 60  0001 L CNN "Status"
	1    4310 6780
	1    0    0    -1  
$EndComp
Text GLabel 4110 6680 0    50   Input ~ 0
MODE-BTN
$Comp
L Device:R R7
U 1 1 64CD94FC
P 4110 7030
F 0 "R7" H 4180 7076 50  0000 L CNN
F 1 "10K" H 4180 6985 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" V 4040 7030 50  0001 C CNN
F 3 "~" H 4110 7030 50  0001 C CNN
	1    4110 7030
	1    0    0    -1  
$EndComp
Text GLabel 4110 7180 3    50   Input ~ 0
3V3
Text Notes 4040 6330 0    50   ~ 0
MODE BUTTON
Text GLabel 4510 6680 2    50   Input ~ 0
GND
Wire Wire Line
	4510 6680 4510 6880
Text GLabel 3110 3470 2    50   Input ~ 0
MODE-BTN
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J3
U 1 1 64CE850F
P 7650 6170
F 0 "J3" V 7791 6042 50  0000 R CNN
F 1 "640456-3" V 7700 6042 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7850 6370 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7850 6470 60  0001 L CNN
F 4 "A19470-ND" H 7850 6570 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 7850 6670 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7850 6770 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7850 6870 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7850 6970 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 7850 7070 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 7850 7170 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 7850 7270 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7850 7370 60  0001 L CNN "Status"
	1    7650 6170
	0    -1   -1   0   
$EndComp
Text GLabel 7550 5970 0    50   Input ~ 0
A0
Text GLabel 7550 6170 0    50   Input ~ 0
3V3
Text GLabel 7550 6070 0    50   Input ~ 0
GND
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J5
U 1 1 64CD2571
P 10140 2920
F 0 "J5" V 10231 2792 50  0000 R CNN
F 1 "white" V 10140 2792 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10340 3120 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 3220 60  0001 L CNN
F 4 "WM4200-ND" H 10340 3320 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 10340 3420 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10340 3520 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 10340 3620 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 3720 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 10340 3820 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 10340 3920 60  0001 L CNN "Description"
F 11 "Molex" H 10340 4020 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10340 4120 60  0001 L CNN "Status"
	1    10140 2920
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J8
U 1 1 64CD7DE8
P 10140 3300
F 0 "J8" V 10231 3172 50  0000 R CNN
F 1 "green" V 10140 3172 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10340 3500 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 3600 60  0001 L CNN
F 4 "WM4200-ND" H 10340 3700 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 10340 3800 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10340 3900 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 10340 4000 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 4100 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 10340 4200 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 10340 4300 60  0001 L CNN "Description"
F 11 "Molex" H 10340 4400 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10340 4500 60  0001 L CNN "Status"
	1    10140 3300
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J9
U 1 1 64CD8A81
P 10140 3670
F 0 "J9" V 10231 3542 50  0000 R CNN
F 1 "red" V 10140 3542 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10340 3870 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 3970 60  0001 L CNN
F 4 "WM4200-ND" H 10340 4070 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 10340 4170 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10340 4270 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 10340 4370 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 4470 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 10340 4570 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 10340 4670 60  0001 L CNN "Description"
F 11 "Molex" H 10340 4770 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10340 4870 60  0001 L CNN "Status"
	1    10140 3670
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J10
U 1 1 64CD983E
P 10140 4040
F 0 "J10" V 10231 3912 50  0000 R CNN
F 1 "blue" V 10140 3912 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10340 4240 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 4340 60  0001 L CNN
F 4 "WM4200-ND" H 10340 4440 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 10340 4540 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10340 4640 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 10340 4740 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 10340 4840 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 10340 4940 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 10340 5040 60  0001 L CNN "Description"
F 11 "Molex" H 10340 5140 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10340 5240 60  0001 L CNN "Status"
	1    10140 4040
	0    -1   -1   0   
$EndComp
Text GLabel 8000 810  0    50   Input ~ 0
WHITE_OUT
Text GLabel 7990 1790 0    50   Input ~ 0
GREEN_OUT
Text GLabel 7980 2770 0    50   Input ~ 0
RED_OUT
Text GLabel 7970 3680 0    50   Input ~ 0
BLUE_OUT
Text GLabel 10040 2820 0    50   Input ~ 0
12V
Text GLabel 10040 3200 0    50   Input ~ 0
12V
Text GLabel 10040 3570 0    50   Input ~ 0
12V
Text GLabel 10040 3940 0    50   Input ~ 0
12V
Text GLabel 10040 2920 0    50   Input ~ 0
WHITE_OUT
Text GLabel 10040 3300 0    50   Input ~ 0
GREEN_OUT
Text GLabel 10040 3670 0    50   Input ~ 0
RED_OUT
Text GLabel 10040 4040 0    50   Input ~ 0
BLUE_OUT
$EndSCHEMATC
