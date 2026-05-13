module new_signed_magnitude(
	input [4-2:0] x, y, // holds the significant bits
	input sign_x, sign_y, add_sub,
	output wire [4-2:0] s,
	output wire sign_s, overflow
);
	// Declare wires
	wire [4-1:0] preX; // From preprocessor to first selective
	wire [4-1:0] preY; // From preprocessor to adder
	wire compl_x; // From control to first selective 
	wire [4-1:0] sc_x; // From first selective to adder
	wire c_in; // From control to adder
	wire [4-1:0] sumResult; // From adder to second selective
	wire c_out; // From adder to control
	wire sign; // From adder to control
	wire compl_s; // From control to second selective
	
	
	// Call preprocessor, one for each input
	// Call first selective complement
	// Call adder
	// Call control
	// Call second selective complement
	new_twos_complement ntcX(.inOne(x), .outOne(preX));
	new_twos_complement ntcY(.inOne(y), .outOne(preY));
	new_selective_one nscOne(.inX(preX), .compl_x(compl_x), .outX(sc_x));
	new_adder nadd(.inX(sc_x), .inY(preY), .c_in(c_in), .sum(sumResult), .c_out(c_out), .sign(sign));
	new_control ncon(	.sign_x(sign_x), .sign_y(sign_y), .add_sub(add_sub),
				.c_out(c_out), .sign(sign), .c_in(c_in),
				.compl_x(compl_x), .compl_s(compl_s),
				.sign_s(sign_s), .overflow(overflow));
	new_selective_two nscTwo(.sum(sumResult), .compl(compl_s), .s(s));
	
endmodule
