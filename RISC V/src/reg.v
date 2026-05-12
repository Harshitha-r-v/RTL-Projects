`timescale 1ns/1ps

module reg_dff #(
    parameter WIDTH = 32
)(
    input  wire             clk,
    input  wire             reset_n,
    input  wire [WIDTH-1:0] d,
    output reg  [WIDTH-1:0] q
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            q <= {WIDTH{1'b0}};
        else
            q <= d;
    end

endmodule
