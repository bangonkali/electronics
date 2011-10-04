// Johannah Mae D. Abestano
// 4 Bit Adder/Subtractor Test Module

// when D = 1 to yield S = B - A
module addsub_4bit_tb;

	reg [3:0] a = 0;
	reg [3:0] b = 0;
	reg d = 0;
	
	wire [3:0]s;
	wire c_out;
	
	// http://en.wikipedia.org/wiki/Adder%E2%80%93subtractor
	// when D = 0 the modified adder performs addition
	// when D = 1 the modified adder performs subtraction 
	addsub_4bit uut(a, b, d, s, c_out);
	
	initial begin
		$dumpfile("addsub_4bit_tb.dump");
		$dumpvars;

		// s = a + b
		#10 a = 0; b = 15; d = 0;
		#10 a = 1; b = 14; d = 0;
		#10 a = 2; b = 13; d = 0;
		#10 a = 3; b = 12; d = 0;
		#10 a = 4; b = 11; d = 0;
		#10 a = 5; b = 10; d = 0;
		#10 a = 6; b = 9; d = 0;
		#10 a = 7; b = 8; d = 0;
		#10 a = 8; b = 7; d = 0;
		#10 a = 9; b = 6; d = 0;
		#10 a = 10; b = 5; d = 0;
		#10 a = 11; b = 4; d = 0;
		#10 a = 12; b = 3; d = 0;
		#10 a = 13; b = 2; d = 0;
		#10 a = 14; b = 1; d = 0;
		#10 a = 15; b = 0; d = 0;
		
		// s = b - a
		#10 a = 1; b = 7; d = 1;
		#10 a = 2; b = 6; d = 1;
		#10 a = 0; b = 5; d = 1;
		#10 a = 11; b = 15; d = 1;
		#10 a = 12; b = 15; d = 1;
		#10 a = 13; b = 15; d = 1;
		#10 a = 14; b = 15; d = 1;
		#10 a = 15; b = 15; d = 1;
	end
endmodule