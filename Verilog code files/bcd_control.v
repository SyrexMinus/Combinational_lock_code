module bcd_control(
input [2:0] state,					// state of the program
input [3:0] digit1,					// right digit // ones
input [3:0] digit2,					// tens
input [3:0] digit3,					// hundreds
input [3:0] digit4,					// thousands
input [3:0] digit5,					// tens of thousands
input [3:0] digit6,					//	hundreds of thousands
input [3:0] digit7,					// millions
input [3:0] digit8,					// left digit	// tens of millions
input [2:0] position_pointer,		// which number is selected
input [2:0] refreshcounter,		// iterator which block is on
output reg [3:0] ONE_DIGIT = 0,	// displaing number for current block
output reg position_pointer_now=0// is displaing number selected 
);

always@(refreshcounter)
	begin
		case(refreshcounter)
			3'd0:
				ONE_DIGIT = digit1;	// digit 1 value (right digit)
			3'd1:
				ONE_DIGIT = digit2;	// digit 2 value
			3'd2:
				ONE_DIGIT = digit3;	// digit 3 value
			3'd3:
				ONE_DIGIT = digit4;	// digit 4 value
			3'd4:
				ONE_DIGIT = digit5;	// digit 5 value
			3'd5:
				ONE_DIGIT = digit6;	// digit 6 value
			3'd6:
				ONE_DIGIT = digit7;	// digit 7 value
			3'd7:
				ONE_DIGIT = digit8;	// digit 8 value (left digit)
		endcase
		
		if(position_pointer == refreshcounter && (state == 3'd0 || state == 3'd1 || state == 3'd3))
			position_pointer_now = 1;	// point below number
		else
			position_pointer_now = 0;	// no point below number
	end

endmodule 