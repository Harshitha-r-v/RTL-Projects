module ring_counter (
    input clk,
    input rst,
    output [7:0] out
);
reg [7:0] temp;

always @(posedge clk) begin
    if (rst)
        temp <= 8'b00000001;
    else
        temp <= {temp[6:0], temp[7]};
end

assign out = temp;
endmodule
