module new_signed_magnitude_tb(
);
	// Declare registers and wires 
	reg [4-2:0] x;
	reg [4-2:0] y;
	reg sign_x, sign_y, add_sub;
	wire [4-2:0] s;
	wire sign_s;
	wire overflow;

	new_signed_magnitude nsm(.s(s), .sign_s(sign_s), .overflow(overflow),
				.x(x), .y(y), .sign_x(sign_x), .sign_y(sign_y), .add_sub(add_sub));

	initial begin
		
		// Case 1: +1 + +1 = +2
		sign_x = 0; x = 3'b001;
		sign_y = 0; y = 3'b001;
		add_sub = 0;

		#50;

		$display("Case One");
		$display("Inputs: sign_x=%b, x=%b, add_sub=%b, sign_y=%b, y=%b\n", sign_x, x, add_sub, sign_y, y);
		$display("Outputs: overflow=%b, sign_s=%b, s=%b\n", overflow, sign_s, s);

		// Case 2: +4 - +5 = -1
		sign_x = 0; x = 3'b100;
		sign_y = 0; y = 3'b101;
		add_sub = 1;

		#50;

		$display("Case Two");
		$display("Inputs: sign_x=%b, x=%b, add_sub=%b, sign_y=%b, y=%b\n", sign_x, x, add_sub, sign_y, y);
		$display("Outputs: overflow=%b, sign_s=%b, s=%b\n", overflow, sign_s, s);

		// Case 3: -4 - -3 = +1
		sign_x = 1; x = 3'b100;
		sign_y = 1; y = 3'b011;
		add_sub = 1;

		#50;

		$display("Case Three");
		$display("Inputs: sign_x=%b, x=%b, add_sub=%b, sign_y=%b, y=%b\n", sign_x, x, add_sub, sign_y, y);
		$display("Outputs: overflow=%b, sign_s=%b, s=%b\n", overflow, sign_s, s);

		// Case 4: -3 + -2
		sign_x = 1; x = 3'b011;
		sign_y = 1; y = 3'b010;
		add_sub = 0;

		#50;

		$display("Case Four");
		$display("Inputs: sign_x=%b, x=%b, add_sub=%b, sign_y=%b, y=%b\n", sign_x, x, add_sub, sign_y, y);
		$display("Outputs: overflow=%b, sign_s=%b, s=%b\n", overflow, sign_s, s);

	end

endmodule
