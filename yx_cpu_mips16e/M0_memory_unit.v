`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:44 03/03/2015 
// Design Name: 
// Module Name:    M0_memory_unit 
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
module M0_memory_unit(data_out, data_in,
       address, clk, write);

parameter word_size = 16;
parameter memory_size = 65536;

output [word_size-1:0] data_out;
input [word_size-1:0] data_in;
input [word_size-1:0] address;
input clk, write;

reg [word_size-1:0] memory[memory_size-1:0];

assign data_out = memory[address];

always @(posedge clk)
   if(write) memory[address] = data_in;

endmodule
