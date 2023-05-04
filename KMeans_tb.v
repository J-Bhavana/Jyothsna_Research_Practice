`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:40:24 03/12/2020
// Design Name:   Kmeans
// Module Name:   D:/xilinx_simulation/BLOG/K_means_tb.v
// Project Name:  BLOG
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Kmeans
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module K_means_tb;

	// Inputs
	reg clk;
	reg reset;
	reg start;
	
	wire [17:0] y;
	wire tr1;

	// Instantiate the Unit Under Test (UUT)
	Kmeans uut (
		.clk(clk), 
		.reset(reset), 
		.start(start),
		.y(y),
		.tr1(tr1)
	);
always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        start = 1;
		  reset = 0;
		  #10;
		  start = 0;
		// Add stimulus here

	end
      
endmodule

