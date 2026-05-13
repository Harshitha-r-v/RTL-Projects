module muxtwoA (
	input [63:0] a, 
	input xiOne,
	output reg [64:0] out
);
	// Chooses between 0a and 2a
	always @(*) begin
		if(xiOne) begin
			out = {a, 1'b0};
		end
		else begin
			out = 65'b0;
		end
	end

endmodule
