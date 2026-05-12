module ALU(
    input  [31:0] a,
    input  [31:0] b,
    input  [4:0]  alu_control,
    output reg [31:0] result,
    output zero
);
always @(*) begin
    case (alu_control)
        5'b00000: result = a + b;   // ADD
        5'b00001: result = a - b;   // SUB
        5'b00100: result = a & b;   // AND
        5'b00101: result = a | b;   // OR
        5'b00110: result = a ^ b;   // XOR
        default:  result = 32'h0;
    endcase
end
assign zero = (result == 32'h0);
endmodule
