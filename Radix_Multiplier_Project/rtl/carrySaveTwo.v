module carrySaveTwo(
	input [64:0] sumIn, 
	input [64:0] cIn, 
	input [63:0] c,
	output reg [65:0] sum,
	output reg [65:0] carry
);

	genvar i;

	always @(*) begin
		generate
			for (i = 0; i < 64; i = i + 1) begin : CSA_STAGE
            			radixFA fa (
                			.a(sumIn[i]), 
                			.b(cIn[i]), 
                			.cin(c[i]), 
                			.sum(sum[i]), 
                			.cout(carry[i+1])
            			);
        		end
		endgenerate

		carry[0] = 1'b0;
		sum[64] = sumIn[64];
		sum[65] = 1'b0;
		carry[65] = 1'b0;
		
	end

endmodule
