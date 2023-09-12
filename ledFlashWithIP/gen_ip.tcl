set part        xc7vx485tffg1761-1
set_part        $part
set_param       general.maxthreads 20

set IPoutputDir ./src/ip/gen
file mkdir $IPoutputDir
set clock_ip_name clk_wiz_0

# create_ip -vlnv xilinx.com:ip:clk_wiz:6.0 -module_name $clock_ip_name -dir $IPoutputDir
# create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name $clock_ip_name -dir $IPoutputDir
create_ip -quiet -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name $clock_ip_name -dir $IPoutputDir

# set_property CONFIG.COMPONENT_NAME              $clock_ip_name      [get_ips $clock_ip_name]
set_property CONFIG.PRIM_IN_FREQ                {33.333}            [get_ips $clock_ip_name]
set_property CONFIG.CLK_OUT1_PORT               {clk_50}            [get_ips $clock_ip_name]
set_property CONFIG.CLKOUT1_REQUESTED_OUT_FREQ  {50.000}            [get_ips $clock_ip_name]
set_property CONFIG.RESET_TYPE                  {ACTIVE_LOW}        [get_ips $clock_ip_name]

read_ip     -quiet    [ glob $IPoutputDir/$clock_ip_name/$clock_ip_name.xci      ]
synth_ip              [ get_files $IPoutputDir/$clock_ip_name/$clock_ip_name.xci ]


