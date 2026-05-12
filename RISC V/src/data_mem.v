`timescale 1ns/1ps

module data_mem #(
    parameter WIDTH = 32,
    parameter ADDRESS = 10
)(
    input  wire                 clk,
    input  wire                 reset_n,
    input  wire                 mem_read,
    input  wire                 mem_write,
    input  wire [ADDRESS-1:0]   addr,
    input  wire [WIDTH-1:0]     data_w,
    output wire [WIDTH-1:0]     data_r
);

    reg [WIDTH-1:0] dmem [0:(1<<ADDRESS)-1];
    integer i;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (i = 0; i < (1<<ADDRESS); i = i + 1)
                dmem[i] <= {WIDTH{1'b0}};
        end else if (mem_write) begin
            dmem[addr] <= data_w;
        end
    end

    assign data_r = mem_read ? dmem[addr] : {WIDTH{1'b0}};

endmodule
