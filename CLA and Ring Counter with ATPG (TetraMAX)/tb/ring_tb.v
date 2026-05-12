module ring_tb;
reg clk, rst;
wire [7:0] out;

ring_counter uut (.clk(clk), .rst(rst), .out(out));

initial clk = 0;
always #10 clk = ~clk;

initial begin
    rst = 1;
    #20 rst = 0;
    #200 $finish;
end
endmodule
