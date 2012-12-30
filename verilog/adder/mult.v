// Johannah Mae D. Abestano
// Multiplier Main Module

// a is the first number
// b is the second number
// clk is the clock
// r is the result
// done will be 1 if the operation is finished.

module mult (a, b, start, clk, r, done);
	
input [7:0] a, b;
input start, clk;
output [15:0] r;
output done;

reg done = 0; // init to 0
reg startbuff = 1; // init to 0

reg [7:0] bbuf = 0; // init to 0

reg [15:0] r = 0; // init to 0

always @ (posedge clk) begin
	if (startbuff == 1 && start == 1) begin
		bbuf = b;
		startbuff = 0;
	end
	
	if (startbuff == 0 && done == 0) begin
		bbuf = bbuf - 1;
		
		r = r + a;
	end
	
	if (bbuf == 0) begin
		done = 1;
	end

end

endmodule