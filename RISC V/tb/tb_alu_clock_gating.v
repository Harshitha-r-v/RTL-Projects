`timescale 1ns/1ps

module tb_alu_clock_gating;

    reg clk;
    reg reset_n;
    reg en;
    reg [2:0] sel_alu;
    reg [31:0] input_a;
    reg [31:0] input_b;
    wire [31:0] output_alu;

    alu_clock_gating dut(
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .sel_alu(sel_alu),
        .input_a(input_a),
        .input_b(input_b),
        .output_alu(output_alu)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset_n = 0;
        en = 0;
        sel_alu = 3'b000;
        input_a = 0;
        input_b = 0;

        #20;
        reset_n = 1;

        en = 1;
        input_a = 32'd10;
        input_b = 32'd5;

        sel_alu = 3'b000; #10; // ADD
        sel_alu = 3'b001; #10; // SUB
        sel_alu = 3'b011; #10; // XOR
        sel_alu = 3'b110; #10; // OR
        sel_alu = 3'b111; #10; // AND

        en = 0;
        input_a = 32'd100;
        input_b = 32'd20;
        sel_alu = 3'b000;
        #30;

        en = 1;
        #10;

        $finish;
    end

endmodule
