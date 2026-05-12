`timescale 1ns/1ps
module addmul_tb;
reg [31:0] a, b, c;
reg [1:0] op_code;
wire [31:0] result;

addmul uut (.a(a), .b(b), .c(c), .op_code(op_code), .result(result));

initial begin
    a = 32'd20; b = 32'd5; c = 32'd3;
    op_code = 2'b00; #10; // ADD
    op_code = 2'b01; #10; // SUB
    op_code = 2'b10; #10; // MUL
    op_code = 2'b11; #10; // FMA-style
    $finish;
end
endmodule
