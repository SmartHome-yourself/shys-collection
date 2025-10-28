EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Hue Ambience clone"
Date "2020-12-16"
Rev "1.0"
Comp "Scheidler IT Solutions"
Comment1 "SmartHome yourself"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 5FD94E01
P 5970 2990
F 0 "U1" V 5530 2540 50  0000 C CNN
F 1 "WeMos_D1_mini" V 5610 2570 50  0000 C CNN
F 2 "wemos-d1-mini:wemos-d1-mini-with-pin-header-and-connector" H 5970 1840 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 4120 1840 50  0001 C CNN
	1    5970 2990
	1    0    0    -1  
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J1
U 1 1 5FD995EA
P 4400 2270
F 0 "J1" V 4210 2210 50  0000 C CNN
F 1 "PowerPlug" V 4280 2140 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 4600 2470 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 4600 2570 60  0001 L CNN
F 4 "WM4200-ND" H 4600 2670 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 4600 2770 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 4600 2870 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 4600 2970 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 4600 3070 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 4600 3170 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 4600 3270 60  0001 L CNN "Description"
F 11 "Molex" H 4600 3370 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4600 3470 60  0001 L CNN "Status"
	1    4400 2270
	0    1    1    0   
$EndComp
$Comp
L Hue_Ambience_clone-rescue:D-hc-und-co D1
U 1 1 5FD9ECD2
P 4650 2270
F 0 "D1" H 4650 2485 50  0000 C CNN
F 1 "1N4007" H 4650 2394 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P12.70mm_Horizontal" H 4650 2270 50  0001 C CNN
F 3 "" H 4650 2270 50  0000 C CNN
	1    4650 2270
	-1   0    0    1   
$EndComp
Text GLabel 5970 3790 3    50   Input ~ 0
GND
Text GLabel 4800 2270 2    50   Input ~ 0
GND
Text GLabel 4500 2370 2    50   Input ~ 0
5V
Text GLabel 5870 2190 1    50   Input ~ 0
5V
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232031 J2
U 1 1 5FDA2BCF
P 4400 2830
F 0 "J2" V 4200 2790 50  0000 C CNN
F 1 "WS2812B" V 4280 2790 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54mm_Drill1.02mm" H 4600 3030 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232031_sd.pdf" H 4600 3130 60  0001 L CNN
F 4 "WM4201-ND" H 4600 3230 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232031" H 4600 3330 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 4600 3430 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 4600 3530 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232031_sd.pdf" H 4600 3630 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232031/WM4201-ND/26669" H 4600 3730 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 4600 3830 60  0001 L CNN "Description"
F 11 "Molex" H 4600 3930 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4600 4030 60  0001 L CNN "Status"
	1    4400 2830
	0    1    1    0   
$EndComp
Text GLabel 4500 2930 2    50   Input ~ 0
GND
Text GLabel 4500 3030 2    50   Input ~ 0
5V
Text GLabel 4500 2830 2    50   Input ~ 0
LED-Data
Text GLabel 6370 2890 2    50   Input ~ 0
LED-Data
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232041 J3
U 1 1 5FDA5205
P 4410 3530
F 0 "J3" V 4185 3538 50  0000 C CNN
F 1 "Buttons" V 4276 3538 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x4_P2.54mm_Drill1.02mm" H 4610 3730 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 4610 3830 60  0001 L CNN
F 4 "WM4202-ND" H 4610 3930 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232041" H 4610 4030 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 4610 4130 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 4610 4230 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 4610 4330 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232041/WM4202-ND/26671" H 4610 4430 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 4POS 2.54MM" H 4610 4530 60  0001 L CNN "Description"
F 11 "Molex" H 4610 4630 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4610 4730 60  0001 L CNN "Status"
	1    4410 3530
	0    1    1    0   
$EndComp
Text GLabel 4510 3530 2    50   Input ~ 0
GND
Text GLabel 4510 3730 2    50   Input ~ 0
GND
Text GLabel 6370 3090 2    50   Input ~ 0
BTN-Power
Text GLabel 6370 3190 2    50   Input ~ 0
BTN-Color
NoConn ~ 6370 2490
NoConn ~ 6370 2590
NoConn ~ 6370 2690
NoConn ~ 6370 2790
NoConn ~ 6370 2990
NoConn ~ 6370 3290
NoConn ~ 6370 3390
NoConn ~ 5570 2890
NoConn ~ 5570 2990
NoConn ~ 5570 2590
Text GLabel 4880 3630 2    50   Input ~ 0
BTN-Power
Text GLabel 4880 3830 2    50   Input ~ 0
BTN-Color
$Comp
L Device:R R1
U 1 1 5FDAEDF6
P 4750 3980
F 0 "R1" H 4820 4026 50  0000 L CNN
F 1 "10K" H 4820 3935 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4680 3980 50  0001 C CNN
F 3 "~" H 4750 3980 50  0001 C CNN
	1    4750 3980
	1    0    0    -1  
$EndComp
Text GLabel 6070 2190 1    50   Input ~ 0
3V3
Text GLabel 4750 4130 3    50   Input ~ 0
3V3
Wire Wire Line
	4510 3630 4790 3630
Wire Wire Line
	4510 3830 4750 3830
Connection ~ 4750 3830
Wire Wire Line
	4750 3830 4880 3830
$Comp
L Device:R R2
U 1 1 5FDB577B
P 4790 3480
F 0 "R2" H 4860 3526 50  0000 L CNN
F 1 "10K" H 4860 3435 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4720 3480 50  0001 C CNN
F 3 "~" H 4790 3480 50  0001 C CNN
	1    4790 3480
	1    0    0    -1  
$EndComp
Connection ~ 4790 3630
Wire Wire Line
	4790 3630 4880 3630
Text GLabel 4790 3330 1    50   Input ~ 0
3V3
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J5
U 1 1 5FDCF548
P 4400 1750
F 0 "J5" V 4210 1690 50  0000 C CNN
F 1 "PowerOut" V 4280 1620 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 4600 1950 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 4600 2050 60  0001 L CNN
F 4 "WM4200-ND" H 4600 2150 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 4600 2250 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 4600 2350 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 4600 2450 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 4600 2550 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 4600 2650 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 4600 2750 60  0001 L CNN "Description"
F 11 "Molex" H 4600 2850 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4600 2950 60  0001 L CNN "Status"
	1    4400 1750
	0    1    1    0   
$EndComp
Text GLabel 4500 1850 2    50   Input ~ 0
5V
$Comp
L Hue_Ambience_clone-rescue:D-hc-und-co D2
U 1 1 5FDD080C
P 4650 1750
F 0 "D2" H 4650 1965 50  0000 C CNN
F 1 "1N4007" H 4650 1874 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P12.70mm_Horizontal" H 4650 1750 50  0001 C CNN
F 3 "" H 4650 1750 50  0000 C CNN
	1    4650 1750
	1    0    0    -1  
$EndComp
Text GLabel 4800 1750 2    50   Input ~ 0
GND
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232041 J4
U 1 1 5FDBE881
P 4880 6040
F 0 "J4" V 4655 6048 50  0000 C CNN
F 1 "Buttons" V 4746 6048 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x4_P2.54mm_Drill1.02mm" H 5080 6240 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 5080 6340 60  0001 L CNN
F 4 "WM4202-ND" H 5080 6440 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232041" H 5080 6540 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 5080 6640 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 5080 6740 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 5080 6840 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232041/WM4202-ND/26671" H 5080 6940 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 4POS 2.54MM" H 5080 7040 60  0001 L CNN "Description"
F 11 "Molex" H 5080 7140 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5080 7240 60  0001 L CNN "Status"
	1    4880 6040
	0    1    1    0   
$EndComp
$Comp
L dk_Tactile-Switches:B3F-1000 S2
U 1 1 5FDC3124
P 5570 6490
F 0 "S2" H 5570 6837 60  0000 C CNN
F 1 "B3F-1000 (Color)" H 5570 6731 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 5770 6690 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 5770 6790 60  0001 L CNN
F 4 "SW400-ND" H 5770 6890 60  0001 L CNN "Digi-Key_PN"
F 5 "B3F-1000" H 5770 6990 60  0001 L CNN "MPN"
F 6 "Switches" H 5770 7090 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 5770 7190 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 5770 7290 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3F-1000/SW400-ND/33150" H 5770 7390 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 5770 7490 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 5770 7590 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5770 7690 60  0001 L CNN "Status"
	1    5570 6490
	1    0    0    -1  
$EndComp
$Comp
L dk_Tactile-Switches:B3F-1000 S1
U 1 1 5FDC57BF
P 5560 5870
F 0 "S1" H 5560 6217 60  0000 C CNN
F 1 "B3F-1000 (Power)" H 5560 6111 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 5760 6070 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 5760 6170 60  0001 L CNN
F 4 "SW400-ND" H 5760 6270 60  0001 L CNN "Digi-Key_PN"
F 5 "B3F-1000" H 5760 6370 60  0001 L CNN "MPN"
F 6 "Switches" H 5760 6470 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 5760 6570 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf" H 5760 6670 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3F-1000/SW400-ND/33150" H 5760 6770 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 5760 6870 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 5760 6970 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5760 7070 60  0001 L CNN "Status"
	1    5560 5870
	1    0    0    -1  
$EndComp
Wire Wire Line
	5360 5770 5360 5970
Wire Wire Line
	5360 5970 4980 5970
Wire Wire Line
	4980 5970 4980 6040
Connection ~ 5360 5970
Wire Wire Line
	4980 6140 5040 6140
Wire Wire Line
	5040 6140 5040 6030
Wire Wire Line
	5040 6030 5760 6030
Wire Wire Line
	5760 6030 5760 5970
Wire Wire Line
	5760 5970 5760 5770
Connection ~ 5760 5970
Wire Wire Line
	5370 6590 5370 6390
Wire Wire Line
	5370 6390 5370 6340
Wire Wire Line
	5370 6340 4980 6340
Connection ~ 5370 6390
Wire Wire Line
	4980 6240 5770 6240
Wire Wire Line
	5770 6240 5770 6390
Connection ~ 5770 6390
Wire Wire Line
	5770 6390 5770 6590
Wire Notes Line
	4520 5200 4520 6890
Wire Notes Line
	4520 6890 6480 6890
Wire Notes Line
	6480 6890 6480 5200
Wire Notes Line
	6480 5200 4520 5200
Wire Notes Line
	3900 4500 7170 4500
Wire Notes Line
	7170 4500 7170 1350
Wire Notes Line
	7170 1350 3900 1350
Wire Notes Line
	3900 1350 3900 4500
$EndSCHEMATC
