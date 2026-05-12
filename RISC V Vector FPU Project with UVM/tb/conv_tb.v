`timescale 1ns/1ps
module conv_tb;
reg [31:0] data_in;
reg [1:0] op_code;
wire [31:0] data_out;

conv uut (.data_in(data_in), .op_code(op_code), .data_out(data_out));

initial begin
    data_in = 32'h3F800000;
    op_code = 2'b00; #10;
    op_code = 2'b01; #10;
    op_code = 2'b10; #10;
    op_code = 2'b11; #10;
    $finish;
end
endmodule
