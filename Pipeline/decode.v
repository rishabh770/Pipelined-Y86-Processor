module decode(
    input clk,
    input cnd,
    input [4:1]icode,
    input [4:1]ifun,
    input [4:1] rA,
    input [4:1] rB,
    input [64:1]D_valP,
    input [64:1]D_valC,
    input [4:1] e_destE,
    input [64:1] e_valE,
    input [4:1] M_destE,
    input [64:1] M_valE,
    input [4:1] M_destM,
    input [64:1] m_valM,
    input [4:1] W_destM,
    input [64:1] W_valM,
    input [4:1] W_destE,
    input [64:1] W_valE,
    input [4:1] W_icode,

    output reg [4:1] d_icode,
    output reg [4:1] d_ifun,
    output reg [64:1] valA,
    output reg [64:1] valB,
    output reg [64:1]d_valC,
    output reg [3:0]d_destE,
    output reg [3:0]d_destM,

    //Add other registers like w_destE also!!!
    //Apperently add srcA and srcB also but not required if rA and rB works by assigning srcA/B simuntaeously

    output reg [64:1] register_mem1,
    output reg [64:1] register_mem2,
    output reg [64:1] register_mem3,
    output reg [64:1] register_mem4,
    output reg [64:1] register_mem5,
    output reg [64:1] register_mem6,
    output reg [64:1] register_mem7,
    output reg [64:1] register_mem8,
    output reg [64:1] register_mem9,
    output reg [64:1] register_mem10,
    output reg [64:1] register_mem11,
    output reg [64:1] register_mem12,
    output reg [64:1] register_mem13,
    output reg [64:1] register_mem14,
    output reg [64:1] register_mem15
);

reg [64:1]register_mem[1:15];
reg [3:0] srcA;
reg [3:0] srcB;
reg [64:1] rvalA;
reg [64:1] rvalB;

wire [64:1]temp_valA;

initial begin
    register_mem[1]=64'd0;
    register_mem[2]=64'd0;
    register_mem[3]=64'd0;
    register_mem[4]=64'd0;
    register_mem[5]=64'd0;
    register_mem[6]=64'd0;
    register_mem[7]=64'd0;
    register_mem[8]=64'd0;
    register_mem[9]=64'd0;
    register_mem[10]=64'd0;
    register_mem[11]=64'd0;
    register_mem[12]=64'd0;
    register_mem[13]=64'd0;
    register_mem[14]=64'd0;
    register_mem[15]=64'd0;

    $dumpvars(0, register_mem[3], register_mem[6], register_mem[7]);
  end

always @(*)
begin
    d_valC = D_valC;
    d_icode = icode;
    d_ifun = ifun;
    if(icode == 4'b0010) //cmovxx
    begin
        rvalA = register_mem[rA];
        srcA = rA;
        srcB = rB;
    end
    else if(icode == 4'b0100) //rmmovq
    begin
        rvalA = register_mem[rA];
        rvalB = register_mem[rB];
        srcA = rA;
        srcB = rB;
    end
    else if(icode == 4'b0101) //mrmovq
    begin
        rvalB = register_mem[rB];
        srcA = rA;
        srcB = rB;
    end
    else if(icode == 4'b0110) //Op
    begin
        rvalA = register_mem[rA];
        rvalB = register_mem[rB];
        srcA = rA;
        srcB = rB;
    end
    else if(icode == 4'b1000) //call
    begin
        rvalB = register_mem[5]; //rsp register
        srcB = 5;
    end
    else if(icode == 4'b1001) //ret
    begin
        rvalA = register_mem[5];
        rvalB = register_mem[5];
        srcA = 5;
        srcB = 5;
    end
    else if(icode == 4'b1010) //pushq
    begin
        rvalA = register_mem[rA];
        rvalB = register_mem[5];
        srcA = rA;
        srcB = 5;
    end
    else if(icode == 4'b1011) //popq
    begin
        rvalA = register_mem[5];
        rvalB = register_mem[5];
        srcA = 5;
        srcB = 5;
    end
    register_mem1 = register_mem[1];
    register_mem2 = register_mem[2];
    register_mem3 = register_mem[3];
    register_mem4 = register_mem[4];
    register_mem5 = register_mem[5];
    register_mem6 = register_mem[6];
    register_mem7 = register_mem[7];
    register_mem8 = register_mem[8];
    register_mem9 = register_mem[9];
    register_mem10 = register_mem[10];
    register_mem11 = register_mem[11];
    register_mem12 = register_mem[12];
    register_mem13 = register_mem[13];
    register_mem14 = register_mem[14];
    register_mem15 = register_mem[15];

end
    
always@(*)  //check for edge
begin
    if(icode == 4'b0110 || icode == 4'b0011 || icode == 4'b0010) //opq // // //irmovq //cmov
    begin
        d_destE = rB;
    end
    else if(icode == 4'b0101)
    begin
        d_destM = rA;
    end
    else if(icode == 4'b1010 || icode == 4'b1000)
    begin
        d_destE = 5;
    end
    else if(icode == 4'b1011)
    begin
        d_destE = 5;
        d_destM = rA;
    end
    else if(icode == 4'b1000)
    begin
        d_destE = 5;;
    end

end

//Sel+Fwd A
always @(*)
begin
    if(icode == 4'b1000 || icode == 4'b0111)
    begin
        valA = D_valP;
    end
    else if (srcA == e_destE)
    begin
        valA = e_valE;
    end
    else if (srcA == M_destM)
    begin
        valA = m_valM;
    end
    else if (srcA == M_destE)
    begin
        valA = M_valE;
    end
    else if (srcA == W_destM)
    begin
        valA = W_valM;
    end
    else if (srcA == W_destE)
    begin
        valA = W_valE;
    end
    else
    begin
        valA = rvalA;
    end
end

//Fwd B
always @(*)
begin
    if (srcB == e_destE)
    begin
        valB = e_valE;
    end
    else if (srcB == M_destM)
    begin
        valB = m_valM;
    end
    else if (srcB == M_destE)
    begin
        valB = M_valE;
    end
    else if (srcB == W_destM)
    begin
        valB = W_valM;
    end
    else if (srcB == W_destE)
    begin
        valB = W_valE;
    end
    else
    begin
        valB = rvalB;
    end
end

//writeback
always @(negedge clk)
begin
    register_mem[W_destE] <= W_valE;
    register_mem[W_destM] = W_valM;
    
    // if(W_icode == 4'b0010) //cmovxx
    // begin
    //     if(cnd == 1'b1)
    //     begin
    //         register_mem[W_destE] = W_valE;
    //     end
    //     else
    //     begin
    //         register_mem[15] = W_valE;
    //     end
    // end
    // else if(W_icode == 4'b0011) //irmovq
    // begin
    //     register_mem[W_destE] = W_valE;
    // end
    // else if(W_icode == 4'b0101) //mrmovq
    // begin
    //     register_mem[W_destM] = W_valM;
    // end
    // else if(W_icode == 4'b0110) //Op
    // begin
    //     register_mem[W_destE] = W_valE;
    // end
    // else if(W_icode == 4'b1000) //call
    // begin
    //     register_mem[5] = W_valE;
    // end
    // else if(W_icode == 4'b1001) //ret
    // begin
    //     register_mem[5] = W_valE;
    // end
    // else if(W_icode == 4'b1010) //pushq
    // begin
    //     register_mem[5] = W_valE;
    // end
    // else if(W_icode == 4'b1011) //popq
    // begin
    //     register_mem[5] = W_valE;
    //     register_mem[W_destM] = W_valM;
    // end
    
register_mem1 = register_mem[1];
register_mem2 = register_mem[2];
register_mem3 = register_mem[3];
register_mem4 = register_mem[4];
register_mem5 = register_mem[5];
register_mem6 = register_mem[6];
register_mem7 = register_mem[7];
register_mem8 = register_mem[8];
register_mem9 = register_mem[9];
register_mem10 = register_mem[10];
register_mem11 = register_mem[11];
register_mem12 = register_mem[12];
register_mem13 = register_mem[13];
register_mem14 = register_mem[14];
register_mem15 = register_mem[15];
end

endmodule
