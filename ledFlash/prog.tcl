set outputDir ./output

open_hw_manager
connect_hw_server
open_hw_target
set_property PROGRAM.FILE {./output/top.bit} [lindex [get_hw_devices]]
program_hw_devices [lindex [get_hw_devices]]
close_hw_manager