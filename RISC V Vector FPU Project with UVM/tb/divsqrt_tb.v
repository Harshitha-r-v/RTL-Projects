`timescale 1ns/1ps
module divsqrt_tb;
reg [31:0] dividend, divisor, radicand;
reg op_code;
wire [31:0] result;
wire error;

divsqrt uut (.dividend(dividend), .divisor(divisor), .radicand(radicand), .op_code(op_code), .result(result), .error(error));

initial begin
    dividend = 32'd100; divisor = 32'd5; radicand = 32'd144;
    op_code = 1'b0; #10; // DIV
    op_code = 1'b1; #10; // SQRT
    divisor = 32'd0; op_code = 1'b0; #10; // DIV by zero
    $finish;
end
endmodule
