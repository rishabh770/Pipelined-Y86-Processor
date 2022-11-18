module fetch(clk,pc,icode,ifun,rA,rB,valC,valP);

input clk;
input [64:1] pc;
output reg [4:1] icode;
output reg [4:1] ifun;
output reg [4:1] rA;
output reg [4:1] rB;
output reg [64:1] valC;
output reg [64:1] valP;
reg [8:1]instr_mem[100:1];

initial begin

//irmove
    instr_mem[32]=8'b00110000;
    instr_mem[33]=8'b11110100; //%7 to 4
    instr_mem[34]=8'b00000000; 
    instr_mem[35]=8'b00000000; 
    instr_mem[36]=8'b00000000;
    instr_mem[37]=8'b00000000; 
    instr_mem[38]=8'b00000000; 
    instr_mem[39]=8'b00000000; 
    instr_mem[40]=8'b00000000; 
    instr_mem[41]=8'b00000111;

    instr_mem[42]=8'b00000000;
    instr_mem[43]=8'b00000000;

//irmove
    instr_mem[44]=8'b00110000;
    instr_mem[45]=8'b11110110;  //5 to 6 
    instr_mem[46]=8'b00000000; 
    instr_mem[47]=8'b00000000; 
    instr_mem[48]=8'b00000000;
    instr_mem[49]=8'b00000000; 
    instr_mem[50]=8'b00000000; 
    instr_mem[51]=8'b00000000; 
    instr_mem[52]=8'b00000000; 
    instr_mem[53]=8'b00000111;

    instr_mem[54]=8'b00000000;
    instr_mem[55]=8'b00000000;

//subq
    instr_mem[56]=8'b01100001;
    instr_mem[57]=8'b01000110;

    instr_mem[58]=8'b00000000;
//cmovl
    instr_mem[59]=8'b00100011; 
    instr_mem[60]=8'b01000110; 
    instr_mem[61]=8'b00000000;

    // instr_mem[46]=8'b00000000; 
    // instr_mem[47]=8'b00000000; 
    // instr_mem[48]=8'b00000000;
    // instr_mem[49]=8'b00000000; 
    // instr_mem[50]=8'b00000000; 
    // instr_mem[51]=8'b00000000;
    // instr_mem[52]=8'b00000000;
    // instr_mem[53]=8'b00000010;
// //rmmove
//     instr_mem[44]=8'b01000000; 
//     instr_mem[45]=8'b01000011; 
//     instr_mem[46]=8'b00000000; 
//     instr_mem[47]=8'b00000000; 
//     instr_mem[48]=8'b00000000;
//     instr_mem[49]=8'b00000000; 
//     instr_mem[50]=8'b00000000; 
//     instr_mem[51]=8'b00000000;
//     instr_mem[52]=8'b00000000;
//     instr_mem[53]=8'b00000010;

//     instr_mem[54]=8'b00000000;
//     instr_mem[55]=8'b00000000;

// //mrmovq
//     instr_mem[56]=8'b01010000; 
//     instr_mem[57]=8'b01110010; 
//     instr_mem[58]=8'b00000000; 
//     instr_mem[59]=8'b00000000; 
//     instr_mem[60]=8'b00000000;
//     instr_mem[61]=8'b00000000; 
//     instr_mem[62]=8'b00000000; 
//     instr_mem[63]=8'b00000000;
//     instr_mem[64]=8'b00000000;
//     instr_mem[65]=8'b00000010;

// //subq
//     instr_mem[52]=8'b01100000;
//     instr_mem[53]=8'b01010011;
    instr_mem[62]=8'b00000000;

//nop

    
end

always @(*)
begin
     
    icode = instr_mem[pc][8:5];
    ifun  = instr_mem[pc][4:1];
    
    if (icode == 4'b0000) //halt
    begin
        valP = pc + 64'd1;
    end    
    
    else if(icode == 4'b0001) //nop
    begin
        valP = pc + 64'd1;
    end    
    
    else if(icode == 4'b0010) //cmovXX
    begin
        rA = instr_mem[pc+1][8:5];
        rB = instr_mem[pc+1][4:1];
        valP = pc + 64'd2;
    end    
    
    else if(icode == 4'b0011) //irmovq
    begin
       rA = instr_mem[pc+1][8:5];
       rB = instr_mem[pc+1][4:1];
       valC = {instr_mem[pc+9],
                instr_mem[pc+8],
                instr_mem[pc+7],
                instr_mem[pc+6],
                instr_mem[pc+5],
                instr_mem[pc+4],
                instr_mem[pc+3],
                instr_mem[pc+2]
                };
       valP = pc + 64'd10;
    end    
    
    else if(icode == 4'b0100) //rmmovq
    begin
        rA = instr_mem[pc+1][8:5];
        rB = instr_mem[pc+1][4:1];
         valC = {instr_mem[pc+9],
                instr_mem[pc+8],
                instr_mem[pc+7],
                instr_mem[pc+6],
                instr_mem[pc+5],
                instr_mem[pc+4],
                instr_mem[pc+3],
                instr_mem[pc+2]
                };
        valP = pc + 64'd10;
    end    
    
    else if(icode == 4'b0101) //mrmovq
    begin
        rA = instr_mem[pc+1][8:5];
        rB = instr_mem[pc+1][4:1];
         valC = {instr_mem[pc+9],
                instr_mem[pc+8],
                instr_mem[pc+7],
                instr_mem[pc+6],
                instr_mem[pc+5],
                instr_mem[pc+4],
                instr_mem[pc+3],
                instr_mem[pc+2]
                };
        valP = pc + 64'd10;
    end    
    
    else if(icode == 4'b0110) //Opq
    begin
        rA = instr_mem[pc+1][8:5];
        rB = instr_mem[pc+1][4:1];
        valP = pc + 64'd2;
    end    
    
    else if(icode == 4'b0111) //jXX
    begin
          valC = {instr_mem[pc+8],
                instr_mem[pc+7],
                instr_mem[pc+6],
                instr_mem[pc+5],
                instr_mem[pc+4],
                instr_mem[pc+3],
                instr_mem[pc+2],
                instr_mem[pc+1]
                };
        valP = pc + 64'd9;
    end    
    
    else if(icode == 4'b1000) //call
    begin
        valC = {instr_mem[pc+8],
                instr_mem[pc+7],
                instr_mem[pc+6],
                instr_mem[pc+5],
                instr_mem[pc+4],
                instr_mem[pc+3],
                instr_mem[pc+2],
                instr_mem[pc+1]
                };
        valP = pc + 64'd9;
    end    
    
    else if(icode == 4'b1001) //ret
    begin
        valP = pc + 64'd1;
    end    
    
    else if(icode == 4'b1010) //pushq
    begin
        rA = instr_mem[pc+1][8:5];
        rB = instr_mem[pc+1][4:1];
        valP = pc + 64'd2;
    end    
    
    else if(icode == 4'b1011) //popq    
    begin
        rA = instr_mem[pc+1][8:5];
        rB = instr_mem[pc+1][4:1];
        valP = pc + 64'd2;
    end    
    
    // else
    // begin
    //     ivf = 1'b1;
    // end

end   
endmodule 