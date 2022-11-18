module decode(
    input clk,
    input cnd,
    input [4:1]icode,
    input [4:1] rA,
    input [4:1] rB,
    input [64:1] valE,
    input [64:1] valM,

    output reg [64:1] valA,
    output reg [64:1] valB,
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
  end

always @(*)
begin
    if(icode == 4'b0010) //cmovxx
    begin
        valA = register_mem[rA];
    end
    else if(icode == 4'b0100) //rmmovq
    begin
        valA = register_mem[rA];
        valB = register_mem[rB];
    end
    else if(icode == 4'b0101) //mrmovq
    begin
        valB = register_mem[rB];
    end
    else if(icode == 4'b0110) //Op
    begin
        valA = register_mem[rA];
        valB = register_mem[rB];
    end
    else if(icode == 4'b1000) //call
    begin
        valB = register_mem[5]; //rsp register
    end
    else if(icode == 4'b1001) //ret
    begin
        valA = register_mem[5];
        valB = register_mem[5];
    end
    else if(icode == 4'b1010) //pushq
    begin
        valA = register_mem[rA];
        valB = register_mem[5];
    end
    else if(icode == 4'b1011) //popq
    begin
        valA = register_mem[5];
        valB = register_mem[5];
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

always @(posedge clk)
begin
    if(icode == 4'b0010) //cmovxx
    begin
        if(cnd == 1'b1)
        begin
            register_mem[rB] = valE;
        end
        else
        begin
            register_mem[15] = valE;
        end
    end
    else if(icode == 4'b0011)
    begin
        register_mem[rB] = valE;
    end
    else if(icode == 4'b0101) //mrmovq
    begin
        register_mem[rA] = valM;
    end
    else if(icode == 4'b0110) //Op
    begin
        register_mem[rB] = valE;
    end
    else if(icode == 4'b1000) //call
    begin
        register_mem[5] = valE;
    end
    else if(icode == 4'b1001) //ret
    begin
        register_mem[5] = valE;
    end
    else if(icode == 4'b1010) //pushq
    begin
        register_mem[5] = valE;
    end
    else if(icode == 4'b1011) //popq
    begin
        register_mem[5] = valE;
        register_mem[rA] = valM;
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

endmodule

// Issues raised:
// 1) How register memory index will be read using rA or rB.