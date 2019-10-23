`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:34 03/03/2015 
// Design Name: 
// Module Name:    M2_alu_mips 
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
module alu_mips(alu_zero_flag, alu_out, 
    data_x, data_y, op_type);
parameter word_size = 16;
parameter op_size = 6;//for 44 op_code
/*
parameter op_ADDIU = 1, op_ADDIU3 = 2, op_ADDSP3 = 3,
          op_ADDSP = 4, op_ADDU = 5, op_AND = 6, 
          op_B = 7, op_BEQZ = 8, op_BNEZ = 9, 
          op_BTEQZ = 10, op_BTNEZ = 11, op_CMP = 12, 
          op_CMPI = 13, op_INT = 14, op_JALR = 15, 
          op_JR = 16, op_JRRA = 17, op_LI = 18, 
          op_LW = 19, op_LW_SP = 20, op_MFIH = 21, 
			 op_MFPC = 22, op_MOVE = 23, op_MTIH = 24, 
			 op_MTSP = 25, op_NEG = 26, op_NOT = 27, 
			 op_NOP = 28, op_OR = 29, op_SLL = 30, 
			 op_SLLV = 31, op_SLT = 32, op_SLTI = 33, 
			 op_SLTU = 34, op_SLTUI = 35, op_SRA = 36, 
			 op_SRAV = 37, op_SRL = 38, op_SRLV = 39, 
			 op_SUBU = 40, op_SW = 41, op_SW_RS = 42, 
			 op_SW_SP = 43, op_XOR = 44;// error
*/
// recode can simple it
output alu_zero_flag;
output reg [word_size-1:0] alu_out;
input [word_size-1:0] data_x;
input [word_size-1:0] data_y;
input [op_size-1:0] op_type;

assign alu_zero_flag = ~|alu_out;

always @(op_type or data_x or data_y)
begin
   case(op_type)
	
	default: alu_out = 0;
	
	endcase
end

endmodule
