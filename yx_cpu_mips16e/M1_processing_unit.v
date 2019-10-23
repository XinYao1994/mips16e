`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:21 03/03/2015 
// Design Name: 
// Module Name:    M3_processing_unit 
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
module M1_processing_unit(
    Load_alu_Z, Load_Reg_alu_Y,
    Load_Reg_X, Load_Reg_Y, Load_Reg_Z, 
    Load_Reg_SP, Load_Reg_T, Load_Reg_IH,
	Z_flag, bus_1,
	data, Load_data_r,
    address, Load_add_r,
    instruction, Load_ir, 
	Load_pc, Inc_pc, 
	clk, rst);

parameter word_size = 16;
parameter op_size = 6;
//parameter for multchoose_size 

output [word_size-1:0] address, instruction, data;
output Z_flag;
output [word_size-1:0] bus1;

//mem_word 
//multchoose_Bus
input clk, rst;
input Load_add_r, Load_data_r, Load_ir;
input Load_Reg_X, Load_Reg_Y, Load_Reg_Z;
input Load_Reg_SP, Load_Reg_T, Load_Reg_IH;
input Load_Reg_alu_Y, Load_alu_Z;
input Load_pc, Inc_pc;

wire Load_Reg_X, Load_Reg_Y, Load_Reg_Z;//usual
wire Load_Reg_SP, Load_Reg_T, Load_Reg_IH;//usual
wire [word_size-1:0] bus_2;
wire [word_size-1:0] pc_count;
wire [word_size-1:0] X_value, Y_value, Z_value;
wire [word_size-1:0] SP_value, T_value, IH_value;
wire [word_size-1:0] alu_Y_value;
wire alu_zero_flag;
wire [word_size-1:0] alu_out;

//care for instruction & recode to make it
wire [op_code-1:0] op_type;

// usual register (6 for usual, SP T IH x y z)
Register_define Reg_SP(SP_value, Bus_2, Load_Reg_SP, clk, rst);//SP
Register_define Reg_T(T_value, Bus_2, Load_Reg_T, clk, rst);//T
Register_define Reg_IH(IH_value, Bus_2, Load_Reg_IH, clk, rst);//IH
Register_define Reg_X(X_value, Bus_2, Load_Reg_X, clk, rst);//x
Register_define Reg_Y(Y_value, Bus_2, Load_Reg_Y, clk, rst);//y
Register_define Reg_Z(Z_value, Bus_2, Load_Reg_Z, clk, rst);//z

// register for alu(2 for alu , the Y & Zero)
Register_define Reg_alu_Y(alu_Y_value, Bus_2, Load_Reg_alu_Y, clk, rst);//
//*** error Register_define Reg_alu_Z(Z_flag, alu_zero_flag, Load_alu_Z, clk, rst);//alu's value

// special register(3 for special, ADDRESS_Reg DATA_Reg IR)
Register_define Add_R(address, bus_2, Load_add_r, clk, rst);//add_r
Register_define Data_R(data, bus_2, Load_data_r, clk, rst);//data
Register_define IR(instruction, bus_2, Load_ir, clk, rst);//IR

//PC_counter
program_counter PC(pc_count, bus_2, Load_pc, Inc_pc, clk, rst);//PC

//multchoose
// one for usual reg
// one for alu_ans

alu_mips (alu_zero_flag, alu_out, alu_Y_value, bus_1, op_type);

endmodule
