`timescale 1ns/1ps
module comparator_tb;
reg [31:0] a, b;
wire eq, neq, lt, gt, le, ge;

comparator uut (.a(a), .b(b), .eq(eq), .neq(neq), .lt(lt), .gt(gt), .le(le), .ge(ge));

initial begin
    a = 32'd10; b = 32'd10; #10;
    a = 32'd5;  b = 32'd10; #10;
    a = 32'd20; b = 32'd10; #10;
    $finish;
end
endmodule
