//-----------------------------------------------------
// Design Name : compliment_tb
// File Name   : compliment_tb.v
// Function    : D flip-flop async reset
// Coder       : Deepak Kumar Tala http://goo.gl/s6bxD
// Modified    : Bangon Kali bangonkali@istoryahi.me
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
