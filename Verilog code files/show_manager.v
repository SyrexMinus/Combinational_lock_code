module show_manager(
input [2:0] state,
input button_increase,

input [2:0] position_pointer_insertdata,
input [3:0] digit1_insertdata,
input [3:0] digit2_insertdata,
input [3:0] digit3_insertdata,
input [3:0] digit4_insertdata,
input [3:0] digit5_insertdata,
input [3:0] digit6_insertdata,
input [3:0] digit7_insertdata,
input [3:0] digit8_insertdata,

input [2:0] position_pointer_insertnewpass,
input [3:0] digit1_insertnewpass,
input [3:0] digit2_insertnewpass,
input [3:0] digit3_insertnewpass,
input [3:0] digit4_insertnewpass,
input [3:0] digit5_insertnewpass,
input [3:0] digit6_insertnewpass,
input [3:0] digit7_insertnewpass,
input [3:0] digit8_insertnewpass,

input [2:0] position_pointer_insertpass,
input [3:0] digit1_insertpass,
input [3:0] digit2_insertpass,
input [3:0] digit3_insertpass,
input [3:0] digit4_insertpass,
input [3:0] digit5_insertpass,
input [3:0] digit6_insertpass,
input [3:0] digit7_insertpass,
input [3:0] digit8_insertpass,

input [3:0] digit1_data,
input [3:0] digit2_data,
input [3:0] digit3_data,
input [3:0] digit4_data,
input [3:0] digit5_data,
input [3:0] digit6_data,
input [3:0] digit7_data,
input [3:0] digit8_data,

output reg [2:0] position_pointer,
output reg [3:0] digit1 = 'd0,
output reg [3:0] digit2 = 'd0,
output reg [3:0] digit3 = 'd0,
output reg [3:0] digit4 = 'd0,
output reg [3:0] digit5 = 'd0,
output reg [3:0] digit6 = 'd0,
output reg [3:0] digit7 = 'd0,
output reg [3:0] digit8 = 'd0
);

always@ (state or button_increase)
begin
	case(state)
		'd0:
		begin
			position_pointer <= position_pointer_insertdata;
			digit1 <= digit1_insertdata;
			digit2 <= digit2_insertdata;
			digit3 <= digit3_insertdata;
			digit4 <= digit4_insertdata;
			digit5 <= digit5_insertdata;
			digit6 <= digit6_insertdata;
			digit7 <= digit7_insertdata;
			digit8 <= digit8_insertdata;
		end
		'd1:
		begin
			position_pointer <= position_pointer_insertnewpass;
			digit1 <= digit1_insertnewpass;
			digit2 <= digit2_insertnewpass;
			digit3 <= digit3_insertnewpass;
			digit4 <= digit4_insertnewpass;
			digit5 <= digit5_insertnewpass;
			digit6 <= digit6_insertnewpass;
			digit7 <= digit7_insertnewpass;
			digit8 <= digit8_insertnewpass;
		end
		'd2:
		begin
			digit1 <= digit1_insertnewpass;
			digit2 <= digit2_insertnewpass;
			digit3 <= digit3_insertnewpass;
			digit4 <= digit4_insertnewpass;
			digit5 <= digit5_insertnewpass;
			digit6 <= digit6_insertnewpass;
			digit7 <= digit7_insertnewpass;
			digit8 <= digit8_insertnewpass;
		end
		'd3:
		begin
			position_pointer <= position_pointer_insertpass;
			digit1 <= digit1_insertpass;
			digit2 <= digit2_insertpass;
			digit3 <= digit3_insertpass;
			digit4 <= digit4_insertpass;
			digit5 <= digit5_insertpass;
			digit6 <= digit6_insertpass;
			digit7 <= digit7_insertpass;
			digit8 <= digit8_insertpass;
		end
		'd4:
		begin
			digit1 <= digit1_data;
			digit2 <= digit2_data;
			digit3 <= digit3_data;
			digit4 <= digit4_data;
			digit5 <= digit5_data;
			digit6 <= digit6_data;
			digit7 <= digit7_data;
			digit8 <= digit8_data;
		end
	endcase
end

endmodule 