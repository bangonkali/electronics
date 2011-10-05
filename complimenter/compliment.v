//-----------------------------------------------------
// Design Name : compliment
// File Name   : compliment.v
// Function    : Serial 2's Complementer 
// Problem     : http://j.mp/qHe6PE 
// Coder       : Bangon Kali
//-----------------------------------------------------

module compliment(
	input wire x, 
	input wire reset,
	input wire clk,
	output wire y
);
	
	or or_data(data, x, q);
	xor xor_y(y, q, x);
	
	dff_async_reset ff(data, clk, reset, q);
	
endmodule
