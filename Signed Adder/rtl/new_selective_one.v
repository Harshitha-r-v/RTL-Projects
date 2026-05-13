module new_selective_one (
	input [4-1:0] inX, // N-bit 'x' input 
	input compl_x,
	output reg [4-1:0] outX // N-bit 'x output
);
	always @(*) begin
		if (compl_x) begin
			// Bit-wise XOR
			outX = inX ^ 4'b1111;
		end
		else begin
			// Push input into output
			outX = inX;
		end
	end
endmodule
