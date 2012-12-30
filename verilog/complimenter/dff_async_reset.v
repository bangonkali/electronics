//-----------------------------------------------------
// Design Name : dff_async_reset
// File Name   : dff_async_reset.v
// Function    : D flip-flop async reset
// Coder       : Deepak Kumar Tala http://goo.gl/s6bxD
// Modified    : Bangon Kali bangonkali@istoryahi.me
// Repository  : at github http://goo.gl/0TyRj
// Dependency  : None
//-----------------------------------------------------

module dff_async_reset (
	input wire data, // Data Input
	input wire clk, // Clock Input
	input wire reset, // Reset input 
	output reg q = 0 // Q output
);

	always @ ( posedge clk or negedge reset or posedge reset)
	if (reset) begin
	  q = 1'b0;
	end else begin
	  q = data;
	end

endmodule //End Of Module dff_async_reset
