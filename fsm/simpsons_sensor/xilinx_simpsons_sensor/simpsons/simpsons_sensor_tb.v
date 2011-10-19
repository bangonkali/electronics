`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Kinalibangon Digital
// Engineer: Bangon Kali (bangonkali@istoryahi.me)
//
// Create Date: 21:18:52 10/19/2011
// Design Name: simpsons_sensor
// Module Name: simpsons_sensor_tb.v
// Project Name: simpsons
// Target Device:  
// Tool versions:  
// Description: For more information, visit http://goo.gl/Ig6l4
//
// Verilog Test Fixture created by ISE for module: simpsons_sensor
//
// Dependencies: simpsons_sensor.v
// 
// Revision: 0.1.4.3
// Revision 0.01 - File Created
// Additional Comments: =P
//
// Repository  : at github http://goo.gl/0TyRj
//
////////////////////////////////////////////////////////////////////////////////

module simpsons_sensor_tb;

	// Inputs
	reg [1:0] G;
	reg CLK;
	reg RESET;

	// Outputs
	wire [1:0] LEVEL;

	// Parameters
	parameter NONE = 0;
	parameter LOW = 1;
	parameter HIGH = 2;	

	// Instantiate the Unit Under Test (UUT)
	simpsons_sensor uut (
		.G(G), 
		.CLK(CLK), 
		.RESET(RESET), 
		.LEVEL(LEVEL)
	);

	initial begin
		// Initialize Inputs
		G = 0;
		CLK = 0;
		RESET = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Stimulus Begin
		// Sulod si Bart
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Bart Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Bart
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Bart Leaves: LEVEL = %d", LEVEL);	
		
		// Sulod si Homer		
		#4 G = HIGH;
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = HIGH;
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);	
		
		// Sulod si Bart
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Bart Enters: LEVEL = %d", LEVEL);	
		
		// Sulod si Homer		
		#4 G = HIGH;
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = HIGH;
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);
		
		// Sulod si Homer		
		#4 G = HIGH;
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Bart
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Bart Leaves: LEVEL = %d", LEVEL);	
		
		// Sulod si Bart
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Bart Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = HIGH;
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);
		
		// Gawas si Bart
		#4 G = LOW;
		#4 G = NONE;
		#2 $display ("Bart Leaves: LEVEL = %d", LEVEL);	
		
		$finish;
	end
	
	// Clock Generator
	always begin
		#1 CLK = !CLK;
	end
	
endmodule

