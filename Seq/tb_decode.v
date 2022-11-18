`include "fetch.v"

module tb_decode();
reg clk;
wire [4:1]icode;
wire [4:1]ifun;
reg [64:1]pc;
wire [4:1] rA;
wire [4:1] rB;
wire [64:1] valC;
wire [64:1] valP;
reg [64:1] valE;
reg [64:1] valM;
wire [64:1] valA;
wire [64:1] valB;
wire [64:1] register_mem1;
wire [64:1] register_mem2;
wire [64:1] register_mem3;
wire [64:1] register_mem4;
wire [64:1] register_mem5;
wire [64:1] register_mem6;
wire [64:1] register_mem7;
wire [64:1] register_mem8;
wire [64:1] register_mem9;
wire [64:1] register_mem10;
wire [64:1] register_mem11;
wire [64:1] register_mem12;
wire [64:1] register_mem13;
wire [64:1] register_mem14;
wire [64:1] register_mem15;


fetch fetch_block(.clk(clk),.pc(pc),.icode(icode),.ifun(ifun),.rA(rA),
              .rB(rB),.valC(valC),.valP(valP));

decode decode_block(.clk(clk),.icode(icode),.rA(rA),.rB(rB),.valE(valE),.valM(valM),
                .valA(valA),.valB(valB),.register_mem1(register_mem1),.register_mem2(register_mem2),
                .register_mem3(register_mem3),.register_mem4(register_mem4),.register_mem5(register_mem5),
                .register_mem6(register_mem6),.register_mem7(register_mem7),.register_mem8(register_mem8),
                .register_mem9(register_mem9),.register_mem10(register_mem10),.register_mem11(register_mem11),
                .register_mem12(register_mem12),.register_mem13(register_mem13),.register_mem14(register_mem14),
                .register_mem15(register_mem15));

initial begin 
    clk=0;
    pc=64'd0;
    valE = 64'd5;
    valM = 64'd10;
    
    #15 clk=~clk;pc=64'd32;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    #15 clk=~clk;pc=valP;
    #15 clk=~clk;
    
  end 
  
  initial begin
		$monitor("clk=%d pc=%d icode=%b ifun=%b rA=%d rB=%d,valC=%d,valP=%d valE=%d valM=%d valA=%d valB=%d register_mem3=%d \n",
                  clk,pc,icode,ifun,rA,rB,valC,valP,valE,valM,valA,valB,register_mem3);
    end


endmodule