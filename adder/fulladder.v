// Johannah Mae D. Abestano
// Full Adder Main Module

// when D = 1 to yield S = B - A
module full_adder(x,y,c_in,s,c_out);

	input x,y;
	input c_in;
	output s;
	output c_out;

	wire a0, a1;
	wire a2;

	xor xor1(a0,x,y);
	and and1(a1,x,y);
	xor xor2(s,a0,c_in);        
	and and2(a2,a0,c_in);
	or  or3(c_out,a2,a1);
	
endmodule