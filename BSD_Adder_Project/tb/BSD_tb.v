module BSD_tb(
);
	// Declare
	reg [1:0] x5, x4, x3, x2, x1, x0;
	reg [1:0] y5, y4, y3, y2, y1, y0;
	wire [1:0] s5, s4, s3, s2, s1, s0;

	BSD b1(.x0(x0),.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),
	       .y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),
	       .s0(s0),.s1(s1),.s2(s2),.s3(s3),.s4(s4),.s5(s5));

	initial begin
		x0 = 2'b00;  
    		y0 = 2'b01;           
   		#50;

 		$display("Digit 0");
 		$display(" x0=%b, y0=%b, s0=%b\n", x0, y0, s0);

		x1 = 2'b11;  
    		y1 = 2'b00;           
   		#50;

 		$display("Digit 1");
 		$display(" x1=%b, y1=%b, s1=%b\n", x1, y1, s1);

		x2 = 2'b00;  
    		y2 = 2'b11;           
   		#50;

 		$display("Digit 2");
 		$display(" x2=%b, y2=%b, s2=%b\n", x2, y2, s2);

		x3 = 2'b11;  
    		y3 = 2'b11;           
   		#50;

 		$display("Digit 3");
 		$display(" x3=%b, y3=%b, s3=%b\n", x3, y3, s3);

		x4 = 2'b01;  
    		y4 = 2'b00;           
   		#50;

 		$display("Digit 4");
 		$display(" x4=%b, y4=%b, s4=%b\n", x4, y4, s4);

		x5 = 2'b00;  
    		y5 = 2'b00;           
   		#50;

 		$display("Digit 5");
 		$display(" x5=%b, y5=%b, s5=%b\n", x5, y5, s5);

	end

endmodule
