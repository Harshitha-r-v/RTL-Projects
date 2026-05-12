`timescale 1ns/1ps

module alu_no_clock_gating #(
    parameter WIDTH = 32
)(
    input  wire [2:0]        sel_alu,
    input  wire [WIDTH-1:0]  input_a,
    input  wire [WIDTH-1:0]  input_b,
    output reg  [WIDTH-1:0]  output_alu
);

    localparam ADD = 3'b000;
    localparam SUB = 3'b001;
    localparam SLL = 3'b010;
    localparam XOR = 3'b011;
    localparam SRL = 3'b100;
    localparam SRA = 3'b101;
    localparam OR  = 3'b110;
    localparam AND = 3'b111;

    always @(*) begin
        case (sel_alu)
            ADD: output_alu = input_a + input_b;
            SUB: output_alu = input_a - input_b;
            SLL: output_alu = input_a << input_b[4:0];
            XOR: output_alu = input_a ^ input_b;
            SRL: output_alu = input_a >> input_b[4:0];
            SRA: output_alu = $signed(input_a) >>> input_b[4:0];
            OR:  output_alu = input_a | input_b;
            AND: output_alu = input_a & input_b;
            default: output_alu = {WIDTH{1'b0}};
        endcase
    end

endmodule
