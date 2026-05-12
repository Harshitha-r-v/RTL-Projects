module shifter(
    input [31:0] data_in,
    input [4:0] shift_amt,
    input [1:0] shift_type,
    output reg [31:0] data_out
);
always @(*) begin
    case (shift_type)
        2'b00: data_out = data_in << shift_amt;              // SLL
        2'b01: data_out = data_in >> shift_amt;              // SRL
        2'b10: data_out = $signed(data_in) >>> shift_amt;    // SRA
        default: data_out = data_in;
    endcase
end
endmodule
