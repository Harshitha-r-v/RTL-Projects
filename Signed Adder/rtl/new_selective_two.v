module new_selective_two(
	input [4-1:0] sum, 
	input compl,
	output reg [4-2:0] s // output is the last significant bits
);
	// Declare reg and wire
	reg [4-1:0] sumBit;
	reg [4-1:0] sumOne;
	reg discard; 

	always @(*) begin
		if (compl) begin
			// Bit-wise XOR the N-bit input
			sumBit = sum ^ 4'b1111;

			// Add one
			sumOne = sumBit + 1;

			// Discard the MSB
			{discard, s} = sumOne;
		end
		else begin
			// Discard the MSB
			{discard, s} = sum;
		end
		
	end

endmodule
