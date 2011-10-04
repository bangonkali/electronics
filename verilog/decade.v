module decade_counter ( 
	input wire clk,
	input wire enable,
	input wire reset,
	output reg Q0 = 0, 
	output reg Q1 = 0,
	output reg Q2 = 0,
	output reg Q3 = 0,
	output reg Q4 = 0,
	output reg Q5 = 0,
	output reg Q6 = 0,
	output reg Q7 = 0,
	output reg Q8 = 0,
	output reg Q9 = 0
);

	reg [3:0] counter = 0;

	always @(posedge clk && !(enable)) begin
		
		if (reset) begin
			Q0 = 0;
			Q1 = 0;
			Q2 = 0;
			Q3 = 0;
			Q4 = 0;
			Q5 = 0;
			Q6 = 0;
			Q7 = 0;
			Q8 = 0;
			Q9 = 0;
			counter = 0;
		end
		
		if (counter == 10) begin
			counter = 0;
		end 
		
		if (counter == 1) begin
			Q0 = 0;
			Q1 = 1;
		end
		
		if (counter == 2) begin
			Q1 = 0;
			Q2 = 1;
		end
		
		if (counter == 3) begin
			Q2 = 0;
			Q3 = 1;
		end
		
		if (counter == 4) begin
			Q3 = 0;
			Q4 = 1;
		end
		
		if (counter == 5) begin
			Q4 = 0;
			Q5 = 1;
		end
		
		if (counter == 6) begin
			Q5 = 0;
			Q6 = 1;
		end
		
		if (counter == 7) begin
			Q6 = 0;
			Q7 = 1;
		end
		
		if (counter == 8) begin
			Q7 = 0;
			Q8 = 1;
		end
		
		if (counter == 9) begin
			Q8 = 0;
			Q9 = 1;
		end
		
		if (counter == 0) begin
			Q9 = 0;
			Q0 = 1;
		end
		
		counter = counter + 1;
	end
endmodule
