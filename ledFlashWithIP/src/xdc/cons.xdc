set_property -dict { PACKAGE_PIN D27  IOSTANDARD LVCMOS18 } [get_ports { sys_clk }];
set_property -dict { PACKAGE_PIN D13  IOSTANDARD LVCMOS18 } [get_ports { rst_n }];   # KEY 1
set_property -dict { PACKAGE_PIN AK20 IOSTANDARD LVCMOS18 } [get_ports { led }];

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]