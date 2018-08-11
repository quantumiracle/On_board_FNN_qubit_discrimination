#create_clock -period 10.000 -name CLK [get_ports CLK]
#set_property PACKAGE_PIN Y9 [get_ports CLK]
set_property PACKAGE_PIN W20 [get_ports RST_N]
set_property PACKAGE_PIN T18 [get_ports GATE]
#set_property PACKAGE_PIN T22 [get_ports LED]
#set_property PACKAGE_PIN R16 [get_ports SW]

#set_property IOSTANDARD LVCMOS33 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports RST_N]
set_property IOSTANDARD LVCMOS25 [get_ports GATE]
#set_property IOSTANDARD LVCMOS33 [get_ports LED]
#set_property IOSTANDARD LVCMOS25 [get_ports SW]




