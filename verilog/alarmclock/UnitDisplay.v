module UnitDisplay(
	input wire clock,
	input wire[7:0] value,
	input wire enable,
	
	output reg[1:7] value_ones_leds,
	output reg[1:7] value_tens_leds
);

	wire[3:0] w_value_ones;
	wire[3:0] w_value_tens;
	wire[3:0] w_value_hund;

	wire[1:7] w_value_ones_leds;
	wire[1:7] w_value_tens_leds;

	binary_to_BCD binary_to_BCD (value, w_value_ones, w_value_tens, w_value_hund);
	seg7 seg7_ones (w_value_ones, w_value_ones_leds);
	seg7 seg7_tens (w_value_tens, w_value_tens_leds);
	
	always@(posedge clock) begin
		if (enable) begin
			value_ones_leds <= w_value_ones_leds;
			value_tens_leds <= w_value_tens_leds;
		end else begin 
			value_ones_leds <= 7'b1111111;
			value_tens_leds <= 7'b1111111;
		end
	end
endmodule
