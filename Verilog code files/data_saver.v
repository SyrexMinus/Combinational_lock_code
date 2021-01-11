module data_saver(
input [2:0] state,
input [2:0] state_save,

input [3:0] digit1_insertdata,
input [3:0] digit2_insertdata,
input [3:0] digit3_insertdata,
input [3:0] digit4_insertdata,
input [3:0] digit5_insertdata,
input [3:0] digit6_insertdata,
input [3:0] digit7_insertdata,
input [3:0] digit8_insertdata,

output reg [3:0] digit1_data,
output reg [3:0] digit2_data,
output reg [3:0] digit3_data,
output reg [3:0] digit4_data,
output reg [3:0] digit5_data,
output reg [3:0] digit6_data,
output reg [3:0] digit7_data,
output reg [3:0] digit8_data
);

always@ (*)
begin
	case(state)
		state_save:
		begin
			digit1_data <= digit1_insertdata;
			digit2_data <= digit2_insertdata;
			digit3_data <= digit3_insertdata;
			digit4_data <= digit4_insertdata;
			digit5_data <= digit5_insertdata;
			digit6_data <= digit6_insertdata;
			digit7_data <= digit7_insertdata;
			digit8_data <= digit8_insertdata;
		end
		default:
		begin
			digit1_data <= digit1_data;
			digit2_data <= digit2_data;
			digit3_data <= digit3_data;
			digit4_data <= digit4_data;
			digit5_data <= digit5_data;
			digit6_data <= digit6_data;
			digit7_data <= digit7_data;
			digit8_data <= digit8_data;
		end
	endcase
end

endmodule 