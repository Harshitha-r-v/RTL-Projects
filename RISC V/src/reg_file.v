`timescale 1ns/1ps

module reg_file #(
    parameter WIDTH = 32,
    parameter ADDR_WIDTH = 5
)(
    input  wire                  clk,
    input  wire                  reset_n,
    input  wire                  reg_write,
    input  wire [ADDR_WIDTH-1:0] addr_a,
    input  wire [ADDR_WIDTH-1:0] addr_b,
    input  wire [ADDR_WIDTH-1:0] addr_d,
    input  wire [WIDTH-1:0]      data_d,
    output wire [WIDTH-1:0]      data_a,
    output wire [WIDTH-1:0]      data_b
);

    reg [WIDTH-1:0] rf [0:(1<<ADDR_WIDTH)-1];
    integer i;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (i = 0; i < (1<<ADDR_WIDTH); i = i + 1)
                rf[i] <= {WIDTH{1'b0}};
        end else if (reg_write && addr_d != 0) begin
            rf[addr_d] <= data_d;
        end
    end

    assign data_a = (addr_a == 0) ? {WIDTH{1'b0}} : rf[addr_a];
    assign data_b = (addr_b == 0) ? {WIDTH{1'b0}} : rf[addr_b];

endmodule
