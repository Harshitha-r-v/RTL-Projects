module carryLooktb(
);
// Declare
reg [63:0] x, y;
    reg cin;
    wire [63:0] sum;
    wire gout, pout;

    // Instantiate the 64-bit CLA
    carryLook cla(.x(x), .y(y), .cin(cin), .sum(sum), 
        .gout(gout), .pout(pout));

initial begin
        x = 64'h0000000000000001;
        y = 64'h0000000000000001;
        cin = 1'b0;
        #50;
        $display("Test 1: Sum = %h, Gout = %b, Pout = %b", sum, gout, pout);

        x = 64'h0000000000000001;
        y = 64'h0000000000000001;
        cin = 1'b1;
        #50;
        $display("Test 2: Sum = %h, Gout = %b, Pout = %b", sum, gout, pout);

        x = 64'h00000000FFFFFFFF;
        y = 64'h00000000FFFFFFFF;
        cin = 1'b0;
        #50;
        $display("Test 3: Sum = %h, Gout = %b, Pout = %b", sum, gout, pout);

        x = 64'hFFFFFFFFFFFFFFFF;
        y = 64'hFFFFFFFFFFFFFFFF;
         cin = 1'b0;
        #50;
        $display("Test 4: Sum = %h, Gout = %b, Pout = %b", sum, gout, pout);

        x = 64'hFFFFFFFFFFFFFFFF;
        y = 64'hFFFFFFFFFFFFFFFF;
       cin = 1'b1;
       #50;
        $display("Test 5: Sum = %h, Gout = %b, Pout = %b", sum, gout, pout);

end
endmodule