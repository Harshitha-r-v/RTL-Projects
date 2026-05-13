module sixteenCLA(
	input [15:0] x, y,
	input cin,
	output wire [15:0] sum,
	output wire gout, pout
);
	
	// Declare wires
    	wire [3:1] c;
    	wire [3:0] g, p;

    	// Instantiate four 4-bit adders
    	fourBitAdder a0(.x(x[3:0]), .y(y[3:0]), .cin(cin), .sum(sum[3:0]), .gout(g[0]), .pout(p[0]));
    
    	fourBitAdder a1(.x(x[7:4]), .y(y[7:4]), .cin(c[1]), .sum(sum[7:4]), .gout(g[1]), .pout(p[1]));
    
    	fourBitAdder a2(.x(x[11:8]), .y(y[11:8]), .cin(c[2]), .sum(sum[11:8]), .gout(g[2]), .pout(p[2]));
    
    	fourBitAdder a3(.x(x[15:12]), .y(y[15:12]), .cin(c[3]), .sum(sum[15:12]), .gout(g[3]), .pout(p[3]));
    
    	// Instantiate the 4-bit lookahead carry generator
    	fourBitGenerator g0(.cin(cin), .p(p), .g(g),.pout(pout), .gout(gout),.c(c));
endmodule
