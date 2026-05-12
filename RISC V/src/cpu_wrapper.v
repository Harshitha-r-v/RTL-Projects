`timescale 1ns/1ps

// Minimal educational wrapper showing how the major modules can be connected.
// Extend this file with full immediate generation and branch/jump logic for a complete CPU.
module cpu_wrapper(
    input wire clk,
    input wire reset_n
);

    reg [7:0] pc;
    wire [31:0] instr;

    instr_mem imem(
        .addr(pc),
        .instr(instr)
    );

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            pc <= 8'd0;
        else
            pc <= pc + 8'd1;
    end

endmodule
