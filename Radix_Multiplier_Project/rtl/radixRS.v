module radixRS(
	input [63:0] x,
	input [1:0] newMSB,
	output reg [63:0] out
);

	always @(*) begin
		out = {newMSB, x[63:2]};
	end
endmodule
