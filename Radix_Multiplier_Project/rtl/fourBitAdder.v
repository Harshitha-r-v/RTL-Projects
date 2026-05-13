module fourBitAdder(
	input [3:0] x, y,
	input cin,
	output reg [3:0] sum,
	output reg gout, pout
);
	// Declare for intermediate carries
	reg [3:0] g, p;
    	reg [3:1] c;
	
	always @(*) begin
		// Calculate propogate signals
		p = x ^ y;

		// Caculate generate signals
		g = x & y;

		// Calculate intermediate carries
		c[1] = g[0] | (p[0] & cin);
     		c[2] = g[1] | (p[1] & c[1]);
     		c[3] = g[2] | (p[2] & c[2]);

		// Calculate sums
		sum[0] = p[0] ^ cin;
		sum[1] = p[1] ^ c[1];
		sum[2] = p[2] ^ c[2];
		sum[3] = p[3] ^ c[3];
		
		// Output Generate and Propogate 
		gout = g[3] | (g[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]);
		pout = p[0] & p[1] & p[2] & p[3];	
	
	end
endmodule
