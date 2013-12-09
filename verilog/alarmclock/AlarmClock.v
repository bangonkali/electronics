/** \brief A very simple Alarm Clock Implementation
 *
 * A very simple Alarm Clock implemented using the Cyclone II FPGA Board by Terasic.
 * The board has a EP2C20F484C7 Altera Cyclone II FPGA chip. The user is able to see
 * the time, set the time, and set the alarm. 
 *
 * Proponents: Aguilar, Fujimori, Regalado, Sarmiento
 */

`define MILISEC_MAX 998
`define COUNT60_MAX 58
`define COUNT12_MAX 22

module AlarmClock (
	input wire clock,             /*!< clock designated as Y1 (50Mhz) */
	
	input wire pb_mode_select,    /*!< pb_mode_select designated as KEY0. Changes the current mod from set to show & vs-vs. */
	input wire pb_next,           /*!< pb_next designated as KEY1. Changes the view from HH:mm to mm:ss & vs-vs.  */
	input wire pb_up,             /*!< pb_up designated as KEY2. Increases the currently edited unit.*/
	input wire pb_down,           /*!< pb_down designated as KEY3. Decreases the currently edited unit. */

	input wire sw_enable,         /*!< sw_enable designated as SW1. Used for debugging/pausing. */
	input wire sw_reset,          /*!< sw_reset designated as SW0. Used for debugging. */
	
	output wire[1:7] disp_a_leds, /*!< disp_a_leds designated as HEX0 */
	output wire[1:7] disp_b_leds, /*!< disp_b_leds designated as HEX1 */
	output wire[1:7] disp_c_leds, /*!< disp_c_leds designated as HEX2 */
	output wire[1:7] disp_d_leds, /*!< disp_d_leds_leds designated as HEX3 */

	output reg mode_edit,         /*!< mode_edit designated as LEDR9 */
	output reg mode_data,         /*!< mode_data designated as LEDR8 */
	output reg alarm_out          /*!< alarm_out designated as LEDR0. Can be designated to GPIO to trigger a buzzer. */
);
	
	parameter CLOCK_FREQ_1KHZ = 50000;
	
	integer clock_khz;
	integer milisec;
	integer seconds;
	integer minutes;
	integer hour;
	
	integer alarm_seconds;
	integer alarm_minutes;
	integer alarm_hours;
	
	reg[0:2]	active_mode;
	reg[0:2] current_blinking;
	reg current_view; 
	
	reg previous_pb_mode_select;
	reg previous_pb_next;
	reg previous_pb_up;
	reg previous_pb_down;
	
	reg blinker_enable_DispA;
	reg blinker_enable_DispB;
	
	reg [7:0] val_dispa;
	reg [7:0] val_dispb;
	
	wire blink_out_DispA;
	wire blink_out_DispB;
	
	UnitDisplay UnitDisplay_A (
		.clock (clock),
		.value (val_dispa),
		.enable (blink_out_DispA),
		.value_ones_leds (disp_a_leds),
		.value_tens_leds (disp_b_leds)
	);
	
	UnitDisplay UnitDisplay_B (
		.clock (clock),
		.value (val_dispb),
		.enable (blink_out_DispB),
		.value_ones_leds (disp_c_leds),
		.value_tens_leds (disp_d_leds)
	);
	
	Blinker Blinker_DispA(
		.clock (clock),
		.enable (blinker_enable_DispA),
		.bout (blink_out_DispA)
	);
	
	Blinker Blinker_DispB(
		.clock (clock),
		.enable (blinker_enable_DispB),
		.bout (blink_out_DispB)
	);
	
	always@(posedge clock) begin
		/**************************************\
		 * Core arithmetic.
		\**************************************/
		if(sw_enable) begin
			clock_khz <= clock_khz + 1;
			if (clock_khz > CLOCK_FREQ_1KHZ-2) begin
				clock_khz <= 0;
				milisec <= milisec + 1;
				if ( milisec > `MILISEC_MAX) begin
					milisec <= 0;
					seconds <= seconds + 1;
					if (seconds > `COUNT60_MAX) begin 
						seconds <= 0;
						minutes <= minutes + 1;
						if (minutes > `COUNT60_MAX) begin
							hour <= hour + 1;
							minutes <= 0;
							if (hour > `COUNT12_MAX) begin
								hour <= 0;
							end
						end
					end
				end
			end
		end

				
		/**************************************\
		 * RESET SWITCH For Debugging Only.
		\**************************************/
		if (sw_reset) begin
			clock_khz <= 0;
			milisec <= 0;
			seconds <= 0;
			minutes <= 0;
			hour <= 0;
			
			alarm_seconds <= 0;
			alarm_minutes <= 0;
			alarm_hours <= 0;			
			
			active_mode <= 0;
			current_view <= 0;
			current_blinking <= 0;
			
			previous_pb_next <= 1;
			previous_pb_mode_select <= 1;
		end
		
		/**************************************\
		 * Check If alarm should be triggered.
		\**************************************/
		if (alarm_hours == hour && alarm_minutes == minutes) begin
			alarm_out <= 1;
		end else begin
			alarm_out <= 0;
		end
		
		
		/**************************************\
		 * Check NEXT push button negedge.
		\**************************************/
		if (previous_pb_next == 1 && pb_next == 0) begin
			previous_pb_next <= 0;
			current_view <= !current_view;
			current_blinking <= current_blinking + 1;
			if (current_blinking >= 3) begin
				current_blinking <= 0;
			end
		end else begin
			previous_pb_next <= pb_next;
		end
		
		
		/**************************************\
		 * Make sure the values don't overflow.
		\**************************************/
		if (seconds < 0) begin
			seconds <= 59;
		end 
		if (minutes < 0) begin
			minutes <= 59;
		end 
		if (hour < 0) begin
			hour <= 23;
		end 
		if (seconds > 59) begin
			seconds <= 0;
		end
		if (minutes > 59) begin
			minutes <= 0;
		end
		if (hour > 23) begin
			hour <= 0;
		end
		if (alarm_seconds < 0) begin
			alarm_seconds <= 59;
		end 
		if (alarm_minutes < 0) begin
			alarm_minutes <= 59;
		end 
		if (alarm_hours < 0) begin
			alarm_hours <= 23;
		end
		if (alarm_seconds > 59) begin
			alarm_seconds <= 0;
		end
		if (alarm_minutes > 59) begin
			alarm_minutes <= 0;
		end
		if (alarm_hours > 23) begin
			alarm_hours <= 0;
		end
				
		/**************************************\
		 * Check UP push button negedge.
		\**************************************/
		if (previous_pb_up == 1 && pb_up == 0) begin
			previous_pb_up <= 0;
			if (active_mode == 1 && current_blinking == 0) begin
				seconds <= seconds + 1;
			end else if (active_mode == 1 && current_blinking == 1) begin
				minutes <= minutes + 1;
			end else if (active_mode == 1 && current_blinking == 2) begin
				minutes <= minutes + 1;
			end else if (active_mode == 1 && current_blinking == 3) begin
				hour <= hour + 1;
			end else if (active_mode == 3 && current_blinking == 0) begin
				alarm_seconds <= alarm_seconds + 1;
			end else if (active_mode == 3 && current_blinking == 1) begin
				alarm_minutes <= alarm_minutes + 1;
			end else if (active_mode == 3 && current_blinking == 2) begin
				alarm_minutes <= alarm_minutes + 1;
			end else if (active_mode == 3 && current_blinking == 3) begin
				alarm_hours <= alarm_hours + 1;
			end
		end else begin
			previous_pb_up <= pb_up;
		end
				
		/**************************************\
		 * Check DOWN push button negedge.
		\**************************************/
		if (previous_pb_down == 1 && pb_down == 0) begin
			previous_pb_down <= 0;
			
			if (active_mode == 1 && current_blinking == 0) begin
				seconds <= seconds - 1;
			end else if (active_mode == 1 && current_blinking == 1) begin
				minutes <= minutes - 1;
			end else if (active_mode == 1 && current_blinking == 2) begin
				minutes <= minutes - 1;
			end else if (active_mode == 1 && current_blinking == 3) begin
				hour <= hour - 1;
			end else if (active_mode == 3 && current_blinking == 0) begin
				alarm_seconds <= alarm_seconds - 1;
			end else if (active_mode == 3 && current_blinking == 1) begin
				alarm_minutes <= alarm_minutes - 1;
			end else if (active_mode == 3 && current_blinking == 2) begin
				alarm_minutes <= alarm_minutes - 1;
			end else if (active_mode == 3 && current_blinking == 3) begin
				alarm_hours <= alarm_hours - 1;
			end
		end else begin
			previous_pb_down <= pb_down;
		end
				
		/**************************************\
		 * Check MODE SELECT push button negedge.
		\**************************************/
		if (previous_pb_mode_select == 1 && pb_mode_select == 0) begin
			previous_pb_mode_select <= 0;
			current_blinking <= 0;
			current_view <= 0;
			
			active_mode <= active_mode + 1;
			if (active_mode >= 3) begin 
				active_mode <= 0;
			end 
		end else begin 
			previous_pb_mode_select <= pb_mode_select;
		end
				
		/**************************************\
		 * Check ACTIVE MODE push button negedge.
		\**************************************/
		if (active_mode == 0) begin
			mode_data <= 0;
			mode_edit <= 0;
			blinker_enable_DispA <= 0;
			blinker_enable_DispB <= 0;
			if (current_view == 0) begin
				val_dispa <= seconds;
				val_dispb <= minutes;
			end else if (current_view == 1) begin 
				val_dispa <= minutes;
				val_dispb <= hour;
			end
		end else if (active_mode == 1) begin
			mode_data <= 0;
			mode_edit <= 1;
			if (current_blinking == 0) begin
				val_dispa <= seconds;
				val_dispb <= minutes;
				blinker_enable_DispA <= 1;
				blinker_enable_DispB <= 0;
			end else if (current_blinking == 1) begin 
				val_dispa <= seconds;
				val_dispb <= minutes;
				blinker_enable_DispA <= 0;
				blinker_enable_DispB <= 1;
			end else if (current_blinking == 2) begin 
				val_dispa <= minutes;
				val_dispb <= hour;
				blinker_enable_DispA <= 1;
				blinker_enable_DispB <= 0;
			end else if (current_blinking == 3) begin 
				val_dispa <= minutes;
				val_dispb <= hour;
				blinker_enable_DispA <= 0;
				blinker_enable_DispB <= 1;
			end
		end else if (active_mode == 2) begin
			mode_data <= 1;
			mode_edit <= 0;
			blinker_enable_DispA <= 0;
			blinker_enable_DispB <= 0;
			if (current_view == 0) begin
				val_dispa <= alarm_seconds;
				val_dispb <= alarm_minutes;
			end else if (current_view == 1) begin 
				val_dispa <= alarm_minutes;
				val_dispb <= alarm_hours;
			end
		end else if (active_mode == 3) begin
			mode_data <= 1;
			mode_edit <= 1;
			if (current_blinking == 0) begin
				val_dispa <= alarm_seconds;
				val_dispb <= alarm_minutes;
				blinker_enable_DispA <= 1;
				blinker_enable_DispB <= 0;
			end else if (current_blinking == 1) begin 
				val_dispa <= alarm_seconds;
				val_dispb <= alarm_minutes;
				blinker_enable_DispA <= 0;
				blinker_enable_DispB <= 1;
			end else if (current_blinking == 2) begin 
				val_dispa <= alarm_minutes;
				val_dispb <= alarm_hours;
				blinker_enable_DispA <= 1;
				blinker_enable_DispB <= 0;
			end else if (current_blinking == 3) begin 
				val_dispa <= alarm_minutes;
				val_dispb <= alarm_hours;
				blinker_enable_DispA <= 0;
				blinker_enable_DispB <= 1;
			end
		end
	end
	
endmodule
