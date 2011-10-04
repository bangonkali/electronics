// Johannah Mae D. Abestano
// Multiplier Main Module

// a is the first number
// b is the second number
// clk is the clock
// r is the result
// done will be 1 if the operation is finished.
module mult_tb;
               
	reg start = 1;
	reg clk = 0;
	
	reg [7:0] a = 3;
	reg [7:0] b = 4;
	
	wire [15:0] r;
	wire done;
 
	mult uut(a, b, start, clk, r, done);
	
	always begin 
		if (done == 0) begin
			$display("output undone: %d",r);
		end
		
		if (done == 1) begin
			$display("output done: %d",r);
			$finish;
		end
		#1 clk = !clk;
		
		
	end
	
	initial begin
		$dumpfile("mult_tb.dump");
		$dumpvars;
	end
endmodule