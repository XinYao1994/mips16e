`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:53 04/15/2015 
// Design Name: 
// Module Name:    Uart 
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
module Uart(
    data_in,
	 data_out,
	 //op_type,
	 Int_T_show,
    clk, rst);

parameter uart_size = 8;
parameter baud_size = 3;
parameter time_size = 32;
parameter speed = 1;//24;

//parameter U_idle = 1, U_tran = 2, U_recv = 3, U_read = 4, U_write = 5;
//parameter state_size = 4;

input data_in;
input clk, rst;
output data_out;
output Int_T_show;

reg [uart_size-1:0] TxR;
reg [uart_size-1:0] RxR;
reg [uart_size-1:0] Uart_ctrl_R;
reg [uart_size-1:0] Uart_State_R;
//reg [state_size-1:0] state, next_state;

wire baud16x;//, baudclk;

wire [baud_size-1:0] baud_CS;
assign baud_CS = Uart_State_R[2:0];
wire [uart_size-1:0] data_self;//data_Rx, data_Tx;
//for other
wire busy, ready;
// for state reg
assign Int_T_show = data_in;

wire [time_size-1:0] count;
wire clk_n;
assign clk_n = count[speed];// clk;//
Timer timer(count, clk, rst);

Baud baud_maker(
       baud_CS, //baudclk, 
       baud16x,
       clk_n, rst);

Recve Rx(
    clk_n, baud16x,//clk,//
	 rst,//rst
	 data_in,//in bit
	 ready,//ready is ok
	 data_self//data_Rx//recv data
    );
/*
reg start_T;
assign start = start_T;
assign data_Tx = (start_T)?data_Rx:8'h00;*/

Trans Tx(
    baud16x,//for baud clk,//
	 rst,//form rst
	 data_out,//
	 ready,//start,//for 0 always
	 data_self,//data_Tx,//data
	 busy,//output
	 Int_T
    );

always @(posedge clk, negedge rst)
begin
   if(!rst)
	begin
	   TxR <= 8'h00;
	   RxR <= 8'h00;
	   Uart_ctrl_R <= 8'h00;
	   Uart_State_R <= 8'h00;
		//state <= U_idle;
	end
	else
	begin
	   //state <= next_state;
	end	
end
/*
always @(posedge clk)
begin
   case(state)
	   U_idle:
		begin
		   next_state = U_recv;
		end
		U_tran:
		begin
		   next_state = U_tran;
			if(Int_T) next_state = U_idle;
		end
		U_recv:
		begin
		   if(ready)
			begin
			   next_state = U_tran;
				start_T = 1'b1;
			end
			else next_state = U_recv;
		end
		U_read:
		begin
		end
		U_write:
		begin
		end
		default : next_state = U_idle;
	endcase
end
*/
endmodule
