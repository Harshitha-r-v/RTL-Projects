module conv(
    input [31:0] data_in,
    input [1:0] op_code,
    output reg [31:0] data_out
);
always @(*) begin
    case (op_code)
        2'b00: data_out = data_in;                 // float-to-float placeholder
        2'b01: data_out = data_in;                 // float-to-int placeholder
        2'b10: data_out = data_in;                 // int-to-float placeholder
        2'b11: data_out = {16'd0, data_in[15:0]};  // simple packing example
        default: data_out = 32'd0;
    endcase
end
endmodule
