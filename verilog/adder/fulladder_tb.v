// Johannah Mae D. Abestano
// Full Adder Test Module

// when D = 1 to yield S = B - A
module fulladder_tb;

	reg x,y,c_in;
	wire s,c_out;
 
	full_adder uut(x,y,c_in,s,c_out);
	
	initial begin
		// iverilog specific
		$dumpfile("adder_tb.dump");
		$dumpvars;
		
		x=0; y=0; c_in=0;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=0; y=0; c_in=1;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=0; y=1; c_in=0;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=0; y=1; c_in=1;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=1; y=0; c_in=0;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=1; y=0; c_in=1;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=1; y=1; c_in=0;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);

		x=1; y=1; c_in=1;
		#10 $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",x,y,c_in,s,c_out);
	end
endmodule