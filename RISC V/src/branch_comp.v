`timescale 1ns/1ps

module branch_comp #(
    parameter WIDTH = 32
)(
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    output wire             eq,
    output wire             lt_signed,
    output wire             lt_unsigned
);

    assign eq          = (a == b);
    assign lt_signed   = ($signed(a) < $signed(b));
    assign lt_unsigned = (a < b);

endmodule
