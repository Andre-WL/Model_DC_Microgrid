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
L HouseController-rescue:L7805CV-dk_PMIC-Voltage-Regulators-Linear-HouseController-rescue U4
U 1 1 614D3DCD
P 3700 800
F 0 "U4" H 3650 1050 60  0000 L CNN
F 1 "L7805CV" H 3500 950 60  0000 L CNN
F 2 "L7805CV-DG:TO255P460X1020X2008-3P" H 3900 1000 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3900 1100 60  0001 L CNN
F 4 "497-1443-5-ND" H 3900 1200 60  0001 L CNN "Digi-Key_PN"
F 5 "L7805CV" H 3900 1300 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 3900 1400 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 3900 1500 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3900 1600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/L7805CV/497-1443-5-ND/585964" H 3900 1700 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 5V 1.5A TO220AB" H 3900 1800 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 3900 1900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3900 2000 60  0001 L CNN "Status"
	1    3700 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 614D50EC
P 4300 950
F 0 "C3" H 4200 850 50  0000 L CNN
F 1 "100pF" H 4050 1050 50  0000 L CNN
F 2 "C320C104J3G5TA:C320C104J3G5TA" H 4338 800 50  0001 C CNN
F 3 "~" H 4300 950 50  0001 C CNN
	1    4300 950 
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 614F5892
P 3700 1100
F 0 "#PWR09" H 3700 850 50  0001 C CNN
F 1 "GND" H 3705 927 50  0000 C CNN
F 2 "" H 3700 1100 50  0001 C CNN
F 3 "" H 3700 1100 50  0001 C CNN
	1    3700 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 615217F2
P 3400 950
F 0 "C6" H 3250 950 50  0000 C CNN
F 1 "10uF" H 3300 850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3438 800 50  0001 C CNN
F 3 "~" H 3400 950 50  0001 C CNN
	1    3400 950 
	1    0    0    -1  
$EndComp
Text GLabel 3400 800  0    50   Input ~ 0
24V
Text GLabel 900  750  0    50   Input ~ 0
24V
Wire Wire Line
	900  750  950  750 
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 6160173D
P 1150 750
F 0 "J1" H 1178 726 50  0000 L CNN
F 1 "Conn_01x02_Female" H 1178 635 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P8.8mm_D2.4mm_OD4.4mm" H 1150 750 50  0001 C CNN
F 3 "~" H 1150 750 50  0001 C CNN
	1    1150 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  850  900  850 
Wire Wire Line
	900  850  900  900 
$Comp
L power:GND #PWR0111
U 1 1 6160528B
P 900 900
F 0 "#PWR0111" H 900 650 50  0001 C CNN
F 1 "GND" H 905 727 50  0000 C CNN
F 2 "" H 900 900 50  0001 C CNN
F 3 "" H 900 900 50  0001 C CNN
	1    900  900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61E90E07
P 3400 1100
F 0 "#PWR0101" H 3400 850 50  0001 C CNN
F 1 "GND" H 3405 927 50  0000 C CNN
F 2 "" H 3400 1100 50  0001 C CNN
F 3 "" H 3400 1100 50  0001 C CNN
	1    3400 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61E92B93
P 4050 1100
F 0 "#PWR0102" H 4050 850 50  0001 C CNN
F 1 "GND" H 4055 927 50  0000 C CNN
F 2 "" H 4050 1100 50  0001 C CNN
F 3 "" H 4050 1100 50  0001 C CNN
	1    4050 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61E92DFE
P 4300 1100
F 0 "#PWR0103" H 4300 850 50  0001 C CNN
F 1 "GND" H 4305 927 50  0000 C CNN
F 2 "" H 4300 1100 50  0001 C CNN
F 3 "" H 4300 1100 50  0001 C CNN
	1    4300 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 614D46E2
P 2350 1200
F 0 "C2" H 2050 1250 50  0000 C CNN
F 1 "100pF" H 2100 1150 50  0000 C CNN
F 2 "C320C104J3G5TA:C320C104J3G5TA" H 2388 1050 50  0001 C CNN
F 3 "~" H 2350 1200 50  0001 C CNN
	1    2350 1200
	1    0    0    -1  
$EndComp
$Comp
L HouseController-rescue:D24V50F5-Controller U2
U 1 1 614D7221
P 2600 850
F 0 "U2" H 2778 901 50  0000 L CNN
F 1 "D24V50F5" H 2778 810 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" V 2450 850 50  0001 C CNN
F 3 "" V 2450 850 50  0001 C CNN
	1    2600 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 614D9EF2
P 2200 850
F 0 "#PWR04" H 2200 600 50  0001 C CNN
F 1 "GND" H 2050 800 50  0000 C CNN
F 2 "" H 2200 850 50  0001 C CNN
F 3 "" H 2200 850 50  0001 C CNN
	1    2200 850 
	1    0    0    -1  
$EndComp
Text GLabel 2350 750  0    50   Input ~ 0
24V
Wire Wire Line
	2200 850  2350 850 
Wire Wire Line
	2350 850  2350 950 
Connection ~ 2350 850 
$Comp
L power:GND #PWR0104
U 1 1 61E8A294
P 2350 1350
F 0 "#PWR0104" H 2350 1100 50  0001 C CNN
F 1 "GND" H 2500 1300 50  0000 C CNN
F 2 "" H 2350 1350 50  0001 C CNN
F 3 "" H 2350 1350 50  0001 C CNN
	1    2350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 614F067E
P 700 1650
F 0 "#PWR06" H 700 1400 50  0001 C CNN
F 1 "GND" H 800 1550 50  0000 C CNN
F 2 "" H 700 1650 50  0001 C CNN
F 3 "" H 700 1650 50  0001 C CNN
	1    700  1650
	1    0    0    -1  
$EndComp
Text GLabel 1200 1850 0    50   Input ~ 0
Switch_signal_1
Text GLabel 1200 1950 0    50   Input ~ 0
Current_detect_1
Wire Wire Line
	2250 1050 2350 1050
Connection ~ 2350 1050
$Comp
L MCP3221A6T-E_OTVAO:MCP3221A6T-E_OTVAO IC1
U 1 1 61EBA941
P 6550 2200
F 0 "IC1" H 7050 2465 50  0000 C CNN
F 1 "MCP3221A6T-E_OTVAO" H 7050 2374 50  0000 C CNN
F 2 "MCP3221A6T-E_OTVAO:SOT95P280X145-5N" H 7400 2300 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/mcp3221a6t-eotvao/microchip-technology" H 7400 2200 50  0001 L CNN
F 4 "Analog to Digital Converters - ADC Automotive, 12-bit SAR ADC, I2C, single channel" H 7400 2100 50  0001 L CNN "Description"
F 5 "1.45" H 7400 2000 50  0001 L CNN "Height"
F 6 "Microchip" H 7400 1900 50  0001 L CNN "Manufacturer_Name"
F 7 "MCP3221A6T-E/OTVAO" H 7400 1800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "579-MCP3221A6TEOTVAO" H 7400 1700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology/MCP3221A6T-E-OTVAO?qs=5aG0NVq1C4xIe7K3D%2FHE6g%3D%3D" H 7400 1600 50  0001 L CNN "Mouser Price/Stock"
F 10 "MCP3221A6T-E/OTVAO" H 7400 1500 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/mcp3221a6t-eotvao/microchip-technology" H 7400 1400 50  0001 L CNN "Arrow Price/Stock"
	1    6550 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 61E681EF
P 6200 2400
F 0 "#PWR0105" H 6200 2150 50  0001 C CNN
F 1 "GND" H 6205 2227 50  0000 C CNN
F 2 "" H 6200 2400 50  0001 C CNN
F 3 "" H 6200 2400 50  0001 C CNN
	1    6200 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Female J2
U 1 1 61E87BC8
P 1400 1750
F 0 "J2" H 1428 1776 50  0000 L CNN
F 1 "Conn_01x05_Female" H 1428 1685 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x05_P4.6mm_D0.9mm_OD2.1mm" H 1400 1750 50  0001 C CNN
F 3 "~" H 1400 1750 50  0001 C CNN
	1    1400 1750
	1    0    0    -1  
$EndComp
Text GLabel 7550 2200 2    50   Input ~ 0
I2CSDA
Text GLabel 7550 2300 2    50   Input ~ 0
I2CSCL
Text GLabel 2650 2150 0    50   Input ~ 0
I2CSDA
Text GLabel 2650 2250 0    50   Input ~ 0
I2CSCL
$Comp
L ADG608BNZ:ADG608BNZ IC2
U 1 1 61E9BDA6
P 6550 1050
F 0 "IC2" H 7050 1315 50  0000 C CNN
F 1 "ADG608BNZ" H 7050 1224 50  0000 C CNN
F 2 "ADG608BNZ:DIP794W56P254L2013H533Q16N" H 7400 1150 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-4/DSA-69217.pdf" H 7400 1050 50  0001 L CNN
F 4 "ADG608BNZ, Multiplexer Single 8:1, 3 V, 5 V, 16-Pin, PDIP, 1" H 7400 950 50  0001 L CNN "Description"
F 5 "5.33" H 7400 850 50  0001 L CNN "Height"
F 6 "Analog Devices" H 7400 750 50  0001 L CNN "Manufacturer_Name"
F 7 "ADG608BNZ" H 7400 650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "584-ADG608BNZ" H 7400 550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Analog-Devices/ADG608BNZ?qs=BpaRKvA4VqEMocC5Onmubw%3D%3D" H 7400 450 50  0001 L CNN "Mouser Price/Stock"
F 10 "ADG608BNZ" H 7400 350 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/adg608bnz/analog-devices" H 7400 250 50  0001 L CNN "Arrow Price/Stock"
	1    6550 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2300 6550 2300
Text GLabel 6550 1350 0    50   Input ~ 0
Current_detect_1
Text GLabel 6550 1450 0    50   Input ~ 0
Current_detect_2
Text GLabel 6550 1550 0    50   Input ~ 0
Current_detect_3
Text GLabel 6550 1650 0    50   Input ~ 0
Current_detect_4
Text GLabel 6550 1050 0    50   Input ~ 0
SB0
Text GLabel 7550 1050 2    50   Input ~ 0
SB1
$Comp
L power:GND #PWR0107
U 1 1 61EA3722
P 8350 1250
F 0 "#PWR0107" H 8350 1000 50  0001 C CNN
F 1 "GND" H 8500 1200 50  0000 C CNN
F 2 "" H 8350 1250 50  0001 C CNN
F 3 "" H 8350 1250 50  0001 C CNN
	1    8350 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1250 8350 1250
$Comp
L ADG608BNZ:ADG608BNZ IC3
U 1 1 61EA688C
P 3050 5050
F 0 "IC3" H 3550 5315 50  0000 C CNN
F 1 "ADG608BNZ" H 3550 5224 50  0000 C CNN
F 2 "ADG608BNZ:DIP794W56P254L2013H533Q16N" H 3900 5150 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-4/DSA-69217.pdf" H 3900 5050 50  0001 L CNN
F 4 "ADG608BNZ, Multiplexer Single 8:1, 3 V, 5 V, 16-Pin, PDIP, 1" H 3900 4950 50  0001 L CNN "Description"
F 5 "5.33" H 3900 4850 50  0001 L CNN "Height"
F 6 "Analog Devices" H 3900 4750 50  0001 L CNN "Manufacturer_Name"
F 7 "ADG608BNZ" H 3900 4650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "584-ADG608BNZ" H 3900 4550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Analog-Devices/ADG608BNZ?qs=BpaRKvA4VqEMocC5Onmubw%3D%3D" H 3900 4450 50  0001 L CNN "Mouser Price/Stock"
F 10 "ADG608BNZ" H 3900 4350 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/adg608bnz/analog-devices" H 3900 4250 50  0001 L CNN "Arrow Price/Stock"
	1    3050 5050
	1    0    0    -1  
$EndComp
$Comp
L ADG608BNZ:ADG608BNZ IC4
U 1 1 61EA7230
P 3050 6200
F 0 "IC4" H 3550 6465 50  0000 C CNN
F 1 "ADG608BNZ" H 3550 6374 50  0000 C CNN
F 2 "ADG608BNZ:DIP794W56P254L2013H533Q16N" H 3900 6300 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-4/DSA-69217.pdf" H 3900 6200 50  0001 L CNN
F 4 "ADG608BNZ, Multiplexer Single 8:1, 3 V, 5 V, 16-Pin, PDIP, 1" H 3900 6100 50  0001 L CNN "Description"
F 5 "5.33" H 3900 6000 50  0001 L CNN "Height"
F 6 "Analog Devices" H 3900 5900 50  0001 L CNN "Manufacturer_Name"
F 7 "ADG608BNZ" H 3900 5800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "584-ADG608BNZ" H 3900 5700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Analog-Devices/ADG608BNZ?qs=BpaRKvA4VqEMocC5Onmubw%3D%3D" H 3900 5600 50  0001 L CNN "Mouser Price/Stock"
F 10 "ADG608BNZ" H 3900 5500 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/adg608bnz/analog-devices" H 3900 5400 50  0001 L CNN "Arrow Price/Stock"
	1    3050 6200
	1    0    0    -1  
$EndComp
Text GLabel 5300 2350 2    50   Input ~ 0
UART_TX
Text GLabel 5300 2450 2    50   Input ~ 0
UART_RX
Text GLabel 3050 6900 0    50   Input ~ 0
UART_TX
Text GLabel 3050 5750 0    50   Input ~ 0
UART_RX
Text GLabel 3050 5350 0    50   Input ~ 0
H1_RX
Text GLabel 3050 5450 0    50   Input ~ 0
H2_RX
Text GLabel 3050 5550 0    50   Input ~ 0
H3_RX
Text GLabel 3050 5650 0    50   Input ~ 0
H4_RX
Text GLabel 3050 6500 0    50   Input ~ 0
H1_TX
Text GLabel 3050 6600 0    50   Input ~ 0
H2_TX
Text GLabel 3050 6700 0    50   Input ~ 0
H3_TX
Text GLabel 3050 6800 0    50   Input ~ 0
H4_TX
Text GLabel 3050 6200 0    50   Input ~ 0
SB0
Text GLabel 3050 5050 0    50   Input ~ 0
SB0
Text GLabel 4050 6200 2    50   Input ~ 0
SB1
Text GLabel 4050 5050 2    50   Input ~ 0
SB1
Text GLabel 2250 1050 0    50   Input ~ 0
5V(1)
Text GLabel 4450 800  2    50   Input ~ 0
5V(2)
Wire Wire Line
	4300 800  4450 800 
Connection ~ 4300 800 
Text GLabel 7550 1350 2    50   Input ~ 0
5V(2)
Text GLabel 6550 1150 0    50   Input ~ 0
5V(2)
Text GLabel 3050 5150 0    50   Input ~ 0
5V(2)
Text GLabel 4050 5350 2    50   Input ~ 0
5V(2)
Text GLabel 4050 6500 2    50   Input ~ 0
5V(2)
$Comp
L power:GND #PWR0108
U 1 1 61EAB114
P 2650 6400
F 0 "#PWR0108" H 2650 6150 50  0001 C CNN
F 1 "GND" H 2655 6227 50  0000 C CNN
F 2 "" H 2650 6400 50  0001 C CNN
F 3 "" H 2650 6400 50  0001 C CNN
	1    2650 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 6400 2650 6400
Text GLabel 3050 6300 0    50   Input ~ 0
5V(2)
$Comp
L power:GND #PWR0109
U 1 1 61EAC680
P 4450 6400
F 0 "#PWR0109" H 4450 6150 50  0001 C CNN
F 1 "GND" H 4455 6227 50  0000 C CNN
F 2 "" H 4450 6400 50  0001 C CNN
F 3 "" H 4450 6400 50  0001 C CNN
	1    4450 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6400 4450 6400
Wire Wire Line
	4450 6400 4450 5250
Wire Wire Line
	4450 5250 4050 5250
Connection ~ 4450 6400
Wire Wire Line
	2650 5250 2650 6400
Wire Wire Line
	2650 5250 3050 5250
Connection ~ 2650 6400
Text GLabel 1200 1750 0    50   Input ~ 0
H1_RX
Text GLabel 1200 1650 0    50   Input ~ 0
H1_TX
$Comp
L Connector:Conn_01x05_Female J3
U 1 1 61EB42DF
P 1400 2450
F 0 "J3" H 1428 2476 50  0000 L CNN
F 1 "Conn_01x05_Female" H 1428 2385 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x05_P4.6mm_D0.9mm_OD2.1mm" H 1400 2450 50  0001 C CNN
F 3 "~" H 1400 2450 50  0001 C CNN
	1    1400 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Female J4
U 1 1 61EB4C3B
P 1400 3150
F 0 "J4" H 1428 3176 50  0000 L CNN
F 1 "Conn_01x05_Female" H 1428 3085 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x05_P4.6mm_D0.9mm_OD2.1mm" H 1400 3150 50  0001 C CNN
F 3 "~" H 1400 3150 50  0001 C CNN
	1    1400 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Female J5
U 1 1 61EB542B
P 1400 3850
F 0 "J5" H 1428 3876 50  0000 L CNN
F 1 "Conn_01x05_Female" H 1428 3785 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x05_P4.6mm_D0.9mm_OD2.1mm" H 1400 3850 50  0001 C CNN
F 3 "~" H 1400 3850 50  0001 C CNN
	1    1400 3850
	1    0    0    -1  
$EndComp
Text GLabel 1200 2650 0    50   Input ~ 0
Current_detect_2
Text GLabel 1200 3350 0    50   Input ~ 0
Current_detect_3
Text GLabel 1200 4050 0    50   Input ~ 0
Current_detect_4
$Comp
L power:GND #PWR0110
U 1 1 61EB81E8
P 700 2350
F 0 "#PWR0110" H 700 2100 50  0001 C CNN
F 1 "GND" H 800 2250 50  0000 C CNN
F 2 "" H 700 2350 50  0001 C CNN
F 3 "" H 700 2350 50  0001 C CNN
	1    700  2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 61EB85F1
P 700 3050
F 0 "#PWR0112" H 700 2800 50  0001 C CNN
F 1 "GND" H 800 2950 50  0000 C CNN
F 2 "" H 700 3050 50  0001 C CNN
F 3 "" H 700 3050 50  0001 C CNN
	1    700  3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 61EBFFDB
P 700 3750
F 0 "#PWR0113" H 700 3500 50  0001 C CNN
F 1 "GND" H 800 3650 50  0000 C CNN
F 2 "" H 700 3750 50  0001 C CNN
F 3 "" H 700 3750 50  0001 C CNN
	1    700  3750
	1    0    0    -1  
$EndComp
Text GLabel 1200 3250 0    50   Input ~ 0
Switch_signal_3
Text GLabel 1200 3950 0    50   Input ~ 0
Switch_signal_4
Text GLabel 1200 2550 0    50   Input ~ 0
Switch_signal_2
Text GLabel 1200 2350 0    50   Input ~ 0
H2_TX
Text GLabel 1200 3050 0    50   Input ~ 0
H3_TX
Text GLabel 1200 3750 0    50   Input ~ 0
H4_TX
Text GLabel 1200 2450 0    50   Input ~ 0
H2_RX
Text GLabel 1200 3150 0    50   Input ~ 0
H3_RX
Text GLabel 1200 3850 0    50   Input ~ 0
H4_RX
Wire Wire Line
	6200 2400 6200 2300
Text GLabel 5300 2050 2    50   Input ~ 0
5V(1)
$Comp
L power:GND #PWR0118
U 1 1 61EF2E17
P 5800 1250
F 0 "#PWR0118" H 5800 1000 50  0001 C CNN
F 1 "GND" H 5650 1200 50  0000 C CNN
F 2 "" H 5800 1250 50  0001 C CNN
F 3 "" H 5800 1250 50  0001 C CNN
	1    5800 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 1250 6550 1250
Wire Wire Line
	6550 2400 6250 2400
Wire Wire Line
	6250 2400 6250 1750
Wire Wire Line
	6250 1750 6550 1750
Wire Wire Line
	4000 800  4050 800 
$Comp
L Device:C C5
U 1 1 61EF341C
P 4050 950
F 0 "C5" H 3950 1050 50  0000 C CNN
F 1 "10uF" H 3950 850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4088 800 50  0001 C CNN
F 3 "~" H 4050 950 50  0001 C CNN
	1    4050 950 
	1    0    0    -1  
$EndComp
Connection ~ 4050 800 
Wire Wire Line
	4050 800  4300 800 
Text GLabel 5300 2150 2    50   Input ~ 0
3V3
$Comp
L power:GND #PWR0106
U 1 1 61F533A6
P 5300 4250
F 0 "#PWR0106" H 5300 4000 50  0001 C CNN
F 1 "GND" H 5305 4077 50  0000 C CNN
F 2 "" H 5300 4250 50  0001 C CNN
F 3 "" H 5300 4250 50  0001 C CNN
	1    5300 4250
	1    0    0    -1  
$EndComp
NoConn ~ 5300 2850
NoConn ~ 5300 2950
NoConn ~ 5300 3050
NoConn ~ 5300 3150
NoConn ~ 5300 3250
NoConn ~ 5300 3350
NoConn ~ 5300 3450
NoConn ~ 5300 3550
NoConn ~ 5300 3650
NoConn ~ 3200 3450
NoConn ~ 3200 3650
NoConn ~ 3200 3750
Text GLabel 3200 2350 0    50   Input ~ 0
Switch_signal_1
Text GLabel 3200 2550 0    50   Input ~ 0
Switch_signal_2
Text GLabel 3200 2650 0    50   Input ~ 0
Switch_signal_3
Text GLabel 3200 2850 0    50   Input ~ 0
Switch_signal_4
Wire Wire Line
	700  3750 700  3650
Wire Wire Line
	700  3650 1200 3650
Wire Wire Line
	700  3050 700  2950
Wire Wire Line
	700  2950 1200 2950
Wire Wire Line
	700  2350 700  2250
Wire Wire Line
	700  2250 1200 2250
Wire Wire Line
	700  1650 700  1550
Wire Wire Line
	700  1550 1200 1550
Text GLabel 3200 2950 0    50   Input ~ 0
SB0
Text GLabel 3200 3050 0    50   Input ~ 0
SB1
NoConn ~ 4050 5450
NoConn ~ 4050 5550
NoConn ~ 4050 5650
NoConn ~ 4050 5750
NoConn ~ 4050 6600
NoConn ~ 4050 6700
NoConn ~ 4050 6800
NoConn ~ 4050 6900
NoConn ~ 7550 1750
NoConn ~ 7550 1650
NoConn ~ 7550 1550
NoConn ~ 7550 1450
$Comp
L power:GND #PWR0114
U 1 1 61FAB994
P 7800 1150
F 0 "#PWR0114" H 7800 900 50  0001 C CNN
F 1 "GND" H 7805 977 50  0000 C CNN
F 2 "" H 7800 1150 50  0001 C CNN
F 3 "" H 7800 1150 50  0001 C CNN
	1    7800 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 61FAC235
P 4100 5150
F 0 "#PWR0115" H 4100 4900 50  0001 C CNN
F 1 "GND" H 4105 4977 50  0000 C CNN
F 2 "" H 4100 5150 50  0001 C CNN
F 3 "" H 4100 5150 50  0001 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 61FACB22
P 4150 6300
F 0 "#PWR0116" H 4150 6050 50  0001 C CNN
F 1 "GND" H 4155 6127 50  0000 C CNN
F 2 "" H 4150 6300 50  0001 C CNN
F 3 "" H 4150 6300 50  0001 C CNN
	1    4150 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6300 4150 6300
Wire Wire Line
	4050 5150 4100 5150
Wire Wire Line
	7550 1150 7800 1150
NoConn ~ 5300 4150
$Comp
L RASPBERRY_PI_3_MODEL_B_:RASPBERRY_PI_3_MODEL_B+ U1
U 1 1 61F37252
P 4300 2950
F 0 "U1" H 4250 4117 50  0000 C CNN
F 1 "RASPBERRY_PI_3_MODEL_B+" H 4250 4026 50  0000 C CNN
F 2 "RPi:MODULE_RASPBERRY_PI_3_MODEL_B+" H 4300 2950 50  0001 L BNN
F 3 "" H 4300 2950 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 4300 2950 50  0001 L BNN "STANDARD"
F 5 "18mm" H 4300 2950 50  0001 L BNN "MAXIMUM_PACKAGE_HIEGHT"
F 6 "Raspberry Pi" H 4300 2950 50  0001 L BNN "MANUFACTURER"
F 7 "1.0" H 4300 2950 50  0001 L BNN "PARTREV"
	1    4300 2950
	1    0    0    -1  
$EndComp
NoConn ~ 3200 2750
NoConn ~ 3200 3150
NoConn ~ 3200 3350
NoConn ~ 3200 3550
NoConn ~ 3200 3950
NoConn ~ 3200 4050
Text GLabel 6550 2200 0    50   Input ~ 0
3V3
Wire Wire Line
	2650 2250 3200 2250
Wire Wire Line
	2650 2150 3200 2150
$EndSCHEMATC
