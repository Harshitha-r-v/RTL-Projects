module carrySaveOne (
	input [64:0] oneA, 
	input [64:0] twoA, 
	input [63:0] p,
	output reg [64:0] sum,
	output reg [64:0] carry
);
	integer i;

	always @(*) begin
        	for (i = 0; i < 65; i = i + 1) begin
            		radixFA fa(
                		.a(oneA[i]), 
                		.b(twoA[i]), 
                		.cin(p[i]), 
                		.sum(sum[i]), 
                		.cout(carry[i+1])
            		);
        	end

		carry[0] = 1'b0;
		sum[64] = twoA[64];
	end

endmodule
