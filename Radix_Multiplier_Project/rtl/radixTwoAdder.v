module radixTwoAdder(
	input [1:0] sumIn,
	input cIn,
	input FFCarry,
	output reg [1:0] out, 
	output reg FFCout 
);

	always @(*) begin
		{FFCout, out} = sumIn + {cIn, FFCarry};
	end

endmodule
