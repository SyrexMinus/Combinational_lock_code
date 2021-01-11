// iterator for which block is on
module refresh_counter(
input refresh_clock,							// clock
output reg [2:0] refreshcounter = 0		// iterator for which block is on
);

always@(posedge refresh_clock) refreshcounter <= refreshcounter + 1;

endmodule 