`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:53 04/15/2015 
// Design Name: 
// Module Name:    Recve 
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
// http://www.cnblogs.com/BitArt/archive/2012/12/05/2802763.html
//
//////////////////////////////////////////////////////////////////////////////////
//24 40 56 72 88 104 120 136 for 8 bit
//8 152 begin ~ stop
module Recve(
    clk, Baud16x,
	 rst,
	 data_bit,
	 ready,
	 data_rec
    );

parameter uart_size = 8;

input clk, Baud16x, rst; 
input data_bit;
output reg ready;	
output reg [uart_size-1:0] data_rec;
//catch the rx down
reg r0;
wire r0_neg;
always @(posedge clk or negedge rst)
begin
   if(!rst)
	begin
	   r0 <= 1'b0;
	end
	else
	begin
	   r0 <= data_bit;
	end
end

assign r0_neg = r0 & ~data_bit;
//----------------------------------------------    
/*     counter control      */
reg cnt_en;
always@(posedge clk or negedge rst)
begin
    if(!rst)
        cnt_en<=1'b0;
    else if(r0_neg==1'b1)    // begin to rec
        cnt_en<=1'b1;
    else if(cnt==8'd152)
        cnt_en<=1'b0;
end
//---------------------------------------------
/*      counter module ，对采样时钟进行计数       */
reg [7:0] cnt;
always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        cnt<=8'd0;
    else if(cnt_en)
        cnt<=cnt+1'b1;
    else
        cnt<=8'd0;
end
//---------------------------------------------
/*      receive module        */
reg StopBit_r;
always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        begin
            data_rec <= 8'b0;
        end
    else if(cnt_en)
        case(cnt)/*在各个采样时刻，读取接收到的数据*/
            8'd24:   data_rec[0] <= data_bit;    
            8'd40:   data_rec[1] <= data_bit;
            8'd56:   data_rec[2] <= data_bit;
            8'd72:   data_rec[3] <= data_bit;
            8'd88:   data_rec[4] <= data_bit;
            8'd104:  data_rec[5] <= data_bit;
            8'd120:  data_rec[6] <= data_bit;
            8'd136:  data_rec[7] <= data_bit;
        endcase
end

always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        ready <= 1'b0;
    else if (cnt==8'd152)
        ready <= 1'b1;    //接收到停止位后，给出数据准备好标志位
    else 
        ready <= 1'b0;
end

endmodule
