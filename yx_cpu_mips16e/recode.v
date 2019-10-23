`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:24 03/03/2015 
// Design Name: 
// Module Name:    recode 
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
module recode(code, op_type
    );
	 
parameter word_size = 16;
//    MFIH   MTIH   11110
/*    AND    CMP    JALR   JR    JRRA   MFPC   NEG    NOT   OR   SLLV      
      SLT    SLTU   SRAV   SRLV  XOR    11101*/
//    SLL    SRA    SRL    00110
//    BTEQZ  BTNEZ  MTSP   01100

parameter op_ADDIU = 5'b01001, op_ADDIU3 = 5'b01000, op_ADDSP3 = 5'b00000,
          op_ADDSP = 5'b11000, op_ADDU = 5'b11100, op_AND = 5'b11101, 
          op_B = 5'b00010, op_BEQZ = 5'b00100, op_BNEZ = 5'b00101, 
          op_BTEQZ = 5'b01100, op_BTNEZ = 5'b01100, op_CMP = 5'b11101, 
          op_CMPI = 5'b01110, op_INT = 5'b11111, op_JALR = 5'b11101, 
          op_JR = 5'b11101, op_JRRA = 5'b11101, op_LI = 5'b01101, 
          op_LW = 5'b10011, op_LW_SP = 5'b10010, op_MFIH = 5'b11110, 
		  op_MFPC = 5'b11101, op_MOVE = 5'b01111, op_MTIH = 5'b11110,
	      op_MTSP = 5'b01100, op_NEG = 5'b11101, op_NOT = 5'b11101, 
		  op_NOP = 5'b00001, op_OR = 5'b11101, op_SLL = 5'b00110, 
		  op_SLLV = 5'b11101, op_SLT = 5'b11101, op_SLTI = 5'b01010, 
		  op_SLTU = 5'b11101, op_SLTUI = 5'b01011, op_SRA = 5'b00110,
		  op_SRAV = 5'b11101, op_SRL = 5'b00110, op_SRLV = 5'b11101,
		  op_SUBU = 5'b11100, op_SW = 5'b11011, op_SW_RS = 5'b01100,
		  op_SW_SP = 5'b11010, op_XOR = 5'b11101;

input [word_size-1:0] code;
output reg [5:0] op_type;




endmodule
