module execute_reg(
    input clk,
    input [2:0] d_stat,
    input [3:0] d_icode,
    input [3:0] d_ifun,
    input [63:0] d_valC,
    input [63:0] d_valA,
    input [63:0] d_valB,
    input [3:0] d_destE,
    input [3:0] d_destM,
    input [3:0] d_srcA,
    input [3:0] d_srcB,

    output reg [2:0] E_stat,
    output reg [3:0] E_icode,
    output reg [3:0] E_ifun,
    output reg [63:0] E_valC,
    output reg [63:0] E_valA,
    output reg [63:0] E_valB,
    output reg [3:0] E_destE,
    output reg [3:0] E_destM,
    output reg [3:0] E_srcA,  //use?
    output reg [3:0] E_srcB   //use?
);

always @(posedge clk)
begin
    E_stat = d_stat; //might be <= instead of =
    E_icode = d_icode;
    E_ifun = d_ifun;
    E_valC = d_valC;
    E_valA = d_valA;
    E_valB = d_valB;
    E_destE = d_destE;
    E_destM = d_destM;
    E_srcA = d_srcA;
    E_srcB = d_srcB;
end
endmodule