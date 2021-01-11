// when button is clicked it increase in current digit
module increase_digit(
input button_increase,
input [2:0] position_pointer,
input [2:0] state,
input [2:0] state_need,
output reg [3:0] digit1reg = 'd0,
output reg [3:0] digit2reg = 'd0,
output reg [3:0] digit3reg = 'd0,
output reg [3:0] digit4reg = 'd0,
output reg [3:0] digit5reg = 'd0,
output reg [3:0] digit6reg = 'd0,
output reg [3:0] digit7reg = 'd0,
output reg [3:0] digit8reg = 'd0
);

always@ (posedge button_increase)
begin
	if(state == state_need)
	begin
		case (position_pointer)
			'd0:
				digit1reg <= (digit1reg + 1) % 10;
			'd1:
				digit2reg <= (digit2reg + 1) % 10;
			'd2:
				digit3reg <= (digit3reg + 1) % 10;
			'd3:
				digit4reg <= (digit4reg + 1) % 10;
			'd4:
				digit5reg <= (digit5reg + 1) % 10;
			'd5:
				digit6reg <= (digit6reg + 1) % 10;
			'd6:
				digit7reg <= (digit7reg + 1) % 10;
			'd7:
				digit8reg <= (digit8reg + 1) % 10;
			default:
				digit1reg <= (digit1reg + 1) % 10;
		endcase
	end
end

endmodule 