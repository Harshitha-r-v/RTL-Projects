module addmul(
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [1:0] op_code,
    output reg [31:0] result
);
always @(*) begin
    case (op_code)
        2'b00: result = a + b;          // ADD
        2'b01: result = a - b;          // SUB
        2'b10: result = a * b;          // MUL lower 32 bits
        2'b11: result = (a * b) + c;    // FMA-style integer behavior
        default: result = 32'd0;
    endcase
end
endmodule
