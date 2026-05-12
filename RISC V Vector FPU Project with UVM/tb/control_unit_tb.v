`timescale 1ns/1ps
module Control_Unit_tb;
reg [6:0] opcode;
wire [2:0] alu_op;
wire jump, beq, bne, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write;

Control_Unit uut (
    .opcode(opcode),
    .alu_op(alu_op),
    .jump(jump),
    .beq(beq),
    .bne(bne),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .reg_dst(reg_dst),
    .mem_to_reg(mem_to_reg),
    .reg_write(reg_write)
);

initial begin
    opcode = 7'b0110011; #10; // R-type
    opcode = 7'b0010011; #10; // I-type
    opcode = 7'b0000011; #10; // Load
    opcode = 7'b0100011; #10; // Store
    opcode = 7'b1100011; #10; // Branch
    opcode = 7'b1101111; #10; // JAL
    opcode = 7'b0000000; #10; // Default
    $finish;
end
endmodule
