// Johannah Mae D. Abestano
// 4 Bit Adder/Subtractor Main Module

// when D = 1 to yield S = B - A
module addsub_4bit(a,b,d,s,c_out);
	input [3:0]a;
	input [3:0]b;

	// selector d=1 (adder)
	// if d=2 (subtractor)
	input d; 
	
	output [3:0]s;
	output c_out;
	
	wire [3:0]x;
	wire [2:0]c;

	xor xor0(x[0], a[0], d);
	xor xor1(x[1], a[1], d);
	xor xor2(x[2], a[2], d);
	xor xor3(x[3], a[3], d);

	full_adder adder_a(x[0], b[0], d, s[0], c[0]);
	full_adder adder_b(x[1], b[1], c[0], s[1], c[1]);
	full_adder adder_c(x[2], b[2], c[1], s[2], c[2]);
	full_adder adder_d(x[3], b[3], c[2], s[3], c_out);
	
endmodule