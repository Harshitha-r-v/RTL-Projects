module new_twos_complement(
	input [4-2:0] inOne, // Takes in the last significant bits of'x' or 'y' input
	output reg [4-1:0] outOne // Gives N-bit output of 2's complement

);
	// Declare registers for conversion to 2's complement
	reg [4-1:0] append;
	reg [4-1:0] complement;

	always @(*) begin
		// Append '0' to the (N-1)-bit input
		append = {1'b0, inOne};

		// Take the complement of the N-bit input
		complement = ~append;

		// Add one
		outOne = complement + 1;
		//outOne = append + 1;
	end
	
endmodule
