`include "fetch.v"
`include "decode.v"
`include "pc_update.v"
`include "execute.v"
`include "memory.v"

`timescale 1ns / 1ps
module processor();

reg clk;
reg [64:1]pc;
wire [64:1] valM;
wire [4:1]icode;
wire [4:1]ifun;
wire [4:1] rA;
wire [4:1] rB;
wire [64:1] valC;
wire [64:1] valP;
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
wire [64:1] valE;
wire  zf, sf, of;
wire cnd;
wire [64:1]new_pc;
wire [64:1]dram_val;

fetch fetch_block(.clk(clk),.pc(pc),.icode(icode),.ifun(ifun),.rA(rA),
              .rB(rB),.valC(valC),.valP(valP));

decode decode_block(.clk(clk), .cnd(cnd), .icode(icode),.rA(rA),.rB(rB),.valE(valE),.valM(valM),
                .valA(valA),.valB(valB),.register_mem1(register_mem1),.register_mem2(register_mem2),
                .register_mem3(register_mem3),.register_mem4(register_mem4),.register_mem5(register_mem5),
                .register_mem6(register_mem6),.register_mem7(register_mem7),.register_mem8(register_mem8),
                .register_mem9(register_mem9),.register_mem10(register_mem10),.register_mem11(register_mem11),
                .register_mem12(register_mem12),.register_mem13(register_mem13),.register_mem14(register_mem14),
                .register_mem15(register_mem15));
execute execute_block(.clk(clk),.icode(icode),.ifun(ifun),.valA(valA),.valB(valB),.valC(valC),.valE(valE),.zf(zf),
                .sf(sf),.of(of),.cnd(cnd));

memory memory_block(.clk(clk),.icode(icode),.valA(valA),.valB(valB),.valE(valE),.valM(valM),.dram_val(dram_val));             

pc_update pupdt_block(.clk(clk),.icode(icode),.cnd(cnd),.valC(valC),.valM(valM),.valP(valP),.new_pc(new_pc));

initial begin 
    $dumpfile("proc_out.vcd");
        $dumpvars(0,processor);
    clk=0;
    pc=64'd0;
    // valE = 64'd5;
    // valM = 64'd10;'
    
    #15 clk=~clk;pc=64'd32;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    #15 clk=~clk;pc=new_pc;
    #15 clk=~clk;
    
  end 
  
  //always@(posedge clk) 
  initial begin
    $monitor ("clk=%d pc=%d new_pc=%d \nicode=%b ifun=%b rA=%d rB=%d valC=%d valP=%d valE=%d \nvalM=%d valA=%d valB=%d \ncnd=%d, zf=%d, of=%d, sf=%d register_3=%d\n\n\n",clk,pc,new_pc,icode,ifun,rA,rB,valC,valP,(valE),valM,valA,valB,cnd,zf,of,sf,register_mem3);
  end


endmodule