// Johannah Mae D. Abestano
// Full Adder Main Module

// when D = 1 to yield S = B - A
module comp(
	input x, 
	input reset,
	input clk,
	output y
);
	wire data;
	wire q;
	wire y;
	
	or or_data(data, x, q);
	xor xor_y(y, q, x);
	
	dff_async_reset ff(data, clk, reset, q);
	
endmodule
