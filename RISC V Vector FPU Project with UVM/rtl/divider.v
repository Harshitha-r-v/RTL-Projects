module divider(
    input  [31:0] dividend,
    input  [31:0] divisor,
    output reg [31:0] quotient,
    output reg [31:0] remainder,
    output reg divide_by_zero
);
always @(*) begin
    if (divisor == 32'd0) begin
        quotient       = 32'hFFFFFFFF;
        remainder      = dividend;
        divide_by_zero = 1'b1;
    end else begin
        quotient       = dividend / divisor;
        remainder      = dividend % divisor;
        divide_by_zero = 1'b0;
    end
end
endmodule
