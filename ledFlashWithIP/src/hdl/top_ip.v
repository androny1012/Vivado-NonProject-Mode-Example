module top_ip
(
    input wire sys_clk,
    input wire rst_n,
    output wire led
);
    wire clk_50;
    wire locked;
    clk_wiz_0 u_clk_50
    (
        // Clock out ports
        .clk_50(clk_50),     // output clk_100
        // Status and control signals
        .resetn(rst_n), // input resetn
        .locked(locked),       // output locked
       // Clock in ports
        .clk_in1(sys_clk)
    );      // input clk_in1
    
    top u_top
    (
        .sys_clk(clk_50),
        .rst_n(locked),
        .led(led)
    );

endmodule
