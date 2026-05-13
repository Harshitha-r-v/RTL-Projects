module BSD(
	input [1:0] x5, x4, x3, x2, x1, x0,
	input [1:0] y5, y4, y3, y2, y1, y0,
	output wire [1:0] s5, s4, s3, s2, s1, s0
);

	// Declare wires
	wire e6, e5, e4, e3, e2, e1;
	wire [1:0] t6, t5, t4, t3, t2, t1;

	limited_carry_adder lca0(
	.x_i(x0), .y_i(y0), .e_i(1), .t_i(2'b00), .s_i(s0), .e_plus(e1), .t_plus(t1)
	);
	limited_carry_adder lca1(
	.x_i(x1), .y_i(y1), .e_i(e1), .t_i(t1), .s_i(s1), .e_plus(e2), .t_plus(t2)
	);
	limited_carry_adder lca2(
	.x_i(x2), .y_i(y2), .e_i(e2), .t_i(t2), .s_i(s2), .e_plus(e3), .t_plus(t3)
	);
	limited_carry_adder lca3(
	.x_i(x3), .y_i(y3), .e_i(e3), .t_i(t3), .s_i(s3), .e_plus(e4), .t_plus(t4)
	);
	limited_carry_adder lca4(
	.x_i(x4), .y_i(y4), .e_i(e4), .t_i(t4), .s_i(s4), .e_plus(e5), .t_plus(t5)
	);
	limited_carry_adder lca5(
	.x_i(x5), .y_i(y5), .e_i(e5), .t_i(t5), .s_i(s5), .e_plus(e6), .t_plus(t6)
	);


endmodule
