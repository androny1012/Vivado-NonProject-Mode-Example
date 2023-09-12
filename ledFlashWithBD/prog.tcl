

# top name
set top       design_1_wrapper
set outputDir ./output/
set bitfile   $outputDir$top.bit


open_hw_manager
connect_hw_server
open_hw_target
set_property PROGRAM.FILE $bitfile [lindex [get_hw_devices]]
program_hw_devices [lindex [get_hw_devices]]
close_hw_manager