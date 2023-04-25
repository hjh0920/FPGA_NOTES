`timescale 1ns / 1ns

module tb;

//  Parameters
parameter PERIOD_100M  = 10;
parameter REFCLK_F = 100;

//  Clock and reset
reg   clk_100M = 0;
reg   resetn   = 0;
//  Module signal

delay_top #(
    .REFCLK_F   (REFCLK_F)
)u_delay_top(
    .ref_clk(clk_100M),
    .resetn (resetn)
);
//---------------------------
//clock generate module
always #(PERIOD_100M/2) clk_100M = ~clk_100M;

//testbench of the RTL
initial begin
    task_sysinit;      //必须先进行系统初始化
    task_rstn_async;   //再进行复位
    #10000000;
    $stop;
end

//systerm initialization
task task_sysinit;
begin
    // din = 0;
end
endtask
// Asynchronous Reset
task task_rstn_async; 
begin
    resetn = 0;
    #(PERIOD_100M*10);
    repeat(2) @(negedge clk_100M)
    resetn = 1'b1;
end
endtask

endmodule
