module fourBitGenerator(
input cin,
input [3:0] p, g,
output reg pout, gout,
output reg [3:1] c
);
always@(*) begin
// Block signal generation
gout = g[3] | (g[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]);
pout = p[0] & p[1] & p[2] & p[3];

c[1] = g[0] | (p[0] & cin);
c[2] = g[1] | (g[0] & p[1]) | (p[0] & p[1] & cin);
c[3] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) | (p[0] & p[1] & p[2] & cin);

end
endmodule
