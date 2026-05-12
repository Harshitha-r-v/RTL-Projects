`timescale 1ns/1ps

module control_unit(
    input  wire [31:0] instr,
    input  wire        br_eq,
    input  wire        br_lt,
    output reg         pc_sel,
    output reg         reg_write,
    output reg         mem_read,
    output reg         mem_write,
    output reg         alu_src,
    output reg  [2:0]  alu_op,
    output reg  [1:0]  wb_sel
);

    wire [6:0] opcode = instr[6:0];
    wire [2:0] funct3 = instr[14:12];
    wire [6:0] funct7 = instr[31:25];

    localparam OP_R     = 7'b0110011;
    localparam OP_I     = 7'b0010011;
    localparam OP_LOAD  = 7'b0000011;
    localparam OP_STORE = 7'b0100011;
    localparam OP_BRANCH= 7'b1100011;

    localparam ADD = 3'b000;
    localparam SUB = 3'b001;
    localparam SLL = 3'b010;
    localparam XOR = 3'b011;
    localparam SRL = 3'b100;
    localparam SRA = 3'b101;
    localparam OR  = 3'b110;
    localparam AND = 3'b111;

    always @(*) begin
        pc_sel    = 1'b0;
        reg_write = 1'b0;
        mem_read  = 1'b0;
        mem_write = 1'b0;
        alu_src   = 1'b0;
        alu_op    = ADD;
        wb_sel    = 2'b00;

        case (opcode)
            OP_R: begin
                reg_write = 1'b1;
                alu_src   = 1'b0;
                wb_sel    = 2'b00;
                case (funct3)
                    3'b000: alu_op = funct7[5] ? SUB : ADD;
                    3'b001: alu_op = SLL;
                    3'b100: alu_op = XOR;
                    3'b101: alu_op = funct7[5] ? SRA : SRL;
                    3'b110: alu_op = OR;
                    3'b111: alu_op = AND;
                    default: alu_op = ADD;
                endcase
            end
            OP_I: begin
                reg_write = 1'b1;
                alu_src   = 1'b1;
                wb_sel    = 2'b00;
                alu_op    = ADD;
            end
            OP_LOAD: begin
                reg_write = 1'b1;
                mem_read  = 1'b1;
                alu_src   = 1'b1;
                wb_sel    = 2'b01;
                alu_op    = ADD;
            end
            OP_STORE: begin
                mem_write = 1'b1;
                alu_src   = 1'b1;
                alu_op    = ADD;
            end
            OP_BRANCH: begin
                case (funct3)
                    3'b000: pc_sel = br_eq;  // BEQ
                    3'b001: pc_sel = !br_eq; // BNE
                    3'b100: pc_sel = br_lt;  // BLT
                    default: pc_sel = 1'b0;
                endcase
            end
            default: begin
                pc_sel = 1'b0;
            end
        endcase
    end

endmodule
