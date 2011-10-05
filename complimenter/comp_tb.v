module comp_tb;

	reg x = 0;
	reg reset = 0;
	reg clk = 0;
	
	wire y;
 
	comp uut(x, reset, clk, y);
	
	always #10 clk = !clk;
	
	initial begin
		$dumpfile("comp_tb.dump");
		$dumpvars;
		
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		
		#10 reset = 1;
		#10 reset = 0;
		
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		
		#10 $finish;
	end
endmodule
