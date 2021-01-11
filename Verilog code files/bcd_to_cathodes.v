// translator digit to cathodes (sticks)
module bcd_to_cathodes(
	input [3:0] digit,
	input position_pointer_now,
	output reg [7:0] cathode = 0
);

always@ (position_pointer_now)
begin
	if(position_pointer_now == 1)
		cathode[7] = 1'b0;
	else
		cathode[7] = 1'b1;
end

always@ (digit)
	begin
		case(digit)
			4'd0:
				cathode[6:0] = 7'b1000000;	// zero
			4'd1:
				cathode[6:0] = 7'b1111001;	// one
			4'd2:
				cathode[6:0] = 7'b0100100;	// two
			4'd3:
				cathode[6:0] = 7'b0110000;	// three
			4'd4:
				cathode[6:0] = 7'b0011001;	// four
			4'd5:
				cathode[6:0] = 7'b0010010;	// five
			4'd6:
				cathode[6:0] = 7'b0000010;	// six
			4'd7:
				cathode[6:0] = 7'b1111000;	// seven
			4'd8:
				cathode[6:0] = 7'b0000000;	// eight
			4'd9:
				cathode[6:0] = 7'b0010000;	// nine
			default:
				cathode[6:0] = 7'b1000000;	// zero in any other cases
		endcase
	end

endmodule 