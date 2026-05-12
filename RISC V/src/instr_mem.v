`timescale 1ns/1ps

module instr_mem #(
    parameter WIDTH = 32,
    parameter ADDRESS = 8
)(
    input  wire [ADDRESS-1:0] addr,
    output reg  [WIDTH-1:0]   instr
);

    always @(*) begin
        case (addr)
            8'd0: instr = 32'h00000013; // NOP: addi x0, x0, 0
            8'd1: instr = 32'h00100093; // addi x1, x0, 1
            8'd2: instr = 32'h00200113; // addi x2, x0, 2
            8'd3: instr = 32'h002081B3; // add  x3, x1, x2
            default: instr = 32'h00000013;
        endcase
    end

endmodule
