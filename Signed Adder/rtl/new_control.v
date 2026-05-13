module new_control(
	input sign_x, sign_y, add_sub,
	input c_out, sign, // from adder module
	output reg c_in, // to adder
	output reg compl_x, // for sc_1
	output reg compl_s, // for sc_2
	output reg sign_s, // for sign_magnitude
	output reg overflow
);
	always @(*) begin
		
		// Fixing overflow
		overflow = 0;
		if ((sign_x == sign_y) && (sign != sign_x)) begin
			overflow = 1;
		end
				
		// Check four cases 
		if(sign_x == 0) begin
			
			// (+x) + (+y) or 
			// (+x) - (-y)
			// = x + y                         CASE ONE
			if (((sign_y == 0) && (add_sub == 0)) || ((sign_y == 1) && (add_sub == 1))) begin
				compl_x = 0; // Passes x input to adder
				c_in = 0;
				
				// Error case: received negative sign
				if(sign == 1) begin
					compl_s = 1;
					sign_s = 0;
				end
				else begin
					compl_s = 0;
					sign_s = 0;
				end
			end
			// (+x) + (-y) or
			// (+x) - (+y) 
			// = -(-x + y)                     CASE TWO
			else begin
				compl_x = 1; // Bit-wise x-input
				c_in = 1;
				sign_s = sign;
				// Error case
				if (sign == 1) begin
					compl_s = 1;
				end
				else begin
					compl_s = 0;
				end		
			end
		end
		else begin
			// (-x) + (+y) or
			// (-x) - (-y)
			// = -x + y                        CASE THREE
			if (((sign_y == 0) && (add_sub == 0)) || ((sign_y == 1) && (add_sub == 1))) begin
				compl_x = 1;
				c_in = 1;
				sign_s = ~sign;
				
				if(sign == 1) begin
					compl_s = 1;
				end
				else begin
					compl_s = 0;
				end
			end
			// (-x) + (-y) or
			// (-x) - (+y)
			// = -(x + y)                      CASE FOUR
			else begin
				compl_x = 0;
				c_in = 0;
				// Error case: received positive sign
				if(sign == 0) begin
					compl_s = 0;
					sign_s = 1;
				end
				else begin
					compl_s = 1;
					sign_s = 1;
				end
			end
		end
	end

endmodule
