`timescale 1ns / 1ps
module CLASSIFIER_kernel_tb();
  reg RESET;	// Reset acive low
  reg CLK;	
  reg CLK3x;	
  
  // These 4 signals are an artifact of the previous implementation I was unable to remove. 
  // They *do not* adversely affect functionality --Daniel
  reg [9:0] pos_x; 
  reg [8:0] pos_y;
  reg [3:0] IN_SCALE;
  reg enable;
  
  // Signals to setup the integral image --Daniel
  reg [16:0] integral_input;
  reg [4:0] address_i;
  reg [4:0] address_j;
  reg read_write;
  
  // Synchronization Signals
  reg in_valid;
  reg out_ready;

  wire Shift;	// Shift pixel
  wire Detected;	// Detect face (Active high)
  wire Failed; // Failed a stage (Active high)
  
  wire out_valid;
  wire in_ready;

  CLASSIFIER_kernel C0(.RESET(RESET), .CLK(CLK), .CLK3x(CLK3x), .pos_x(pos_x), .pos_y(pos_y), .IN_SCALE(IN_SCALE), 
    .enable(enable), .integral_input(integral_input), .address_i(address_i), .address_j(address_j), .read_write(read_write), 
    .in_valid (in_valid), .out_ready(out_ready), .Shift(Shift), .Detected(Detected), .Failed(Failed),
    .out_valid(out_valid), .in_ready(in_ready));
    
  initial begin
    RESET = 0;
    CLK = 0;
    CLK3x = 0;
    
    pos_x = 0;
    pos_y = 0;
    IN_SCALE = 0;
    enable = 0;
    
    address_i = 0;
    address_j = 0;
    read_write = 1;
    in_valid = 1;
    out_ready = 0;
  end
  
  // Clock generation
  always 
    #15 CLK = ~CLK;
    
  always
    #5 CLK3x = ~CLK3x;
    
  // A loop that reads the integral data and stores it in the integral image register.
  // To change the test inputs, change the integral_xyz.txt file --Daniel
  integer read;
  initial begin
    read = $fopen("integral_data2.txt", "r");
      for (address_i=0; address_i <= 19; address_i=address_i+1) begin
        for (address_j=0; address_j <= 19; address_j=address_j+1) begin
          $fscanf(read, "%d,", integral_input);
          #30;
        end
      end
    end
    
  initial begin
    //#100 in_valid = 1;
    // The first 12000 are the integral image being initialized.
    #12000 read_write = 0; in_valid = 0; out_ready = 1; 
    #30 RESET = 1; // Start the algorithm
    // Necessary since the original expected a X and Y coordinate. They are arbitrary. --Daniel
    #30 pos_x = 314; pos_y = 112; //out_ready = 1;
    //#70000 out_ready = 1;
    //#30 out_ready = 0;
	 #80000 $finish;
  end
endmodule