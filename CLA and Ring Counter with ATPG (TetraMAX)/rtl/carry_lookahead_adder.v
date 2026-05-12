`include "module_full_adder.v"
module carry_lookahead_adder (
    input clk,
    input [15:0] i_add1,
    input [15:0] i_add2,
    output [16:0] o_result
);
wire [16:0] w_C;
wire [15:0] w_G, w_P, w_SUM;
assign w_C[0] = 1'b0;

genvar i;
generate
for (i = 0; i < 16; i = i + 1) begin
    module_full_adder fa (
        .i_bit1(i_add1[i]),
        .i_bit2(i_add2[i]),
        .i_carry(w_C[i]),
        .o_sum(w_SUM[i]),
        .o_carry()
    );
    assign w_G[i] = i_add1[i] & i_add2[i];
    assign w_P[i] = i_add1[i] | i_add2[i];
    assign w_C[i+1] = w_G[i] | (w_P[i] & w_C[i]);
end
endgenerate

assign o_result = {w_C[16], w_SUM};
endmodule
