// Johannah Mae D. Abestano
// 4 Bit Adder Main Module

module adder_4bit(a,b,c_in,sm,s,c_out);
	input [3:0]a;
	input [3:0]b;

	input sm;
	input c_in;

	output [3:0]s;
	output c_out;

	wire c0;
	wire c1;
	wire c2;
	
	full_adder adder_0(a[0],b[0],c_in,s[0],c0);
	full_adder adder_1(a[1],b[1],c0,s[1],c1);
	full_adder adder_2(a[2],b[2],c1,s[2],c2);
	full_adder adder_3(a[3],b[3],c2,s[3],c_out);

endmodule