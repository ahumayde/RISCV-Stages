module ALU #(
    parameter D_WIDTH = 32
)(
    input  logic [2:0]         ALUctrl,
    input  logic [D_WIDTH-1:0] ALUop1,
    input  logic [D_WIDTH-1:0] ALUop2,
    output logic [D_WIDTH-1:0] ALUout,
    output logic               EQ
);

    always_comb begin
        EQ = (ALUop1 == ALUop2);
        case (ALUctrl)
            3'b000:    ALUout = ALUop1 + ALUop2;
            3'b001:    ALUout = ALUop1 - ALUop2;
            3'b010:    ALUout = ALUop1 & ALUop2;
            3'b011:    ALUout = ALUop1 | ALUop2;
            3'b100:    ALUout = {{31{1'b0}},{ALUop1 < ALUop2}};
            default:   ALUout = 32'b0;
        endcase
        $display("    New line    ");
        $display("ALU1", ALUop1);
        $display("ALU2", ALUop2);
    end

endmodule
