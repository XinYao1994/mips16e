`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:27 04/16/2015
// Design Name:   Uart
// Module Name:   H:/Working/jiekou/UART/Uart/uart_test.v
// Project Name:  Uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_test;

	// Inputs
	reg data_in;
	reg clk;
	reg rst;

	// Outputs
	wire data_out;
	wire Int_T_show;

	// Instantiate the Unit Under Test (UUT)
	Uart uut (
		.data_in(data_in), 
		.data_out(data_out), 
		.Int_T_show(Int_T_show), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
      rst = 1;
		// Add stimulus here

	end
      always #0.005 clk = ~clk;
		always #10 data_in = ~data_in;
      
endmodule

