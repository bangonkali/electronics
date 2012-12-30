/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * Verilog Source Code For a Simple 2 Way Traffic Light System
 *
 * @category    Verilog
 * @package     Traffic Light System
 * @author      Bangon Kali <bangonkali@istoryahi.me>
 * @reference   Verilog Basys (Example 62 - Traffic Lights)
 * @version     0.0.1
 * @compiler   iverilog
 * @depends    no-dependencies
 * @compile    iverilog traffic.v traffic_tb.v -o traffic_tb.vvp
 * @simulate   vvp traffic_tb.vvp -vcd
 * @wave       gtkwave traffic_tb.dump
 */
 
module traffic (
	input wire clk, // clock
	output reg R2 = 0, // coded output
	output reg Y2 = 0, // coded output
	output reg G2 = 0, // coded output
	output reg R1 = 0, // coded output
	output reg Y1 = 0, // coded output
	output reg G1 = 0  // coded output
);

	reg reset = 0;
	reg enable = 0;
	wire Q0;
	wire Q1;
	wire Q2;
	wire Q3;
	wire Q4;
	wire Q5;
	wire Q6;
	wire Q7;
	wire Q8;
	wire Q9;

	decade_counter decade( 
		clk,
		enable,
		reset,
		Q0, 
		Q1,
		Q2,
		Q3,
		Q4,
		Q5,
		Q6,
		Q7,
		Q8,
		Q9
	);
	
	reg QA = 0;
	reg QB = 0;

	always @ (posedge clk) begin
	
		QA = Q0 || Q1 || Q2 || Q3;
		QB = Q5 || Q6 || Q7 || Q8;
		
		R1 <= Q9 || QB || Q0;
		Y1 <= Q4;
		G1 <= QA && !Q0;
		
		R2 <= (Q4 || QA) || Q5; 	
		Y2 <= Q9;
		G2 <= QB && !Q5;
	end
endmodule
