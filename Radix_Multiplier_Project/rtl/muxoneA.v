module muxoneA (
	input [63:0] a, 
	input xi,
	output reg [64:0] out
);
	// Chooses between 0a and 1a
	always @(*) begin
		if(xi) begin
			out = {1'b0, a};
		end
		else begin
			out = 65'b0;
		end
	end

endmodule
