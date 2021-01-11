module top(
	input wire clk,					// 50 MHz
	input wire button_next,			// go to next state
	input wire button_left,			//	select right block K5
	input wire button_increase,	// increase value in current block +1 
	output wire [7:0] anode,		// blocks
	output wire [7:0] cathode,		// stics
	output wire [4:0] lights		// indicators
);

wire refresh_clock;
wire [2:0] refreshcounter;
wire [3:0] ONE_DIGIT;
wire [2:0] state;
wire position_pointer_now;

wire [2:0] position_pointer_insertdata;
wire [3:0] digit1_insertdata;
wire [3:0] digit2_insertdata;
wire [3:0] digit3_insertdata;
wire [3:0] digit4_insertdata;
wire [3:0] digit5_insertdata;
wire [3:0] digit6_insertdata;
wire [3:0] digit7_insertdata;
wire [3:0] digit8_insertdata;

wire [2:0] position_pointer_insertnewpass;
wire [3:0] digit1_insertnewpass;
wire [3:0] digit2_insertnewpass;
wire [3:0] digit3_insertnewpass;
wire [3:0] digit4_insertnewpass;
wire [3:0] digit5_insertnewpass;
wire [3:0] digit6_insertnewpass;
wire [3:0] digit7_insertnewpass;
wire [3:0] digit8_insertnewpass;

wire [2:0] position_pointer_insertpass;
wire [3:0] digit1_insertpass;
wire [3:0] digit2_insertpass;
wire [3:0] digit3_insertpass;
wire [3:0] digit4_insertpass;
wire [3:0] digit5_insertpass;
wire [3:0] digit6_insertpass;
wire [3:0] digit7_insertpass;
wire [3:0] digit8_insertpass;

wire [3:0] digit1_data;
wire [3:0] digit2_data;
wire [3:0] digit3_data;
wire [3:0] digit4_data;
wire [3:0] digit5_data;
wire [3:0] digit6_data;
wire [3:0] digit7_data;
wire [3:0] digit8_data;

wire [3:0] digit1_password;
wire [3:0] digit2_password;
wire [3:0] digit3_password;
wire [3:0] digit4_password;
wire [3:0] digit5_password;
wire [3:0] digit6_password;
wire [3:0] digit7_password;
wire [3:0] digit8_password;

wire [2:0] position_pointer;
wire [3:0] digit1;
wire [3:0] digit2;
wire [3:0] digit3;
wire [3:0] digit4;
wire [3:0] digit5;
wire [3:0] digit6;
wire [3:0] digit7;
wire [3:0] digit8;

wire button_next_down;
wire button_left_down;
wire button_increase_down;

//////////////////////
// BUTTON DEBOUNCER //
//////////////////////

button_debouncer button_debouncer_button_next(
.clk_i(clk),
.rst_i(),
 
.sw_i(button_next),
 
.sw_state_o(),
.sw_down_o(button_next_down),
.sw_up_o()
);

button_debouncer button_debouncer_button_left(
.clk_i(clk),
.rst_i(),
 
.sw_i(button_left),
 
.sw_state_o(),
.sw_down_o(button_left_down),
.sw_up_o()
);

button_debouncer button_debouncer_button_increase(
.clk_i(clk),
.rst_i(),
 
.sw_i(button_increase),
 
.sw_state_o(),
.sw_down_o(button_increase_down),
.sw_up_o()
);

/////////////
// DISPLAY //
/////////////

// wrapper for the clock divider
clock_divider refreshclock_generator (
.clk(clk),
.divided_clk(refresh_clock)		// 10 kHz
);

// Seven segment controller modules
refresh_counter Refreshcounter_wrapper(
.refresh_clock(refresh_clock),
.refreshcounter(refreshcounter)
);

anode_control anode_control_wrapper(
.refreshcounter(refreshcounter),
.anode(anode)
); 

show_manager(
.state(state),
.button_increase(button_increase_down),

.position_pointer_insertdata(position_pointer_insertdata),
.digit1_insertdata(digit1_insertdata),
.digit2_insertdata(digit2_insertdata),
.digit3_insertdata(digit3_insertdata),
.digit4_insertdata(digit4_insertdata),
.digit5_insertdata(digit5_insertdata),
.digit6_insertdata(digit6_insertdata),
.digit7_insertdata(digit7_insertdata),
.digit8_insertdata(digit8_insertdata),

.position_pointer_insertnewpass(position_pointer_insertnewpass),
.digit1_insertnewpass(digit1_insertnewpass),
.digit2_insertnewpass(digit2_insertnewpass),
.digit3_insertnewpass(digit3_insertnewpass),
.digit4_insertnewpass(digit4_insertnewpass),
.digit5_insertnewpass(digit5_insertnewpass),
.digit6_insertnewpass(digit6_insertnewpass),
.digit7_insertnewpass(digit7_insertnewpass),
.digit8_insertnewpass(digit8_insertnewpass),

.position_pointer_insertpass(position_pointer_insertpass),
.digit1_insertpass(digit1_insertpass),
.digit2_insertpass(digit2_insertpass),
.digit3_insertpass(digit3_insertpass),
.digit4_insertpass(digit4_insertpass),
.digit5_insertpass(digit5_insertpass),
.digit6_insertpass(digit6_insertpass),
.digit7_insertpass(digit7_insertpass),
.digit8_insertpass(digit8_insertpass),

.digit1_data(digit1_data),
.digit2_data(digit2_data),
.digit3_data(digit3_data),
.digit4_data(digit4_data),
.digit5_data(digit5_data),
.digit6_data(digit6_data),
.digit7_data(digit7_data),
.digit8_data(digit8_data),

.position_pointer(position_pointer),
.digit1(digit1),
.digit2(digit2),
.digit3(digit3),
.digit4(digit4),
.digit5(digit5),
.digit6(digit6),
.digit7(digit7),
.digit8(digit8)
);

bcd_control bcd_control_wrapper(
.state(state),
.digit1(digit1),
.digit2(digit2),
.digit3(digit3),
.digit4(digit4),
.digit5(digit5),
.digit6(digit6),
.digit7(digit7),
.digit8(digit8),
.position_pointer(position_pointer),
.refreshcounter(refreshcounter),
.ONE_DIGIT(ONE_DIGIT),
.position_pointer_now(position_pointer_now)
);

bcd_to_cathodes bcd_to_cathodes_wrapper(
.digit(ONE_DIGIT),
.position_pointer_now(position_pointer_now),
.cathode(cathode)
);

///////////////////
// STATE MANAGER //
///////////////////

state_manager(
.button_next(button_next_down),

.digit1_showing(digit1),
.digit2_showing(digit2),
.digit3_showing(digit3),
.digit4_showing(digit4),
.digit5_showing(digit5),
.digit6_showing(digit6),
.digit7_showing(digit7),
.digit8_showing(digit8),

.digit1_password(digit1_password),
.digit2_password(digit2_password),
.digit3_password(digit3_password),
.digit4_password(digit4_password),
.digit5_password(digit5_password),
.digit6_password(digit6_password),
.digit7_password(digit7_password),
.digit8_password(digit8_password),

.state(state)
);

//////////////////////
// STATE INDICATORS //
//////////////////////

state_indicator state_indicator_wrapper(
.state(state),
.lights(lights)
);

/////////////
// STATE 0 //
/////////////

increase_digit increase_digit_wrapper_insertdata(
.button_increase(button_increase_down),
.position_pointer(position_pointer_insertdata),
.state(state),
.state_need(3'd0),
.digit1reg(digit1_insertdata),
.digit2reg(digit2_insertdata),
.digit3reg(digit3_insertdata),
.digit4reg(digit4_insertdata),
.digit5reg(digit5_insertdata),
.digit6reg(digit6_insertdata),
.digit7reg(digit7_insertdata),
.digit8reg(digit8_insertdata)
);

shift_anode shift_anode_wrapper_insertdata(
.shift_button(button_left_down),
.state(state),
.state_need(3'd0),
.position_pointer(position_pointer_insertdata)
);

/////////////
// STATE 1 //
/////////////

increase_digit increase_digit_wrapper_insertnewpass(
.button_increase(button_increase_down),
.position_pointer(position_pointer_insertnewpass),
.state(state),
.state_need(3'd1),
.digit1reg(digit1_insertnewpass),
.digit2reg(digit2_insertnewpass),
.digit3reg(digit3_insertnewpass),
.digit4reg(digit4_insertnewpass),
.digit5reg(digit5_insertnewpass),
.digit6reg(digit6_insertnewpass),
.digit7reg(digit7_insertnewpass),
.digit8reg(digit8_insertnewpass)
);

shift_anode shift_anode_wrapper_insertnewpass(
.shift_button(button_left_down),
.state(state),
.state_need(3'd1),
.position_pointer(position_pointer_insertnewpass)
);

data_saver data_saver_wrapper_data(
.state(state),
.state_save(3'd1),

.digit1_insertdata(digit1_insertdata),
.digit2_insertdata(digit2_insertdata),
.digit3_insertdata(digit3_insertdata),
.digit4_insertdata(digit4_insertdata),
.digit5_insertdata(digit5_insertdata),
.digit6_insertdata(digit6_insertdata),
.digit7_insertdata(digit7_insertdata),
.digit8_insertdata(digit8_insertdata),

.digit1_data(digit1_data),
.digit2_data(digit2_data),
.digit3_data(digit3_data),
.digit4_data(digit4_data),
.digit5_data(digit5_data),
.digit6_data(digit6_data),
.digit7_data(digit7_data),
.digit8_data(digit8_data)
);

/////////////
// STATE 2 //
/////////////

data_saver data_saver_wrapper_password(
.state(state),
.state_save(3'd2),

.digit1_insertdata(digit1_insertnewpass),
.digit2_insertdata(digit2_insertnewpass),
.digit3_insertdata(digit3_insertnewpass),
.digit4_insertdata(digit4_insertnewpass),
.digit5_insertdata(digit5_insertnewpass),
.digit6_insertdata(digit6_insertnewpass),
.digit7_insertdata(digit7_insertnewpass),
.digit8_insertdata(digit8_insertnewpass),

.digit1_data(digit1_password),
.digit2_data(digit2_password),
.digit3_data(digit3_password),
.digit4_data(digit4_password),
.digit5_data(digit5_password),
.digit6_data(digit6_password),
.digit7_data(digit7_password),
.digit8_data(digit8_password)
);

/////////////
// STATE 3 //
/////////////

increase_digit increase_digit_wrapper_insertpass(
.button_increase(button_increase_down),
.position_pointer(position_pointer_insertpass),
.state(state),
.state_need(3'd3),
.digit1reg(digit1_insertpass),
.digit2reg(digit2_insertpass),
.digit3reg(digit3_insertpass),
.digit4reg(digit4_insertpass),
.digit5reg(digit5_insertpass),
.digit6reg(digit6_insertpass),
.digit7reg(digit7_insertpass),
.digit8reg(digit8_insertpass)
);

shift_anode shift_anode_wrapper_insertpass(
.shift_button(button_left_down),
.state(state),
.state_need(3'd3),
.position_pointer(position_pointer_insertpass)
);

endmodule 