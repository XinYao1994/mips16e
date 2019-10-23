`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:56 04/15/2015 
// Design Name: 
// Module Name:    Baud 
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
module Baud(
       baud_switch, //baud_rate, 
       OverTake,
       clk, rst);
		 
parameter baud_size = 3;

parameter ClkFrequency = 25000000;//(100000000>>11)100000000; // 100MHz
parameter Baudrate = 115200;

input clk, rst;
input [baud_size-1:0] baud_switch;
output OverTake;//, baud_rate;

// Baud generator (we use 8 times oversampling)
parameter Baud16 = Baudrate * 16;//8
parameter Baud16GeneratorAccWidth = 16;
wire [Baud16GeneratorAccWidth:0] Baud16GeneratorInc = ((Baud16<<(Baud16GeneratorAccWidth-8))+(ClkFrequency>>9))/(ClkFrequency>>8);
reg [Baud16GeneratorAccWidth:0] Baud16GeneratorAcc;

always @(posedge clk or negedge rst) 
begin
   if(!rst)
	begin
	   Baud16GeneratorAcc <= 17'b0;
	end
	else
	begin
	   Baud16GeneratorAcc <= Baud16GeneratorAcc[Baud16GeneratorAccWidth-1:0] + Baud16GeneratorInc;
	end
end

wire OverTake = Baud16GeneratorAcc[Baud16GeneratorAccWidth];

/*
  //parameter count_size = 32;
parameter BaudAccWide = 16;
parameter ClkFrequency = 100000000;  //100MHz*1024*1024
parameter OverTake_size = 4;
//parameter OverTake_times = 8;//3 for 8, 4for 16;

input [baud_size-1:0] baud_switch;  //set the Acc
input clk, rst;
output baud_rate;  //seted by baud_mark
output OverTake;

reg [BaudAccWide:0] count;  //reg [count_size-1:0] baud_mark; maybe integer

assign baud_rate = count[BaudAccWide]; //(count == baud_mark);
assign OverTake = count[BaudAccWide - OverTake_size];

integer BaudInc;

always @(posedge clk or negedge rst)//add by timer & reset by rst 
begin
   if(rst == 0)
   begin
      count <= 0;
      case(baud_switch)
         3'b000://9600
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b001:
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b010:
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b011:
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b100:
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b101:
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b110://115200
         begin
            BaudInc = ((115200 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         3'b111:
         begin
            BaudInc = ((9600 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
         default://115200
         begin
            BaudInc = ((115200 << (BaudAccWide-4)) + (ClkFrequency >> 5))/(ClkFrequency >> 4);
         end
      endcase
   end
   else //clk
   begin
      count <= count[BaudAccWide-1:0] + BaudInc;
   end
end
*/
endmodule

