// after button click it shift pointer to next number
module shift_anode(
input shift_button,
input [2:0] state,
input [2:0] state_need,
output reg [2:0] position_pointer = 'd0
);

always@ (posedge shift_button)
if(state == state_need)
begin
	begin
		position_pointer <= position_pointer + 1;
	end
end

endmodule 