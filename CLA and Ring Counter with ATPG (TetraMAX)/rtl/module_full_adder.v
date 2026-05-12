module module_full_adder (
    input i_bit1,
    input i_bit2,
    input i_carry,
    output o_sum,
    output o_carry
);
wire w1, w2, w3;
assign w1 = i_bit1 ^ i_bit2;
assign w2 = w1 & i_carry;
assign w3 = i_bit1 & i_bit2;
assign o_sum   = w1 ^ i_carry;
assign o_carry = w2 | w3;
endmodule
