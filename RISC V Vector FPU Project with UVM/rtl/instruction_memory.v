module instruction_memory #(
    parameter DEPTH = 256
)(
    input [31:0] addr,
    output [31:0] instruction
);
reg [31:0] imem [0:DEPTH-1];

initial begin
    imem[0] = 32'h00000013; // NOP
    imem[1] = 32'h00100093; // Example instruction
    imem[2] = 32'h00200113; // Example instruction
end

assign instruction = imem[addr[9:2]];
endmodule
