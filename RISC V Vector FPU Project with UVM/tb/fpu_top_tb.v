`timescale 1ns/1ps
module fpu_top_tb;
reg [31:0] a, b, c, radicand;
reg [1:0] group_sel;
reg [2:0] op_code;
wire [31:0] result;
wire status_flag;

fpu_top uut (
    .a(a),
    .b(b),
    .c(c),
    .radicand(radicand),
    .group_sel(group_sel),
    .op_code(op_code),
    .result(result),
    .status_flag(status_flag)
);

initial begin
    a = 32'd20; b = 32'd5; c = 32'd3; radicand = 32'd144;

    group_sel = 2'b00; op_code = 3'b000; #10; // ADDMUL add
    group_sel = 2'b00; op_code = 3'b011; #10; // ADDMUL FMA-style
    group_sel = 2'b01; op_code = 3'b000; #10; // DIVSQRT division
    group_sel = 2'b01; op_code = 3'b001; #10; // DIVSQRT sqrt
    group_sel = 2'b10; op_code = 3'b010; #10; // NONCOMP less-than
    group_sel = 2'b11; op_code = 3'b000; #10; // CONV

    $finish;
end
endmodule
