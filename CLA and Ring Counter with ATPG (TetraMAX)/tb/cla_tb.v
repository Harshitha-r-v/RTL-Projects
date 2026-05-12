module cla_tb;
reg clk;
reg [15:0] a, b;
wire [16:0] result;

carry_lookahead_adder uut (.clk(clk), .i_add1(a), .i_add2(b), .o_result(result));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    a = 16'h0290; b = 16'h0918;
    #10;
    a = 16'h8089; b = 16'h8939;
    #10;
    a = 16'h0000; b = 16'hffff;
    #10;
    $finish;
end
endmodule
