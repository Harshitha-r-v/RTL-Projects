module ALU_Control_Unit(
    input  [6:0] opcode,
    input  [2:0] funct3,
    input  [6:0] funct7,
    output reg [4:0] alu_ctrl
);
always @(*) begin
    case (opcode)
        7'b0110011: begin // R-type
            case ({funct7, funct3})
                {7'b0000000, 3'b000}: alu_ctrl = 5'b00000; // ADD
                {7'b0100000, 3'b000}: alu_ctrl = 5'b00001; // SUB
                {7'b0000000, 3'b111}: alu_ctrl = 5'b00100; // AND
                {7'b0000000, 3'b110}: alu_ctrl = 5'b00101; // OR
                {7'b0000000, 3'b100}: alu_ctrl = 5'b00110; // XOR
                default:              alu_ctrl = 5'b00000;
            endcase
        end
        7'b0010011: begin // I-type arithmetic
            case (funct3)
                3'b000: alu_ctrl = 5'b00000; // ADDI
                3'b111: alu_ctrl = 5'b00100; // ANDI
                3'b110: alu_ctrl = 5'b00101; // ORI
                3'b100: alu_ctrl = 5'b00110; // XORI
                default: alu_ctrl = 5'b00000;
            endcase
        end
        default: alu_ctrl = 5'b00000;
    endcase
end
endmodule
