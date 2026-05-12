module Control_Unit(
    input  [6:0] opcode,
    output reg [2:0] alu_op,
    output reg jump,
    output reg beq,
    output reg bne,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg reg_dst,
    output reg mem_to_reg,
    output reg reg_write
);
always @(*) begin
    // Defaults
    reg_dst    = 1'b0;
    alu_src    = 1'b0;
    mem_to_reg = 1'b0;
    reg_write  = 1'b0;
    mem_read   = 1'b0;
    mem_write  = 1'b0;
    beq        = 1'b0;
    bne        = 1'b0;
    alu_op     = 3'b000;
    jump       = 1'b0;

    case (opcode)
        7'b0110011: begin // R-type
            reg_dst   = 1'b1;
            reg_write = 1'b1;
            alu_op    = 3'b010;
        end
        7'b0010011: begin // I-type arithmetic
            alu_src   = 1'b1;
            reg_write = 1'b1;
            alu_op    = 3'b000;
        end
        7'b0000011: begin // Load
            alu_src    = 1'b1;
            mem_to_reg = 1'b1;
            reg_write  = 1'b1;
            mem_read   = 1'b1;
            alu_op     = 3'b000;
        end
        7'b0100011: begin // Store
            alu_src   = 1'b1;
            mem_write = 1'b1;
            alu_op    = 3'b000;
        end
        7'b1100011: begin // Branch
            beq    = 1'b1;
            bne    = 1'b1;
            alu_op = 3'b001;
        end
        7'b1101111: begin // JAL
            jump      = 1'b1;
            reg_write = 1'b1;
        end
        7'b1100111: begin // JALR
            jump      = 1'b1;
            alu_src   = 1'b1;
            reg_write = 1'b1;
        end
        default: begin
            alu_op = 3'b000;
        end
    endcase
end
endmodule
