`timescale 1ns/1ps
module ALU_tb;
reg [31:0] a_tb, b_tb;
reg [4:0] alu_control_tb;
wire [31:0] result_tb;
wire zero_tb;

ALU uut (
    .a(a_tb),
    .b(b_tb),
    .alu_control(alu_control_tb),
    .result(result_tb),
    .zero(zero_tb)
);

initial begin
    a_tb = 32'hABCDE123;
    b_tb = 32'h54321000;

    alu_control_tb = 5'b00000; #10; // ADD
    alu_control_tb = 5'b00001; #10; // SUB
    alu_control_tb = 5'b00100; #10; // AND
    alu_control_tb = 5'b00101; #10; // OR
    alu_control_tb = 5'b00110; #10; // XOR

    $finish;
end
endmodule
