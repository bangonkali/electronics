//-----------------------------------------------------
// Design Name : dff_async_reset
// File Name   : dff_async_reset.v
// Function    : D flip-flop async reset
// Coder       : Deepak Kumar Tala http://goo.gl/s6bxD
// Modified    : Bangon Kali bangonkali@istoryahi.me
//-----------------------------------------------------
module dff_async_reset (
	input data,    // Data Input
	input clk,     // Clock Input
	input reset,   // Reset input 
	output q       // Q output
);
	
	wire q;

	always @ ( posedge clk or negedge reset)
	if (~reset) begin
	  q <= 1'b0;
	end else begin
	  q <= data;
	end

endmodule //End Of Module dff_async_reset
