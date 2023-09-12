# Vivado-NonProject-Mode-Example

## 概述

本项目中提供了在Vivado中使用Non-project模式的三种组织工程样例，分别为纯Verilog代码、Verilog代码 + IP、Verilog代码+block design三种。

Non-project一切都可以通过Tcl命令完成，通过逐步执行每个步骤，如综合、布局、布线等，可以根据需求设定编译参数，因此使用本样例时需要先了解Tcl命令的工作模式和命令编写方式。

## Usage

    Please change xdc file and part in every tcl file.
    请在使用tcl脚本前改变xdc约束文件和相关的板卡型号。

### Verilog
    cd ledFlash
    mkdir log
    D:\Xilinx\Vivado\2020.2\bin\vivado.bat -mode tcl -log .\log\vivado.log -journal .\log\vivado.jou
    source run.tcl
    source prog.tcl

### Verilog + IP
    cd ledFlashWithIP
    mkdir log
    D:\Xilinx\Vivado\2020.2\bin\vivado.bat -mode tcl -log .\log\vivado.log -journal .\log\vivado.jou
    source gen_ip.tcl
    source run.tcl
    source prog.tcl

### Verilog + BD
First, you need to open Vivado and create your block design. Then

    # In Vivado, Use default name design_1
    write_bd_tcl -force ./design_1.tcl
    copy design_1_wrapper.v to ./ledFlashWithBD/hdl
    # Here
    cd ledFlashWithBD
    mkdir log
    D:\Xilinx\Vivado\2020.2\bin\vivado.bat -mode tcl -log .\log\vivado.log -journal .\log\vivado.jou
    source gen_bd.tcl
    source run.tcl
    source prog.tcl

## Todo
· 测试 HLS IP