module fpu_top(
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] radicand,
    input [1:0] group_sel,
    input [2:0] op_code,
    output reg [31:0] result,
    output reg status_flag
);
wire [31:0] addmul_result;
wire [31:0] divsqrt_result;
wire divsqrt_error;
wire noncomp_result;
wire [31:0] conv_result;

addmul u_addmul (
    .a(a),
    .b(b),
    .c(c),
    .op_code(op_code[1:0]),
    .result(addmul_result)
);

divsqrt u_divsqrt (
    .dividend(a),
    .divisor(b),
    .radicand(radicand),
    .op_code(op_code[0]),
    .result(divsqrt_result),
    .error(divsqrt_error)
);

noncomp u_noncomp (
    .a(a),
    .b(b),
    .op_code(op_code),
    .result(noncomp_result)
);

conv u_conv (
    .data_in(a),
    .op_code(op_code[1:0]),
    .data_out(conv_result)
);

always @(*) begin
    status_flag = 1'b0;
    case (group_sel)
        2'b00: result = addmul_result;
        2'b01: begin
            result = divsqrt_result;
            status_flag = divsqrt_error;
        end
        2'b10: result = {31'd0, noncomp_result};
        2'b11: result = conv_result;
        default: result = 32'd0;
    endcase
end
endmodule
