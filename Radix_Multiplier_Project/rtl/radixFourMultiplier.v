module radixFourMultiplier(
	input clk, 
	input [63:0] a,
	input [63:0] x,
	output wire [127:0] p
);

	// Declare wires
	wire [64:0] muxOneOut, muxTwoOut; // k + 1 due to the shifts
	wire [64:0] CSA1Sum, CSA1Carry; // 65 bit
	wire [65:0] CSA2Sum, CSA2Carry; // 66 bit
	wire [1:0] twoBitAdderResult;
	wire [63:0] shiftedMultiplier;
	wire [63:0] upperProduct;
	wire FFCarry;
	wire nextFFCarry;
	reg [63:0] currX,
	reg [127:0] currP;
	reg [31:0] counter;

	wire lastIter = (counter == 32);

	// MUXs for 0a = 00, 1a = 01, 2a = 10, 3a = 11
	muxoneA moa(
		.a(a), // for 0a or 1a selection
		.xi(x[0]),
		.out(muxOneOut)
	);
	muxtwoA mta(
		.a(a), // for 0a or 2a selection
		.xiOne(x[1]),
		.out(muxTwoOut)
	);

	carrySaveOne CSA1(
		.oneA(muxOneOut),
		.twoA(muxTwoOut),
		.p(!!!!!!!!!!!!),
		.sum(CSA1Sum),
		.carry(CSA1Carry)
	);
	carrySaveTwo CSA2(
		.sumIn(CSA1Sum),
		.cIn(CSA1Carry),
		.c(!!!!!!!!!!),
		.sum(CSA2Sum),
		.carry(CSA2Carry),
	);
	radixTwoAdder rta(
		.sumIn(CSA2Sum[1:0]),
		.cIn(CSA2Carry[1]),
		.FFCarry(FFCarry),
		.out(twoBitAdderResult),
		.FFCout(nextFFCarry)
	);
	radixFF(
		.clk(clk),
		.d(nextFFCarry),
		.q(FFCarry)
	);

	assign shiftedMultiplier = {twoBitAdderResult, currX[63:2]};

	carryLook cla(
		.x(CSA2Sum[65:2]),
		.y(CSA2Carry[65:2]),
		.cin(1'b0),
		.sum(upperProduct),
		.gout(),
		.pout(),
	);

	always @(posedge clk) begin
		if(!lastIter) begin
			currX = shiftedMultiplier;
			currP = {CSA2Sum[65:2], CSA2Carry[65:2]};
			counter = counter + 1;
		end
		else begin
			p = {upperProduct, shiftedMultiplier};
		end
	end

endmodule

