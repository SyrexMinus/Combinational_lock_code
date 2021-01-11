// which block is on
module anode_control(
	input [2:0] refreshcounter,	// iterator
	output reg [7:0] anode = 0		// which block is on
);

always@(refreshcounter)
begin
	case(refreshcounter)
		3'd0:
			anode = 8'b11111110;		// digit 1 ON (right digit)
		3'd1:
			anode = 8'b11111101;		// digit 2 ON 
		3'd2:
			anode = 8'b11111011;		// digit 3 ON 
		3'd3:
			anode = 8'b11110111;		// digit 4 ON 
		3'd4:
			anode = 8'b11101111;		// digit 5 ON 
		3'd5:
			anode = 8'b11011111;		// digit 6 ON 
		3'd6:
			anode = 8'b10111111;		// digit 7 ON 
		3'd7:
			anode = 8'b01111111;		// digit 8 ON (left digit)
	endcase
end

endmodule 