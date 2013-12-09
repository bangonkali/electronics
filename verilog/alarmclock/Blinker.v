module Blinker(
	input wire clock,
	input wire enable,
	output reg bout
);
	parameter CLOCK_FREQ_1KHZ = 50000;
	
	integer clock_count;
	integer blink_count;
	
	always@(posedge clock) begin
		if (enable) begin
			clock_count <= clock_count + 1;
			if (clock_count > CLOCK_FREQ_1KHZ) begin
				clock_count <= 0;
				blink_count <= blink_count + 1;
				if (blink_count < 700) begin
					bout <= 1;
				end else if (blink_count >= 700 && blink_count < 1000) begin
					bout <= 0;
				end else begin
					blink_count <= 0;
				end
			end
		end else begin
			bout <= 1;
			clock_count <= 0;
			blink_count <= 0;
		end
	end

endmodule
