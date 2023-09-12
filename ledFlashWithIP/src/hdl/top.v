module top
(
    input wire sys_clk,
    input wire rst_n,
    output reg led
);

    parameter SEC_TIME = 32'd50_000_000;
    reg	[31:0]cnt;
    
    always @ (posedge sys_clk)begin
        if(!rst_n)
            cnt <= 0;
        else if(cnt < SEC_TIME)
            cnt <= cnt + 1'b1;
        else
            cnt <= 0;
    end
    
    always @ (posedge sys_clk)begin
        if(!rst_n)
            led <= 1'b0;
        else if(cnt < (SEC_TIME >> 1))
            led <= 1'b1;
        else
            led <= 1'b0;
    end


endmodule
