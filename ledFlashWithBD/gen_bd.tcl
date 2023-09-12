set part        xc7vx485tffg1761-1
set_part        $part
set_param       general.maxthreads 20

set outputDir ./BDoutput
file mkdir $outputDir

create_project -in_memory -part $part
set_property source_mgmt_mode All [current_project]

read_verilog            [ glob ./src/hdl/*.v   ]
cd $outputDir
source ../design_1.tcl

generate_target all [ get_files ./.srcs/sources_1/bd/design_1/design_1.bd ]

cd ..