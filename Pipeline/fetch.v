module fetch(clk,W_valM,M_valA,,M_cond,M_icode,W_icode,F_predPC,
            icode,ifun,rA,rB,valC,valP,upred_PC,stat);

input clk;
input [64:1]W_valM;
input [64:1]M_valA;
input [4:1]M_icode;
input [4:1]W_icode;
input M_cond;
input [64:1]F_predPC;


output reg [4:1] icode;
output reg [4:1] ifun;
output reg [4:1] rA;
output reg [4:1] rB;
output reg [64:1] valC;
output reg [64:1] valP;
output reg [64:1]upred_PC;
reg inv_inst;
reg mem_error;
reg hlt_inst;
output reg [3:1]stat;
wire [64:1] f_pc;
wire [64:1]tupred_PC;
reg [8:1]instr_mem[100:1];

initial begin
    
//irmove
    instr_mem[30]=8'b00010000;
    instr_mem[31]=8'b00010000;
    instr_mem[32]=8'b00110000;
    instr_mem[33]=8'b11110011;  //5 to 6 
    instr_mem[34]=8'b00011001; 
    instr_mem[35]=8'b00000000; 
    instr_mem[36]=8'b00000000;
    instr_mem[37]=8'b00000000; 
    instr_mem[38]=8'b00000000; 
    instr_mem[39]=8'b00000000; 
    instr_mem[40]=8'b00000000; 
    instr_mem[41]=8'b00000000;
    instr_mem[42]=8'b00010000;
    instr_mem[43]=8'b00010000;
//irmove
    instr_mem[44]=8'b00110000;
    instr_mem[45]=8'b11110110;  //5 to 6 
    instr_mem[46]=8'b00001001; 
    instr_mem[47]=8'b00000000; 
    instr_mem[48]=8'b00000000;
    instr_mem[49]=8'b00000000; 
    instr_mem[50]=8'b00000000; 
    instr_mem[51]=8'b00000000; 
    instr_mem[52]=8'b00000000; 
    instr_mem[53]=8'b00000000;
//irmove
    instr_mem[54]=8'b00110000;
    instr_mem[55]=8'b11110111;  //5 to 6 
    instr_mem[56]=8'b00001111; 
    instr_mem[57]=8'b00000000; 
    instr_mem[58]=8'b00000000;
    instr_mem[59]=8'b00000000; 
    instr_mem[60]=8'b00000000; 
    instr_mem[61]=8'b00000000; 
    instr_mem[62]=8'b00000000; 
    instr_mem[63]=8'b00000000;
//subq
    instr_mem[64]=8'b01100001;
    instr_mem[65]=8'b01100111;

    instr_mem[66]=8'b00010000;
    instr_mem[67]=8'b00010000;
    instr_mem[68]=8'b00010000;
    instr_mem[69]=8'b00000000;

end

initial begin 
    inv_inst = 1'b0;
    mem_error = 1'b0;
    hlt_inst = 1'b0;
end

select_pc get_pc(.W_valM(W_valM),.M_valA(M_valA),.M_cond(M_cond),.W_icode(W_icode),.M_icode(M_icode),.valP(valP),.F_predPC(F_predPC),.f_pc(f_pc));
predict_pc new_pc(.valP(valP),.valC(valC),.f_pc(f_pc),.icode(icode),.pupred_PC(tupred_PC));

always @(*)
begin
    
    mem_error = 1'b0;
    inv_inst = 1'b0;
    if(f_pc > 100)
    begin    
        mem_error = 1'b1;
    end

    hlt_inst = 1'b0;
    icode = instr_mem[f_pc][8:5];
    ifun  = instr_mem[f_pc][4:1];
    
    if (icode == 4'b0000) //halt
    begin
        hlt_inst = 1'b1;
        valP = f_pc + 64'd0;
    end    
    
    else if(icode == 4'b0001) //nop
    begin
        valP = f_pc + 64'd1;
    end    
    
    else if(icode == 4'b0010) //cmovXX
    begin
        rA = instr_mem[f_pc+1][8:5];
        rB = instr_mem[f_pc+1][4:1];
        valP = f_pc + 64'd2;
    end    
    
    else if(icode == 4'b0011) //irmovq
    begin
       rA = instr_mem[f_pc+1][8:5];
       rB = instr_mem[f_pc+1][4:1];
       valC = {instr_mem[f_pc+9],
                instr_mem[f_pc+8],
                instr_mem[f_pc+7],
                instr_mem[f_pc+6],
                instr_mem[f_pc+5],
                instr_mem[f_pc+4],
                instr_mem[f_pc+3],
                instr_mem[f_pc+2]
                };
       valP = f_pc + 64'd10;
    end    
    
    else if(icode == 4'b0100) //rmmovq
    begin
        rA = instr_mem[f_pc+1][8:5];
        rB = instr_mem[f_pc+1][4:1];
         valC = {instr_mem[f_pc+9],
                instr_mem[f_pc+8],
                instr_mem[f_pc+7],
                instr_mem[f_pc+6],
                instr_mem[f_pc+5],
                instr_mem[f_pc+4],
                instr_mem[f_pc+3],
                instr_mem[f_pc+2]
                };
        valP = f_pc + 64'd10;
    end    
    
    else if(icode == 4'b0101) //mrmovq
    begin
        rA = instr_mem[f_pc+1][8:5];
        rB = instr_mem[f_pc+1][4:1];
         valC = {instr_mem[f_pc+9],
                instr_mem[f_pc+8],
                instr_mem[f_pc+7],
                instr_mem[f_pc+6],
                instr_mem[f_pc+5],
                instr_mem[f_pc+4],
                instr_mem[f_pc+3],
                instr_mem[f_pc+2]
                };
        valP = f_pc + 64'd10;
    end    
    
    else if(icode == 4'b0110) //Opq
    begin
        rA = instr_mem[f_pc+1][8:5];
        rB = instr_mem[f_pc+1][4:1];
        valP = f_pc + 64'd2;
    end    
    
    else if(icode == 4'b0111) //jXX
    begin
          valC = {instr_mem[f_pc+8],
                instr_mem[f_pc+7],
                instr_mem[f_pc+6],
                instr_mem[f_pc+5],
                instr_mem[f_pc+4],
                instr_mem[f_pc+3],
                instr_mem[f_pc+2],
                instr_mem[f_pc+1]
                };
        valP = f_pc + 64'd9;
    end    
    
    else if(icode == 4'b1000) //call
    begin
        valC = {instr_mem[f_pc+8],
                instr_mem[f_pc+7],
                instr_mem[f_pc+6],
                instr_mem[f_pc+5],
                instr_mem[f_pc+4],
                instr_mem[f_pc+3],
                instr_mem[f_pc+2],
                instr_mem[f_pc+1]
                };
        valP = f_pc + 64'd9;
    end    
    
    else if(icode == 4'b1001) //ret
    begin
        valP = f_pc + 64'd1;
    end    
    
    else if(icode == 4'b1010) //pushq
    begin
        rA = instr_mem[f_pc+1][8:5];
        rB = instr_mem[f_pc+1][4:1];
        valP = f_pc + 64'd2;
    end    
    
    else if(icode == 4'b1011) //popq    
    begin
        rA = instr_mem[f_pc+1][8:5];
        rB = instr_mem[f_pc+1][4:1];
        valP = f_pc + 64'd2;
    end    
    
    else
    begin
        inv_inst = 1'b1;
    end
    

end   

always @(*) begin

        if (mem_error == 1) 
        begin
            stat = 3'd3;
        end 
        else if (inv_inst == 1) 
        begin
            stat = 3'd4;
        end
        else if (hlt_inst == 1) 
        begin
            stat = 3'd2;
        end
        else 
        begin
            stat = 3'd1;
        end
        upred_PC = tupred_PC;
    end

endmodule 

module select_pc(input [64:1]W_valM,
                input [64:1]M_valA,
                input M_cond,
                input [4:1]W_icode,
                input [4:1]M_icode,
                input [64:1]valP,
                input [64:1]F_predPC,
                output reg  [64:1]f_pc);

// initial 
// begin
//     //#10 
//     f_pc = 64'd31;
// end


always @(*)
begin 
    if(W_icode == 4'b1001)
    begin
        f_pc = W_valM;
    end
    else if(M_icode == 4'b0000 && M_cond == 1)
    begin 
        f_pc = M_valA;    
    end
    else
    begin
        f_pc = F_predPC;
    // f_pc = 64'd32;
    end
        // else
        // begin
        //     
        // end

    // end
end
endmodule

module predict_pc(input [64:1]valP,
                  input [64:1]valC,
                  input [64:1]f_pc,
                  input [4:1]icode,
                  output reg [64:1]pupred_PC);

always @(*)       
begin
    if(icode == 4'b0111 || icode == 4'b1000)
    begin
        pupred_PC = valC;
    end
    else
    begin
        pupred_PC = valP;
    end
end

always @(*)       
begin
    if(icode == 4'b0111 || icode == 4'b1000)
    begin
        pupred_PC = valC;
    end
    else
    begin
        pupred_PC = valP;
    end
end
endmodule