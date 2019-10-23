`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:30 04/15/2015 
// Design Name: 
// Module Name:    Trans 
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
// http://www.cnblogs.com/BitArt/archive/2012/12/05/2803880.html
//
//////////////////////////////////////////////////////////////////////////////////
// count to 16 send D0 , 32 D1
// for 16 32 48 64 80 96 112 128 144
//
module Trans(
    Baud16x,
	 rst,
	 data_bit,
	 start,//for 1 always
	 data_tra,
	 busy,
	 Int_T
    );

parameter uart_size = 8;

input Baud16x, rst;
input start;
input [uart_size-1:0] data_tra;
output reg data_bit;
output reg busy, Int_T;

/*    capture the rising edge of TransEn    */
reg TransEn;
wire TxD_start;
always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        TransEn <= 1'b0;
    else
        TransEn <= start;
end
assign TxD_start = ~TransEn & start;
/*
*    when the rising edge of DataEn comes up, load the Data to buffer
*/
reg [7:0] DataReg;
always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        DataReg <= 8'b0;
    else if(TxD_start) DataReg <= data_tra;
end
//----------------------------------------------    
/*     counter control      */
reg cnt_en;
always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        begin
            cnt_en <= 1'b0;
            busy <= 1'b0;
				Int_T <= 1'b0;
        end
    else if(TxD_start == 1'b1)
        begin
            cnt_en <= 1'b1;
				Int_T <= 1'b0;
            busy <= 1'b1;
        end
    else if(cnt == 8'd160)
        begin
            cnt_en <= 1'b0;
            busy <= 1'b0;
				Int_T <= 1'b1;
        end
end
//---------------------------------------------
/*      counter module        */
reg [7:0] cnt; 
always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        cnt <= 8'd0;
    else if(cnt_en)
        cnt <= cnt+1'b1;
    else
        cnt <= 8'd0;
end

//---------------------------------------------
/*      transmit module        */

always@(posedge Baud16x or negedge rst)
begin
    if(!rst)
        begin
            data_bit <= 1'b1;
        end
    else if(cnt_en)
        case(cnt)
            8'd0   :  data_bit <= 1'b0;
            8'd16  :  data_bit <= DataReg[0];
            8'd32  :  data_bit <= DataReg[1];
            8'd48  :  data_bit <= DataReg[2];
            8'd64  :  data_bit <= DataReg[3];
            8'd80  :  data_bit <= DataReg[4];
            8'd96  :  data_bit <= DataReg[5];
            8'd112 :  data_bit <= DataReg[6];
            8'd128 :  data_bit <= DataReg[7];
            8'd144 :  data_bit <= 1'b1;
        endcase
    else
        data_bit <= 1'b1;
end

endmodule
