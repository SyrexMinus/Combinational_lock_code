module state_manager(
input button_next,

input [3:0] digit1_showing,
input [3:0] digit2_showing,
input [3:0] digit3_showing,
input [3:0] digit4_showing,
input [3:0] digit5_showing,
input [3:0] digit6_showing,
input [3:0] digit7_showing,
input [3:0] digit8_showing,

input [3:0] digit1_password,
input [3:0] digit2_password,
input [3:0] digit3_password,
input [3:0] digit4_password,
input [3:0] digit5_password,
input [3:0] digit6_password,
input [3:0] digit7_password,
input [3:0] digit8_password,

output reg [2:0] state = 3'd0
);

always@ (posedge button_next)
begin

case(state)
3'd0:
state = 'd1;

3'd1:
state = 'd2;

3'd2:
state = 'd3;

3'd3:
begin
if(digit1_showing == digit1_password &&
digit2_showing == digit2_password &&
digit3_showing == digit3_password &&
digit4_showing == digit4_password &&
digit5_showing == digit5_password &&
digit6_showing == digit6_password &&
digit7_showing == digit7_password &&
digit8_showing == digit8_password)
state = 'd4;
end

3'd4:
state = 'd0;

default:
state = state;
endcase

end
endmodule 