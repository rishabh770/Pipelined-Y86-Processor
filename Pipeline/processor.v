`include "decode_reg.v"
`include "decode.v"
`include "execute.v"
`include "execute_reg.v"
`include "fetch.v"
`include "f_reg.v"
`include "mem_reg.v"
`include "memory.v"
`include "writeback_reg.v"


module processor();

reg clk;
reg pc;

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

//F
wire [64:1]upred_PC;
wire [64:1]F_predPC;
//f
wire [2:0] f_stat;
wire [3:0] f_icode;
wire [3:0] f_ifun;
wire [63:0] f_valC;
wire [63:0] f_valP;
wire [3:0] f_rA;
wire [3:0] f_rB;
//D
wire [2:0] D_stat;
wire [3:0] D_icode;
wire [3:0] D_ifun;
wire [63:0] D_valC;
wire [63:0] D_valP;
wire [3:0] D_rA;
wire [3:0] D_rB;
//d
wire [2:0] d_stat;
wire [3:0] d_icode;
wire [3:0] d_ifun;
wire [63:0] d_valC;
wire [63:0] d_valA;
wire [63:0] d_valB;
wire [3:0] d_destE;
wire [3:0] d_destM;
wire [3:0] d_srcA;
wire [3:0] d_srcB;
//E
wire [2:0] E_stat;
wire [3:0] E_icode;
wire [3:0] E_ifun;
wire [63:0] E_valC;
wire [63:0] E_valA;
wire [63:0] E_valB;
wire [3:0] E_destE;
wire [3:0] E_destM;
wire [3:0] E_srcA;  //use?
wire [3:0] E_srcB;   //use?
//e
wire [2:0] e_stat;
wire [3:0] e_icode;
wire e_cnd;  //one bit?
wire [63:0] e_valE;
wire [63:0] e_valA;
wire [3:0] e_destE;
wire [3:0] e_destM;
//M
wire [2:0] M_stat;
wire [3:0] M_icode;
wire M_cnd;
wire [63:0] M_valE;
wire [63:0] M_valA;
wire [3:0] M_destE;
wire [3:0] M_destM;
//m
wire [2:0] m_stat;
wire [3:0] m_icode;
wire [63:0] m_valE;
wire [63:0] m_valM;
wire [3:0] m_destE;
wire [3:0] m_destM;
//W
wire [2:0] W_stat;
wire [3:0] W_icode;
wire [63:0] W_valE;
wire [63:0] W_valM;
wire [3:0] W_destE;
wire [3:0] W_destM;
wire [64:1]dram_val;


//fetch register
f_reg r_f(.clk(clk),.upred_PC(upred_PC),.F_predPC(F_predPC));

//fetch block
fetch fet(.clk(clk),.W_valM(W_valM),.M_valA(M_valA),.M_icode(M_icode),
        .W_icode(W_icode),.M_cond(M_cnd),.F_predPC(F_predPC),
        .icode(f_icode),.ifun(f_ifun),.rA(f_rA),.rB(f_rB),.valC(f_valC),.valP(f_valP),
        .stat(f_stat),.upred_PC(upred_PC));

//decode register
decode_reg r_d(.clk(clk),.f_stat(f_stat),.f_icode(f_icode),.f_ifun(f_ifun),.f_valC(f_valC),
             .f_valP(f_valP),.f_rA(f_rA),.f_rB(f_rB),.D_stat(D_stat),.D_icode(D_icode),
             .D_ifun(D_ifun),.D_valC(D_valC),.D_valP(D_valP),.D_rA(D_rA),.D_rB(D_rB));

//decode block // cnd???
decode dec(.clk(clk),.icode(D_icode), .ifun(D_ifun), .rA(D_rA),.rB(D_rB),.D_valP(D_valP),.e_destE(e_destE),.W_valE(W_valE),.d_valC(d_valC),
         .e_valE(e_valE),.M_destE(M_destE),.M_valE(M_valE),.M_destM(M_destM),.m_valM(m_valM),.W_icode( W_icode),.D_valC(D_valC),
         .W_destM(W_destM),.W_valM(W_valM),.W_destE(W_destE),.valA(d_valA),.valB(d_valB) ,.d_destE(d_destE),.d_destM(d_destM),
         .register_mem1(register_mem1),.register_mem2(register_mem2),.register_mem3(register_mem3),
         .register_mem4(register_mem4),.register_mem5(register_mem5),.register_mem6(register_mem6),
         .register_mem7(register_mem7),.register_mem8(register_mem8),.register_mem9(register_mem9),
         .register_mem10(register_mem10),.register_mem11(register_mem11),.register_mem12(register_mem12),
         .register_mem13(register_mem13),.register_mem14(register_mem14),.register_mem15(register_mem15), .d_icode(d_icode), .d_ifun(d_ifun));

// wire [3:0] d_ifun;
execute_reg r_e(.clk(clk),.d_stat(D_stat),.d_icode(d_icode),.d_ifun(d_ifun),.d_valC(d_valC),.d_valA(d_valA),.d_valB(d_valB),
            .d_destE(d_destE),.d_destM(d_destM),.d_srcA(d_srcA),.d_srcB(d_srcB),.E_stat(E_stat),.E_icode(E_icode),
            .E_ifun(E_ifun),.E_valC(E_valC),.E_valA(E_valA),.E_valB(E_valB),.E_destE(E_destE),.E_destM(E_destM),.E_srcA(E_srcA),  
            .E_srcB(E_srcB));


// wire [3:0] e_icode;
execute exc(.clk(clk),.icode(E_icode),.ifun(E_ifun),.valA(E_valA),.valB(E_valB),.valC(E_valC),  
           .valE(e_valE),.cnd(e_cnd),.destE(E_destE),.e_destE(e_destE),.destM(E_destM),.e_destM(e_destM), .e_icode(e_icode),.e_valA(e_valA));


memory_reg r_m(.clk(clk),.e_stat(E_stat),.e_icode(e_icode),.e_cnd(e_cnd),.e_valE(e_valE),.e_valA(e_valA),.e_destE(e_destE),
        .e_destM(e_destM),.M_stat(M_stat),.M_icode(M_icode),.M_cnd(M_cnd),.M_valE(M_valE),.M_valA(M_valA),.M_destE(M_destE),
        .M_destM(M_destM));

// wire [63:0] m_valE;
// wire [3:0] m_icode;
wire [3:0] m_dstE;

memory mem(.clk(clk),.icode(M_icode),.valA(M_valA),.valE(M_valE),.valM(m_valM),.dram_val(dram_val), .m_icode(m_icode), .m_valE(m_valE), .m_destE(m_destE), .M_destE(M_destE));

writeback_reg r_w(.clk(clk),.m_stat(M_stat),.m_icode(m_icode),.m_valE(m_valE),.m_valM(m_valM),.m_destE(m_destE),.m_destM(M_destM),
                .W_stat(W_stat),.W_icode(W_icode),.W_valE(W_valE),.W_valM(W_valM),.W_destE(W_destE),.W_destM(W_destM));


always #10clk =~clk;

initial 
begin
    $dumpfile("proc_out.vcd");
    $dumpvars(0,processor);
    clk=0       ;
//     F_predPC = 64'd32;

end

always @(*)
begin
        if(W_stat == 2)
        begin
                $finish;
        end
end

           
        

endmodule

