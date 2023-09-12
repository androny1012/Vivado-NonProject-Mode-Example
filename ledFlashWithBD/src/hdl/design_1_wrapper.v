`timescale 1 ps / 1 ps

module design_1_wrapper
   (led,
    rst_n,
    sys_clk);
  output led;
  input rst_n;
  input sys_clk;

  wire led;
  wire rst_n;
  wire sys_clk;

  design_1 design_1_i
       (.led(led),
        .rst_n(rst_n),
        .sys_clk(sys_clk));
endmodule
