`timescale 1ns/1ps
module noncomp_tb;
reg [31:0] a, b;
reg [2:0] op_code;
wire result;

noncomp uut (.a(a), .b(b), .op_code(op_code), .result(result));

initial begin
    a = 32'd10; b = 32'd10; op_code = 3'b000; #10; // EQ
    a = 32'd10; b = 32'd20; op_code = 3'b001; #10; // NEQ
    a = 32'd10; b = 32'd20; op_code = 3'b010; #10; // LT
    a = 32'd30; b = 32'd20; op_code = 3'b011; #10; // GT
    $finish;
end
endmodule
