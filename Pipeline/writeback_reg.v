module writeback_reg(
    input clk,
    input [2:0] m_stat,
    input [3:0] m_icode,
    input [63:0] m_valE,
    input [63:0] m_valM,
    input [3:0] m_destE,
    input [3:0] m_destM,

    output reg [2:0] W_stat,
    output reg [3:0] W_icode,
    output reg [63:0] W_valE,
    output reg [63:0] W_valM,
    output reg [3:0] W_destE,
    output reg [3:0] W_destM
);

always @(posedge clk)
begin
    W_stat = m_stat; //might be <= instead of =
    W_icode = m_icode;
    W_valE = m_valE;
    W_valM = m_valM;
    W_destE = m_destE;
    W_destM = m_destM;
end
endmodule