module carryLook(
	input [63:0] x, y,
	input cin,
	output wire [63:0] sum,
	output wire gout, pout
);
	
	// Declare wires
    	wire [3:1] c;
    	wire [3:0] g, p;

    	// Instantiate four 4-bit adders
    	sixteenCLA a0(.x(x[15:0]), .y(y[15:0]), .cin(cin), .sum(sum[15:0]), .gout(g[0]), .pout(p[0]));
    
    	sixteenCLA a1(.x(x[31:16]), .y(y[31:16]), .cin(c[1]), .sum(sum[31:16]), .gout(g[1]), .pout(p[1]));
    
    	sixteenCLA a2(.x(x[47:32]), .y(y[47:32]), .cin(c[2]), .sum(sum[47:32]), .gout(g[2]), .pout(p[2]));
    
    	sixteenCLA a3(.x(x[63:48]), .y(y[63:48]), .cin(c[3]), .sum(sum[63:48]), .gout(g[3]), .pout(p[3]));
    
    	// Instantiate the 4-bit lookahead carry generator
    	fourBitGenerator g0(.cin(cin), .p(p), .g(g),.pout(pout), .gout(gout),.c(c));
endmodule
