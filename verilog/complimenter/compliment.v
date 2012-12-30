//-----------------------------------------------------
// Design Name : compliment_tb
// File Name   : compliment_tb.v
// Function    : 2's Complimenter
// Coder       : Bangon Kali bangonkali@istoryahi.me
// Repository  : at github http://goo.gl/0TyRj
// Dependency  : dff_async_reset.v
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
