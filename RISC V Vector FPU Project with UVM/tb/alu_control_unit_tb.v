`timescale 1ns/1ps
module ALU_Control_Unit_tb;
reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
wire [4:0] alu_ctrl;

ALU_Control_Unit uut (
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .alu_ctrl(alu_ctrl)
);

initial begin
    opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0000000; #10; // ADD
    opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0100000; #10; // SUB
    opcode = 7'b0110011; funct3 = 3'b111; funct7 = 7'b0000000; #10; // AND
    opcode = 7'b0110011; funct3 = 3'b110; funct7 = 7'b0000000; #10; // OR
    opcode = 7'b0010011; funct3 = 3'b100; funct7 = 7'b0000000; #10; // XORI
    $finish;
end
endmodule
