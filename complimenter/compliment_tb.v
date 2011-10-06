//-----------------------------------------------------
// Design Name : compliment_tb
// File Name   : compliment_tb.v
// Function    : 2's Complimenter Test bench code.
// Coder       : Bangon Kali bangonkali@istoryahi.me
// Repository  : at github http://goo.gl/0TyRj
// Dependency  : compliment.v
//-----------------------------------------------------

module compliment_tb;

	reg x = 0;
	reg reset = 1;
	reg clk = 0;
	
	wire y;
 
	compliment uut(x, reset, clk, y);
	
	always #10 clk = !clk;
	
	initial begin
		$dumpfile("compliment_tb.dump");
		$dumpvars;
		
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		
		#20 reset = 0;
		#20 reset = 1;
		
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		
		#20 $finish;
	end
endmodule
