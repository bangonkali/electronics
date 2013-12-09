`timescale 1ns / 1ps
module CLASSIFIER_kernel(RESET, CLK, CLK3x, pos_x, pos_y, IN_SCALE, enable, integral_input, 
  address_i, address_j, read_write, in_valid, out_ready, Shift, Detected, Failed, out_valid, in_ready);

input RESET;	// Reset acive low
input CLK;	
input CLK3x;	

// These 4 signals are an artifact of the previous implementation that I was unable to remove. 
// They *do not* adversely affect functionality --Daniel
input [9:0] pos_x;
input [8:0] pos_y;
input [3:0] IN_SCALE;
input enable;

// Signals to setup the integral image --Daniel
input [16:0] integral_input;
input [4:0] address_i;
input [4:0] address_j;
input read_write; // 0 - read, 1 - write
input in_valid; // synchronization input
input out_ready; // synchronization input

output Shift;	// Shift pixel
output reg Detected;	// Detect face (Active high)
output reg Failed;  // Failed a stage (Active high)
output reg out_valid; // synchronization output
output reg in_ready; // synchronization output

// Haar-like features
parameter image_width = 320;
parameter image_height = 240;
parameter window_size = 20;
parameter max_scale = 13;

reg fail_stage;
reg failed_stage;
reg [16:0] integral [0:19][0:19]; // register to store the integral image --Daniel

// Store the integral image so it can be read later. This needed to be done since the original 
// implementation had the integral image in another module --Daniel
always @ (posedge CLK) begin
  if (read_write == 1 && in_valid == 1)
    integral[address_i][address_j] = integral_input;
end

// Number of Features of each Stage (0-21)
wire [7:0] num_feat_stage [0:21];	// Stage 22, Feature 2135
assign num_feat_stage[0] = 2;	//3;	//2;	 	//3 features (0,1,2)
assign num_feat_stage[1] = 16;	//15; 	//16 features (3,4,...,18)
assign num_feat_stage[2] = 21;	//20; 	//21 features
assign num_feat_stage[3] = 39;	//38; 	//39 features
assign num_feat_stage[4] = 33;	//32; 	//33 features
assign num_feat_stage[5] = 44;	//43; 	//44 features
assign num_feat_stage[6] = 50;	//49; 	//50 features
assign num_feat_stage[7] = 51;	//50; 	//51 features
assign num_feat_stage[8] = 56;	//55; 	//56 features
assign num_feat_stage[9] = 71;	//70; 	//71 features
assign num_feat_stage[10] = 80;	//79; 	//80 features
assign num_feat_stage[11] = 103;	//102;	//103 features
assign num_feat_stage[12] = 111;	//110;	//111 features
assign num_feat_stage[13] = 102;	//101;	//102 features
assign num_feat_stage[14] = 135;	//134;	//135 features
assign num_feat_stage[15] = 137;	//136;	//137 features
assign num_feat_stage[16] = 140;	//139;	//140 features
assign num_feat_stage[17] = 160;	//159;	//160 features
assign num_feat_stage[18] = 177;	//176;	//177 features
assign num_feat_stage[19] = 182;	//181;	//182 features
assign num_feat_stage[20] = 211;	//210;	//211 features
assign num_feat_stage[21] = 213;	//212;	//213 features

// ----------  Feature Data Module  --------
wire [22:0] feat_rect0, feat_rect1, feat_rect2;	// [22:20] f_weight (-1 to 3), [19:15] f_height (0 to 20), [14:10] f_width (0 to 20), [9:5] f_y (0 to 20), [4:0] f_x (0 to 20)
wire signed [16:0] feat_threshold;	// Threshold of feature (Max. 55896.02 = 0.545867 * 20 * 20 *2^8)
wire [11:0] feat_left;	// Left value of feature (Max. 3739.619 = 0.912993 * 2^12)
wire [11:0] feat_right;	// Right value of feature (Max. 3723.18 = 0.908979 * 2^12)
wire [18:0] stage_threshold;	// Threshold of stage (Max. 433197.5 = 1692.178 * 2^12)
wire feat_wea = 1'b0;	// only read
wire stage_wea = 1'b0;	// only read

reg [4:0] current_stage;	// Max. 21
reg [11:0] current_feature;	// Max. 2134
reg [4:0] class_current_stage;

// For standard cell comment these in and comment out the BRAM lines - instantiates the ROM modules
//FEAT_INFO_RECT0_ROM F0 (.addr(current_feature), .clk(CLK), .din(), .dout(feat_rect0), .we(feat_wea));
//FEAT_INFO_RECT1_ROM F1 (.addr(current_feature), .clk(CLK), .din(), .dout(feat_rect1), .we(feat_wea));
//FEAT_INFO_RECT2_ROM F2 (.addr(current_feature), .clk(CLK), .din(), .dout(feat_rect2), .we(feat_wea));
//FEAT_THRESHOLD_ROM T0 (.addr(current_feature), .clk(CLK), .din(), .dout(feat_threshold), .we(feat_wea));
//FEAT_LEFT_ROM L0 (.addr(current_feature), .clk(CLK), .din(), .dout(feat_left), .we(feat_wea));
//FEAT_RIGHT_ROM R0 (.addr(current_feature), .clk(CLK), .din(), .dout(feat_right), .we(feat_wea));
//STAGE_THRESHOLD_ROM T1 (.addr(class_current_stage), .clk(CLK), .din(), .dout(stage_threshold), .we(stage_wea));

// For FPGA comment these in and comment out the ROM lines - instantiates the BRAMs
FEAT_INFO_RECT0 bram_feat_rect0 (.clka(CLK), .dina(), .addra(current_feature), .wea(feat_wea), 
                .douta(feat_rect0));
FEAT_INFO_RECT1 bram_feat_rect1 (.clka(CLK), .dina(), .addra(current_feature), .wea(feat_wea), 
                .douta(feat_rect1));
FEAT_INFO_RECT2 bram_feat_rect2 (.clka(CLK), .dina(), .addra(current_feature), .wea(feat_wea), 
                .douta(feat_rect2));
FEAT_THRESHOLD bram_feat_threshold (.clka(CLK), .dina(), .addra(current_feature), .wea(feat_wea), 
                .douta(feat_threshold));
FEAT_LEFT bram_feat_left (.clka(CLK), .dina(), .addra(current_feature), .wea(feat_wea), .douta(feat_left));
FEAT_RIGHT bram_feat_right (.clka(CLK), .dina(), .addra(current_feature), .wea(feat_wea), .douta(feat_right));
STAGE_THRESHOLD bram_stage_threshold (.clka(CLK), .dina(), .addra(class_current_stage), 
                .wea(stage_wea), .douta(stage_threshold));
  
parameter num_class = 3;	// number of parallel classifiers
parameter last_stage = 21;	// last stage number

wire [3:0] scale = IN_SCALE;

reg [7:0] stage_feature;	// number of current stage (Max. 213)
reg [11:0] limit_feature;	// accumulative number of features upto current stage (Max. 2134)

// Verify
wire [7:0] w_size [0:13];	// Scaled window size

assign w_size[0] = 20;
assign w_size[1] = 24;
assign w_size[2] = 29;
assign w_size[3] = 35;
assign w_size[4] = 41;
assign w_size[5] = 50;
assign w_size[6] = 60;
assign w_size[7] = 72;
assign w_size[8] = 86;
assign w_size[9] = 103;
assign w_size[10] = 124;
assign w_size[11] = 149;
assign w_size[12] = 178;
assign w_size[13] = 214;

reg [17:0] fail_cnt;	//249,854
reg [4:0] max_stage;	// Max. 21
reg [9:0] max_stage_x;
reg [8:0] max_stage_y;
reg [3:0] max_stage_scale;

always @(posedge CLK or negedge RESET)
  if (!RESET)
    begin
    current_stage <= 0;
    current_feature <= 0;
    stage_feature <= 0;
    limit_feature <= num_feat_stage[0];
    fail_cnt <= 0;
    max_stage <= 0;
    max_stage_x <= 0;
    max_stage_y <= 0;
    max_stage_scale <= 0;
    end
  else
    begin
    if ((((window_size-1) < pos_x) && (pos_x < image_width)) && (((window_size-1) < pos_y) && (pos_y < image_height)))
      begin
      if (scale < (max_scale+1))	//Last scale 13
        begin
        if (enable == 1'b1)
          begin
          current_stage <= 0;
          current_feature <= 0;
          stage_feature <= 0;
          limit_feature <= num_feat_stage[0];
          fail_cnt <= fail_cnt + 1;
          end
        else
          begin								
          if (current_feature == limit_feature)
            begin
            if (current_stage == last_stage)
              begin
              current_stage <= 0;
              current_feature <= 0;
              stage_feature <= 0;
              limit_feature <= num_feat_stage[0];
              end
            else
              begin
              current_stage <= current_stage + 1;
              current_feature <= current_feature + 1;
              stage_feature <= 0;
              limit_feature <= limit_feature + num_feat_stage[current_stage+1];
              end
            
            if (current_stage > max_stage)
              begin
              max_stage <= current_stage;
              max_stage_x <= pos_x;
              max_stage_y <= pos_y;
              max_stage_scale <= scale;
              end
            else
              begin
              max_stage <= max_stage;
              max_stage_x <= max_stage_x;
              max_stage_y <= max_stage_y;
              max_stage_scale <= max_stage_scale;
              end
            end
          else
            begin
            current_stage <= current_stage;
            current_feature <= current_feature + 1;
            stage_feature <= stage_feature + 1;
            limit_feature <= limit_feature;
            fail_cnt <= fail_cnt;
            end
          end		
        end
      else
        begin
        current_stage <= 0;
        current_feature <= 0;
        stage_feature <= 0;
        limit_feature <= num_feat_stage[0];
        fail_cnt <= 0;
        max_stage <= 0;
        max_stage_x <= 0;
        max_stage_y <= 0;
        max_stage_scale <= 0;
        end
      end
    else
      begin
      current_stage <= 0;
      current_feature <= 0;
      limit_feature <= num_feat_stage[0];
      end
    end

// Stage0-21, Feature0-212, Rectangle0-2
// Test Points
wire [4:0] tp_f_x_r0 = feat_rect0[4:0];
wire [4:0] tp_f_x_r1 = feat_rect1[4:0];
wire [4:0] tp_f_x_r2 = feat_rect2[4:0];
wire [4:0] tp_f_y_r0 = feat_rect0[9:5];
wire [4:0] tp_f_y_r1 = feat_rect1[9:5];
wire [4:0] tp_f_y_r2 = feat_rect2[9:5];
wire [4:0] tp_f_width_r0 = feat_rect0[14:10];
wire [4:0] tp_f_width_r1 = feat_rect1[14:10];
wire [4:0] tp_f_width_r2 = feat_rect2[14:10];
wire [4:0] tp_f_height_r0 = feat_rect0[19:15];
wire [4:0] tp_f_height_r1 = feat_rect1[19:15];
wire [4:0] tp_f_height_r2 = feat_rect2[19:15];
wire signed [2:0] tp_f_weight_r0 = $signed(feat_rect0[22:20]);
wire signed [2:0] tp_f_weight_r1 = $signed(feat_rect1[22:20]);
wire signed [2:0] tp_f_weight_r2 = $signed(feat_rect2[22:20]);
wire signed [16:0] tp_f_threshold = $signed(feat_threshold);
wire [11:0] tp_f_left = feat_left;
wire [11:0] tp_f_right = feat_right;
    
// Classifier
// Reading 4 points of rectangle
reg [1:0] state;	//0-2
reg [4:0] int0_x, int0_y;
reg [4:0] int1_x, int1_y;

always @(posedge CLK3x or negedge RESET)
  if (!RESET)
    begin
    state <= 0;
    int0_x <= 0;
    int0_y <= 0;
    int1_x <= 0;
    int1_y <= 0;
    end
  else
    begin
      if (((window_size < pos_x) && (pos_x < (image_width+1))) && (((window_size-1) < pos_y) && (pos_y < image_height)))
        begin
        case (state)
          2'b00 : begin
          int0_y <= feat_rect0[9:5];
          int0_x <= feat_rect0[4:0];
          int1_y <= feat_rect0[9:5] + feat_rect0[19:15];
          int1_x <= feat_rect0[4:0] + feat_rect0[14:10];					
          state <= 2'b01;
          end
          2'b01 : begin
          int0_y <= feat_rect1[9:5];
          int0_x <= feat_rect1[4:0];
          int1_y <= feat_rect1[9:5] + feat_rect1[19:15];
          int1_x <= feat_rect1[4:0] + feat_rect1[14:10];					
          state <= 2'b10;	
          end
          2'b10 : begin
          int0_y <= feat_rect2[9:5];
          int0_x <= feat_rect2[4:0];
          int1_y <= feat_rect2[9:5] + feat_rect2[19:15];
          int1_x <= feat_rect2[4:0] + feat_rect2[14:10];				
          state <= 2'b00;
          end
        endcase
        end
      else
        begin
        state <= 0;
        int0_x <= 0;
        int0_y <= 0;
        int1_x <= 0;
        int1_y <= 0;
        end
    end

// Reading integral image value of 4 points of rectangles
reg [16:0] class_r0_a;
reg [16:0] class_r0_b;
reg [16:0] class_r0_c;
reg [16:0] class_r0_d;
reg [16:0] class_r1_a;
reg [16:0] class_r1_b;
reg [16:0] class_r1_c;
reg [16:0] class_r1_d;
reg [16:0] class_r2_a;
reg [16:0] class_r2_b;
reg [16:0] class_r2_c;
reg [16:0] class_r2_d;

always @(posedge CLK3x or negedge RESET)
  if (!RESET)
    begin
    class_r0_a <= 0;
    class_r0_b <= 0;
    class_r0_c <= 0;
    class_r0_d <= 0;
    class_r1_a <= 0;
    class_r1_b <= 0;
    class_r1_c <= 0;
    class_r1_d <= 0;
    class_r2_a <= 0;
    class_r2_b <= 0;
    class_r2_c <= 0;
    class_r2_d <= 0;
    end
  else
    begin  
      case (state)
        3'b01 : begin			
        class_r0_a <= (int0_x == 0) || (int0_y == 0) ? 0 : integral[int0_y-1][int0_x-1];
        class_r0_b <= (int1_x == 0) || (int0_y == 0) ? 0 : integral[int0_y-1][int1_x-1];
        class_r0_c <= (int0_x == 0) || (int1_y == 0) ? 0 : integral[int1_y-1][int0_x-1];
        class_r0_d <= (int1_x == 0) || (int1_y == 0) ? 0 : integral[int1_y-1][int1_x-1];
        end
        
        3'b10 : begin
        class_r1_a <= (int0_x == 0) || (int0_y == 0) ? 0 : integral[int0_y-1][int0_x-1];
        class_r1_b <= (int1_x == 0) || (int0_y == 0) ? 0 : integral[int0_y-1][int1_x-1];
        class_r1_c <= (int0_x == 0) || (int1_y == 0) ? 0 : integral[int1_y-1][int0_x-1];
        class_r1_d <= (int1_x == 0) || (int1_y == 0) ? 0 : integral[int1_y-1][int1_x-1];
        end
        
        3'b00 : begin
        class_r2_a <= (int0_x == 0) || (int0_y == 0) ? 0 : integral[int0_y-1][int0_x-1];
        class_r2_b <= (int1_x == 0) || (int0_y == 0) ? 0 : integral[int0_y-1][int1_x-1];
        class_r2_c <= (int0_x == 0) || (int1_y == 0) ? 0 : integral[int1_y-1][int0_x-1];
        class_r2_d <= (int1_x == 0) || (int1_y == 0) ? 0 : integral[int1_y-1][int1_x-1];
        end
      endcase						
    end
    
// Classifier0
reg [16:0] class_r0;
reg [16:0] class_r1;
reg [16:0] class_r2;
reg signed [25:0] class_v;
reg [11:0] class_r;

reg signed [2:0] f_weight_r0;
reg signed [2:0] f_weight_r1;
reg signed [2:0] f_weight_r2;

reg signed [2:0] class_f_weight_r0;
reg signed [2:0] class_f_weight_r1;
reg signed [2:0] class_f_weight_r2;

reg signed [16:0] f_threshold;
reg [11:0] f_left;
reg [11:0] f_right;

reg signed [16:0] buf_f_threshold;
reg [11:0] buf_f_left;
reg [11:0] buf_f_right;

reg signed [16:0] class_f_threshold;
reg [11:0] class_f_left;
reg [11:0] class_f_right;

always @(negedge CLK or negedge RESET)
  if (!RESET)
    begin
    class_r0 <= 0;
    class_r1 <= 0;
    class_r2 <= 0;
    class_v <= 0;
    class_r <= 0;
    
    f_weight_r0 <= 0;
    f_weight_r1 <= 0;
    f_weight_r2 <= 0;
    
    class_f_weight_r0 <= 0;
    class_f_weight_r1 <= 0;
    class_f_weight_r2 <= 0;
    
    f_threshold <= 0;
    f_left <= 0;            
    f_right <= 0;
    
    buf_f_threshold <= 0;
    buf_f_left <= 0;            
    buf_f_right <= 0; 
    
    class_f_threshold <= 0;
    class_f_left <= 0;            
    class_f_right <= 0;		
    end
    
  // The actual Haar feature classification algorithm --Daniel
  else
    begin
        // delta delay
        class_r0 <= class_r0_d - class_r0_c - class_r0_b + class_r0_a;
        class_r1 <= class_r1_d - class_r1_c - class_r1_b + class_r1_a;
        class_r2 <= class_r2_d - class_r2_c - class_r2_b + class_r2_a;
        
        // delta delay
        class_v <= class_f_weight_r0 * $signed(class_r0) + class_f_weight_r1 * $signed(class_r1) + class_f_weight_r2 * $signed(class_r2);
        
        // delta delay
        class_r <= (class_v < class_f_threshold) ? class_f_left : class_f_right; 				
        
        f_weight_r0 <= $signed(feat_rect0[22:20]);
        f_weight_r1 <= $signed(feat_rect1[22:20]);
        f_weight_r2 <= $signed(feat_rect2[22:20]);
        
        // delta delay
        class_f_weight_r0 <= f_weight_r0;
        class_f_weight_r1 <= f_weight_r1;
        class_f_weight_r2 <= f_weight_r2;
        
        f_threshold <= feat_threshold;
        f_left <= feat_left;            
        f_right <= feat_right;
        
        buf_f_threshold <= f_threshold;
        buf_f_left <= f_left;            
        buf_f_right <= f_right;
       
        class_f_threshold <= buf_f_threshold;
        class_f_left <= buf_f_left;            
        class_f_right <= buf_f_right;
    end


// Sum of Stage
reg [4:0] buf1_current_stage;
reg [11:0] buf1_current_feature;
reg [7:0] buf1_stage_feature;

reg [4:0] buf2_current_stage;
reg [11:0] buf2_current_feature;
reg [7:0] buf2_stage_feature;

reg [4:0] buf3_current_stage;
reg [11:0] buf3_current_feature;
reg [7:0] buf3_stage_feature;

reg [4:0] buf4_current_stage;
reg [11:0] buf4_current_feature;
reg [7:0] buf4_stage_feature;

reg [11:0] class_current_feature;
reg [7:0] class_stage_feature;

reg [18:0] sum_current_stage;
reg [18:0] check_sum_current_stage;
reg check_sum_stage;

reg [11:0] class_limit_feature;

always @(negedge CLK or negedge RESET)
  if (!RESET)
    begin
    buf1_current_stage <= 0;
    buf1_current_feature <= 0;
    buf1_stage_feature <= 0;
    
    buf2_current_stage <= 0;
    buf2_current_feature <= 0;
    buf2_stage_feature <= 0;
    
    buf3_current_stage <= 0;
    buf3_current_feature <= 0;
    buf3_stage_feature <= 0;
    
    buf4_current_stage <= 0;
    buf4_current_feature <= 0;
    buf4_stage_feature <= 0;
    
    class_current_stage <= 0;
    class_current_feature <= 0;
    class_stage_feature <= 0;
    
    sum_current_stage <= 0;
    check_sum_current_stage <= 0;
    check_sum_stage <= 1'b0;
    
    class_limit_feature <= num_feat_stage[0];
    end
  else
    begin
    if ((((window_size-1) < pos_x) && (pos_x < image_width)) && (((window_size-1) < pos_y) && (pos_y < image_height)))
      begin
      if (enable == 1'b1)
        begin
        buf1_current_stage <= 0;
        buf1_current_feature <= 0;
        buf1_stage_feature <= 0;
    
        buf2_current_stage <= 0;
        buf2_current_feature <= 0;
        buf2_stage_feature <= 0;
    
        buf3_current_stage <= 0;
        buf3_current_feature <= 0;
        buf3_stage_feature <= 0;
    
        buf4_current_stage <= 0;
        buf4_current_feature <= 0;
        buf4_stage_feature <= 0;
    
        class_current_stage <= 0;
        class_current_feature <= 0;
        class_stage_feature <= 0;
    
        sum_current_stage <= 0;
        check_sum_current_stage <= 0;
        check_sum_stage <= 1'b0;
        
        class_limit_feature <= num_feat_stage[0];
        end
      else
        begin					
        buf1_current_stage <= current_stage;
        buf1_current_feature <= current_feature;
        buf1_stage_feature <= stage_feature;
          
        buf2_current_stage <= buf1_current_stage;
        buf2_current_feature <= buf1_current_feature;
        buf2_stage_feature <= buf1_stage_feature;
          
        buf3_current_stage <= buf2_current_stage;
        buf3_current_feature <= buf2_current_feature;
        buf3_stage_feature <= buf2_stage_feature;
          
        buf4_current_stage <= buf3_current_stage;
        buf4_current_feature <= buf3_current_feature;
        buf4_stage_feature <= buf3_stage_feature;
           
        class_current_stage <= buf4_current_stage;
        class_current_feature <= buf4_current_feature;
        class_stage_feature <= buf4_stage_feature;
              
        if (class_current_feature == class_limit_feature)
          begin
          sum_current_stage <= 0;
          check_sum_current_stage <= sum_current_stage + class_r;
          check_sum_stage <= 1'b1;
          if (class_current_stage == 21)
            begin
            class_limit_feature <= num_feat_stage[0];
            end
          else
            begin
            class_limit_feature <= class_limit_feature + num_feat_stage[class_current_stage+1];
            end
          end
        else
          begin
          if (buf4_current_feature != 0)
            begin
            sum_current_stage <= sum_current_stage + class_r;
            check_sum_current_stage <= 0;
            check_sum_stage <= 1'b0;
            class_limit_feature <= class_limit_feature;
            end
          else
            begin
            sum_current_stage <= 0;
            check_sum_current_stage <= 0;
            check_sum_stage <= 1'b0;
            class_limit_feature <= class_limit_feature;
            end
          end
        end
      end
    else
      begin
      buf1_current_stage <= 0;
      buf1_current_feature <= 0;
      buf1_stage_feature <= 0;
    
      buf2_current_stage <= 0;
      buf2_current_feature <= 0;
      buf2_stage_feature <= 0;
    
      buf3_current_stage <= 0;
      buf3_current_feature <= 0;
      buf3_stage_feature <= 0;
    
      buf4_current_stage <= 0;
      buf4_current_feature <= 0;
      buf4_stage_feature <= 0;
    
      class_current_stage <= 0;
      class_current_feature <= 0;
      class_stage_feature <= 0;
    
      sum_current_stage <= 0;
      check_sum_current_stage <= 0;
    
      check_sum_stage <= 1'b0;
    
      class_limit_feature <= num_feat_stage[0];
      end
    end

// Check Stage Threshold
// Test Point
wire [18:0] tp_s_threshold = stage_threshold;

reg [4:0] check_current_stage;

reg det;
reg [9:0] det_x;
reg [8:0] det_y;
reg [7:0] det_size;

// State machine to see if a stage failed or a face was detected --Daniel
always @(posedge CLK or negedge RESET)
  if (!RESET)
    begin
    check_current_stage <= 0;
    fail_stage <= 1'b0;
    failed_stage <= 1'b0;
    det <= 1'b0;
    det_x <= 0;
    det_y <= 0;
    det_size <= 0;
    end
  else
    begin
      if ((((window_size-2) < pos_x) && (pos_x < (image_width-1))) && (((window_size-1) < pos_y) && (pos_y < image_height)))
        begin		
        check_current_stage <= class_current_stage;
        if (check_sum_stage == 1'b1)
          begin
          if (check_sum_current_stage > stage_threshold)
            begin
            if (check_current_stage == last_stage)
              begin
              fail_stage <= 1'b1;
              failed_stage <= 1'b0;
              det <= 1'b1;
              det_x <= pos_x;
              det_y <= pos_y;
              det_size <= w_size[scale];
              //out_valid <= 1;
              //in_ready <= 1;
              end
            else
              begin	
              fail_stage <= 1'b0;
              failed_stage <= 1'b0;
              det <= 1'b0;
              det_x <= 0;
              det_y <= 0;
              det_size <= 0;
              //out_valid <= 0;
              //in_ready <= 0;
              end
            end
          else
            begin
            fail_stage <= 1'b1;
            failed_stage <= 1'b1;
            det <= 1'b0;
            det_x <= 0;
            det_y <= 0;
            det_size <= 0;
            //out_valid <= 1;
            //in_ready <= 1;
            end
          end
        else
          begin
          fail_stage <= 1'b0;
          failed_stage <= 1'b0;
          det <= 1'b0;
          det_x <= 0;
          det_y <= 0;
          det_size <= 0;
          //out_valid <= 0;
          //in_ready <= 0;
          end			
        end
      else
        begin
        fail_stage <= 1'b1;
        failed_stage <= 1'b0;
        det <= 1'b0;
        det_x <= 0;
        det_y <= 0;
        det_size <= 0;
        //out_valid <= 0;
        //in_ready <= 0;
        end
    end

wire Shift = fail_stage;
wire Detected_wire = det;
wire Failed_wire = failed_stage;

reg Detected_temp;
reg Failed_temp;
reg out_valid_temp;
reg in_ready_temp;

// Conditionals to temporarily store the final output until consumer is ready
always @(posedge CLK or negedge RESET)
  if (!RESET) begin
    Detected <= 0;
    Failed <= 0;
    Detected_temp <= 0;
    Failed_temp <= 0;
    
    out_valid <= 0;
    in_ready <= 0;
    out_valid_temp <= 0;
    in_ready_temp <= 0;
  end
  else if (Failed_wire == 1 || Detected_wire == 1) begin
    Detected_temp <= Detected_wire;
    Failed_temp <= Failed_wire;
    
    out_valid_temp <= 1;
    in_ready_temp <= 1;
  end
  else if (out_ready == 1 && (Failed_temp == 1 || Detected_temp == 1)) begin
    Detected <= Detected_temp;
    Failed <= Failed_temp;
    Detected_temp <= 0;
    Failed_temp <= 0;
    
    out_valid <= out_valid_temp;
    in_ready <= in_ready_temp;
    out_valid_temp <= 0;
    in_ready_temp <= 0;
  end
  else begin
    Detected <= 0;
    Failed <= 0;
    Detected_temp <= Detected_temp;
    Failed_temp <= Failed_temp;
    
    out_valid <= 0;
    in_ready <= 0;
    out_valid_temp <= out_valid_temp;
    in_ready_temp <= in_ready_temp;
  end
endmodule
  