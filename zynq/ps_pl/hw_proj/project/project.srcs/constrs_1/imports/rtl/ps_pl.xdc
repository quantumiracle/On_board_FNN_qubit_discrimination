#create_clock -period 10.000 -name CLK [get_ports CLK]
#set_property PACKAGE_PIN Y9 [get_ports CLK]
#PL_RST
set_property PACKAGE_PIN W20 [get_ports RST_N] 
#J23.1
set_property PACKAGE_PIN V7 [get_ports PMT]  
#J25.2
set_property PACKAGE_PIN W11 [get_ports BRIGHT] 
#J25.1
set_property PACKAGE_PIN W12 [get_ports GATE]  
#J25.4
set_property PACKAGE_PIN W8 [get_ports out1] 
#set_property PACKAGE_PIN T22 [get_ports LED]
#set_property PACKAGE_PIN R16 [get_ports SW]

#set_property IOSTANDARD LVCMOS33 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports RST_N]
set_property IOSTANDARD LVCMOS33 [get_ports PMT]
set_property IOSTANDARD LVCMOS33 [get_ports BRIGHT]
set_property IOSTANDARD LVCMOS33 [get_ports GATE]
set_property IOSTANDARD LVCMOS33 [get_ports out1]
#set_property IOSTANDARD LVCMOS33 [get_ports LED]
#set_property IOSTANDARD LVCMOS25 [get_ports SW]









