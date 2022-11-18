module decode_reg(
    input clk,
    input [2:0] f_stat,
    input [3:0] f_icode,
    input [3:0] f_ifun,
    input [63:0] f_valC,
    input [63:0] f_valP,
    input [3:0] f_rA,
    input [3:0] f_rB,

    output reg [2:0] D_stat,
    output reg [3:0] D_icode,
    output reg [3:0] D_ifun,
    output reg [63:0] D_valC,
    output reg [63:0] D_valP,
    output reg [3:0] D_rA,
    output reg [3:0] D_rB
);

always @(posedge clk)
begin
    D_stat = f_stat; //might be <= instead of =
    D_icode = f_icode;
    D_ifun = f_ifun;
    D_valC = f_valC;
    D_valP = f_valP;
    D_rA = f_rA;
    D_rB = f_rB;
end
endmodule