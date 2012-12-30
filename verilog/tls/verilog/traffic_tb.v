/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * Verilog Source Code For a Simple 2 Way Traffic Light System
 *
 * @category    Verilog
 * @package     Traffic Light System
 * @author      Bangon Kali <bangonkali@istoryahi.me>
 * @reference   Verilog Basys (Example 62 - Traffic Lights)
 * @version     0.0.1
 * @some notes
 *   State : Nort-south : East-west : Delay
 *   0	   : G          : R         : 15   
 *   1	   : Y          : R         : 3    
 *   2	   : R          : R         : 3    
 *   3	   : R          : G         : 15   
 *   4	   : R          : Y         : 3    
 *   5	   : R          : R         : 3    
 *   
 *   Ligts Index : Color : Group              
 *   0		   : R     : 1 (Nort-south)    
 *   1		   : Y     : 1 (Nort-south)    
 *   2		   : G     : 1 (Nort-south)    
 *   3		   : R     : 2 (East-west)     
 *   4		   : Y     : 2 (East-west)     
 *   5		   : G     : 2 (East-west)
 *
 * @compiler   iverilog
 * @depends    traffic.v 
 * @compile    iverilog traffic.v traffic_tb.v -o traffic_tb.vvp
 * @simulate   vvp traffic_tb.vvp -vcd
 * @wave       gtkwave traffic_tb.dump
 */
 
module traffic_tb ();

	reg clk = 0;
	
	wire R2; // coded output
	wire Y2; // coded output
	wire G2; // coded output
	wire R1; // coded output
	wire Y1; // coded output
	wire G1; // coded output
	
	traffic uut (
		.clk(clk) ,
		.R2(R2), // coded output
		.Y2(Y2), // coded output
		.G2(G2), // coded output
		.R1(R1), // coded output
		.Y1(Y1), // coded output
		.G1(G1)  // coded output
	);
	
	initial begin
		// iverilog specific
		$dumpfile("traffic_tb.dump");
		$dumpvars;
		
		#1000 $finish;
	end
	
	always begin 
		#10 clk = !clk;
	end
endmodule
