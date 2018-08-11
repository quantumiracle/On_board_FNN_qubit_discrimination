connect -url tcp:127.0.0.1:3121
source C:/Users/wuyanwen/Desktop/ps_pl5/ps_pl/hw_proj/project/project.sdk/system_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854623"} -index 0
loadhw C:/Users/wuyanwen/Desktop/ps_pl5/ps_pl/hw_proj/project/project.sdk/system_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854623"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854623"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854623"} -index 0
dow C:/Users/wuyanwen/Desktop/ps_pl5/ps_pl/hw_proj/project/project.sdk/ps_pl/Debug/ps_pl.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS1 210249854623"} -index 0
con
