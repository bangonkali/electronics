module subtractor_4bit_tb;
               
	reg [3:0]a = 0;
	reg [3:0]b = 0;
	reg c_in = 0;
	
	wire [3:0]diff;
	wire c_out;
 
	subtractor_4bit uut(a,b,diff,c_out);
	
	initial begin
		$dumpfile("subtractor_4bit_tb.dump");
		$dumpvars;
	
		a=14; b=0; c_in=0;
		// $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",a,b,c_in,s,c_out);
		
		#10 a=11; b=3; c_in=0; 
		// $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",a,b,c_in,s,c_out);
			
		#10 a=5; b=5; c_in=0;
		// $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",a,b,c_in,s,c_out);
		
		#10 a=3; b=1; c_in=0;
		// $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",a,b,c_in,s,c_out);
			
		#10 a=2; b=1; c_in=0;
		// $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",a,b,c_in,s,c_out);
		
		#10 a=7; b=1; c_in=0;
		// $display("x=%b, y=%b, c_in=%b, s=%b, c_out=%b",a,b,c_in,s,c_out);
		
		$finish;
	end
endmodule