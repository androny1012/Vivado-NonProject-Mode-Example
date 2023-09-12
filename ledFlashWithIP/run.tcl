set part        xc7vx485tffg1761-1
set_part        $part
set_param general.maxthreads 20
set top         top_ip

set outputDir ./output
file mkdir $outputDir

read_verilog            [ glob ./src/hdl/*.v   ]
read_ip       -quiet    [ glob ./src/ip/gen/*/*.xci  ]
read_xdc                [ glob ./src/xdc/*.xdc ]

synth_design -top $top -part $part -flatten rebuilt
write_checkpoint -force $outputDir/post_synth
report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
report_power -file $outputDir/post_synth_power.rpt

opt_design
place_design
phys_opt_design
write_checkpoint -force $outputDir/post_place
report_timing_summary -file $outputDir/post_place_timing_summary.rpt

route_design
write_checkpoint -force $outputDir/post_route
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
write_verilog -force $outputDir/top_impl_netlist.v
write_xdc -no_fixed_only -force $outputDir/top_impl.xdc

write_bitstream -force $outputDir/$top.bit

