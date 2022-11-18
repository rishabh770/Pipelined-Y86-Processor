module memory_reg(
    input clk,
    input [2:0] e_stat,
    input [3:0] e_icode,
    input e_cnd,
    input [63:0] e_valE,
    input [63:0] e_valA,
    input [3:0] e_destE,
    input [3:0] e_destM,

    output reg [2:0] M_stat,
    output reg [3:0] M_icode,
    output reg M_cnd,
    output reg [63:0] M_valE,
    output reg [63:0] M_valA,
    output reg [3:0] M_destE,
    output reg [3:0] M_destM
);

always @(posedge clk)
begin
    M_stat = e_stat; //might be <= instead of =
    M_icode = e_icode;
    M_cnd = e_cnd;
    M_valE = e_valE;
    M_valA = e_valA;
    M_destE = e_destE;
    M_destM = e_destM;
end
endmodule