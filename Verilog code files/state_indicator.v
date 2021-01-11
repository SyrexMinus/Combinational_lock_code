module state_indicator(
input [2:0] state,
output reg [4:0] lights
);

always@ (*)
begin
	case(state)
		3'd0:
			lights = 5'b11110;
		3'd1:
			lights = 5'b11101;
		3'd2:
			lights = 5'b11011;
		3'd3:
			lights = 5'b10111;
		3'd4:
			lights = 5'b01111;
		default:
			lights = 5'b11111;
	endcase
end

endmodule 