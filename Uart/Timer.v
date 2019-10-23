`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:53 03/12/2015 
// Design Name: 
// Module Name:    Timer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Timer(count, clk_clock, rst
    );
parameter time_size = 32;
output reg [time_size-1:0] count;
input clk_clock, rst;
/*
initial begin
   count = 32'd0;
end
*/

always @(posedge clk_clock or negedge rst)
begin
    if(rst == 0) count = 32'd0;
    else count = count + 1;
end

endmodule
