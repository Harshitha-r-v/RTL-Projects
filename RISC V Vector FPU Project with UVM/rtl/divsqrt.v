module divsqrt(
    input [31:0] dividend,
    input [31:0] divisor,
    input [31:0] radicand,
    input op_code, // 0 = divide, 1 = sqrt
    output reg [31:0] result,
    output reg error
);
integer i;
reg [31:0] root;

always @(*) begin
    error = 1'b0;
    result = 32'd0;
    root = 32'd0;

    if (op_code == 1'b0) begin
        if (divisor == 32'd0) begin
            result = 32'hFFFFFFFF;
            error = 1'b1;
        end else begin
            result = dividend / divisor;
        end
    end else begin
        for (i = 0; i < 65536; i = i + 1) begin
            if ((i*i) <= radicand)
                root = i[31:0];
        end
        result = root;
    end
end
endmodule
