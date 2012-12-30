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
	
	// Signal indicating no one is at the door. Either they have finished getting in
   // or just got out. Separates different signals from each other. Then both G1 and 
	// G0 are 0.
	parameter NONE = 0;
	
	// Happens when Bart passes OR after a A binary 10 signal from G which indates Homer's
	// lower body is beginning to block the sensors passing through the door.
	parameter G0_SENSOR_LOWER = 1; 
	
	// Happens when G1 is equals 1 or G = 2 also indicates that the head / upper body of 
	// Homer is already passing through the door.
	parameter G1_SENSOR_ELEVATED = 2; 
	
	// Happens when both Homer's Upper and Lower Body are blocking the sensor. Which means, 
	// It is still homer who is passing through the door.
	parameter G3_SENSOR_BOTH = 3;	

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
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE; // Signal separator. Successfull pass of Bart.
		#2 $display ("Bart Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Bart
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE; // Signal separator. Successfull exit of Bart.
		#2 $display ("Bart Leaves: LEVEL = %d", LEVEL);	
		
		// Sulod si Homer		
		#4 G = G1_SENSOR_ELEVATED; // Homers upper body.
		#4 G = G0_SENSOR_LOWER; // Homers lower body.
		#4 G = NONE; // Homer successfully passed through.
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = G1_SENSOR_ELEVATED; // Homers upper body.
		#4 G = G0_SENSOR_LOWER; // Homers lower body.
		#4 G = NONE; // Homer successfully passed through.
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);	
		
		// Sulod si Homer but this time 
		#4 G = G1_SENSOR_ELEVATED; // Homers upper body.
		#4 G = G3_SENSOR_BOTH; // Both upper and lower body.
		#4 G = NONE; // Homer successfully passed through.
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);
			$display ("But this time, both G1 and G0 are emitting 1");	
			$display ("after an initial G0 of 1. Which basically means");	
			$display ("head first, then both his head and lower body is");
			$display ("being detected by the sensor as he's entering");	
		
		// Gawas si Homer 
		#4 G = G1_SENSOR_ELEVATED; // Homers upper body.
		#4 G = G3_SENSOR_BOTH; // Both upper and lower body.
		#4 G = NONE; // Homer successfully passed through.
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);
			$display ("But this time, both G1 and G0 are emitting 1");	
			$display ("after an initial G0 of 1. Which basically means");	
			$display ("head first, then both his head and lower body is");
			$display ("being detected by the sensor as he's exiting");	
		
		// Sulod si Bart
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Bart Enters: LEVEL = %d", LEVEL);	
		
		// Sulod si Homer		
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);
		
		// Sulod si Homer		
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Bart
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Bart Leaves: LEVEL = %d", LEVEL);	
		
		// Sulod si Bart
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Bart Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);
		
		// Gawas si Bart
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Bart Leaves: LEVEL = %d", LEVEL);	
		
		#2 $display ("This shows the reset capability.");	
		// Sulod si Homer		
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		#2 $display ("The device's reset is pressed.");
		#2 RESET = 1;
		#2 RESET = 0;
		#2 $display ("The device's reset is unpressed.");
		#2 $display ("Current LEVEL: LEVEL = %d", LEVEL);	
		
		// Sulod si Homer		
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Enters: LEVEL = %d", LEVEL);	
		
		// Gawas si Homer 
		#4 G = G1_SENSOR_ELEVATED;
		#4 G = G0_SENSOR_LOWER;
		#4 G = NONE;
		#2 $display ("Homer Leaves: LEVEL = %d", LEVEL);
		
		
		#2 $display ("End of simulation: LEVEL = %d", LEVEL);
		
		$finish;
	end
	
	// Clock Generator
	always begin
		#1 CLK = !CLK;
	end
	
endmodule

