`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:54 03/03/2015 
// Design Name: 
// Module Name:    Register_define 
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
// a useful register
module Register_define(data_out, data_in,
    load, clk, rst);
	 
parameter word_size = 16;
output [word_size-1: 0] data_out;
input [word_size-1: 0] data_in;
input load, clk, rst;

reg [word_size-1: 0]	data_out;

always @ (posedge clk or negedge rst)
   if (rst == 0) data_out <= 0; 
	else if (load) data_out <= data_in;

endmodule
