module new_adder (
	input [4-1:0] inX,
	input [4-1:0] inY,
	input c_in,
	output reg [4-1:0] sum,
	output reg c_out, sign
);
	always @(*) begin
		// Add the two inputs and carry-in
		{c_out, sum} = inX + inY + c_in;
		
		// Assign sign with the MSB
		sign = sum[4-1];
	end
endmodule
