module limited_carry_adder (
	input [1:0] x_i, // 2's complement inputs 
	input [1:0] y_i, 
	input e_i,
	input [1:0] t_i,
	output reg [1:0] s_i, // 2's complement output
	output reg e_plus,
	output reg [1:0] t_plus
);

	// Declare
	reg [1:0] p_i;   // positional sum
	reg [1:0] w_i;   // interim sum
	
	always @(*) begin

		// Calculate positional sum by adding inputs
		// Check for special case: +2
		if(x_i == 2'b01 && y_i == 2'b01) begin
		// 2 = 2*1 + 0 = 2 + 0 = 2
			e_plus = 1; // high
			w_i = 2'b00; // 0
			t_plus = 2'b01; // 1 
		end
		else begin
			// Compute positional sum
			p_i = x_i + y_i;

			// If-else cases to see the value of the positional sum
			// 0 = 2 * 0 + 0 = 0 + 0 = 0
			if(p_i == 2'b00) begin // 0
				e_plus = 0; // low
				w_i = 2'b00; // 0
				t_plus = 2'b00; // 0
			end
			else if(p_i == 2'b01) begin // 1
				// Check the incoming estimate
				// 1 = 2 * 1 - 1 = 2 - 1 = 1
				if(e_i == 1) begin // high
					e_plus = 1; // high
					w_i = 2'b11; // -1
					t_plus = 2'b01; // 1
				end
				// 1 = 2 * 0 + 1 = 0 + 1 = 1
				else begin // low
					e_plus = 1; // high
					w_i = 2'b01; // 1
					t_plus = 2'b00; // 0
				end
			end
			else if(p_i == 2'b11) begin // -1
				// Check the incoming estimate
				// -1 = 2 * 0 - 1 = 0 - 1 = -1
				if(e_i == 1) begin // high
					e_plus = 0; // low
					w_i = 2'b11; // -1
					t_plus = 2'b00; // 0
				end
				// -1 = 2 * -1 + 1 = -2 + 1 = -1
				else begin // low
					e_plus = 0; // low
					w_i = 2'b01; // 1
					t_plus = 2'b11; // -1
				end
			end
			else begin // -2
				e_plus = 0;
				w_i = 2'b00;
				t_plus = 2'b11;
			end
		end

		// Compute the sum by adding interim and transfer sum
		s_i = w_i + t_i;
	end

endmodule
