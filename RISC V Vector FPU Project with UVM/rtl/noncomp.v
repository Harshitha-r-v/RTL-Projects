module noncomp(
    input [31:0] a,
    input [31:0] b,
    input [2:0] op_code,
    output reg result
);
always @(*) begin
    case (op_code)
        3'b000: result = (a == b);                  // EQ
        3'b001: result = (a != b);                  // NEQ
        3'b010: result = ($signed(a) < $signed(b)); // LT
        3'b011: result = ($signed(a) > $signed(b)); // GT
        3'b100: result = (a < b);                   // LTU
        3'b101: result = (a > b);                   // GTU
        default: result = 1'b0;
    endcase
end
endmodule
