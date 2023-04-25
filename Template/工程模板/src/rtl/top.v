`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 11:44:25
// Design Name: 
// Module Name: delay_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top #(
    // Reference clock frequence, unit:MHz
    parameter REFCLK_F = 50
)(
    input              ref_clk,
    input              resetn,
    output [DOUT_W-1:0] dout
);

//===========================================================================
// signal declarations
//===========================================================================

always @(posedge ref_clk) begin

end

endmodule
