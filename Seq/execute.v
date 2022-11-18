`include "ALU/alu.v"
`include "ALU/Logics/add/Square_red.v"
`include "ALU/Logics/add/Circle_green.v"
`include "ALU/Logics/add/Circle_yellow.v"
`include "ALU/Logics/add/add_64bit.v"
`include "ALU/Logics/and/and_64bit.v"
`include "ALU/Logics/xor/xor_64bit.v"
`include "ALU/Logics/sub/sub_64bit.v"

module execute(clk,icode,ifun,valA,e_valB,valC,valE,zf, sf, of,cnd);

input clk;
input  [4:1]icode;
input  [4:1]ifun;
input  [64:1]valA;
input [64:1]valB;
input [64:1]valC;
output reg [64:1] valE;
output reg  zf, sf, of;
output reg cnd;

reg [2:1]sel;
reg [64:1]a;
reg [64:1]b;
wire [64:1]result;
wire overflow;
reg cin;

alu dut(.sel(sel),.a(a),.b(b),.cin(cin),.result(result),.overflow(overflow));

always @(posedge clk)
begin
    if(icode == 4'b0110 || clk==1)  //OP
    begin
        if(result == 64'b0)
            begin
                zf = 1;
            end
        else 
            begin
                zf = 0;
            end
        if(result[64] == 1 )
            begin
                sf = 1;
            end
        else 
            begin
                sf = 0;
            end
        if((a<64'b0 == b<64'b0) && (result<64'b0 != a<64'b0))
            begin
                of = 1;
            end
        else 
            begin
                of = 0;
            end
    end
end


always @(*)
begin
//if(clk == 1)
//begin
    if(icode == 4'b0110) //OP
    begin
        b = valA;
        a = valB;
      if(ifun == 4'b0000) //ADD
        begin
            sel = 2'b00;
        end
      if(ifun == 4'b0001) //SUB
        begin
            sel = 2'b01;
        end
      if(ifun == 4'b0100) //AND
        begin
            sel = 2'b10;
        end
      if(ifun == 4'b0011) //XOR
      begin
            sel = 2'b11;
      end
      valE = result; //set_CC

    end
    
    // var assign problem
    else if(icode == 4'b0010) //cmovXX
    begin
        if(ifun == 4'b0000) //rrmovq
        begin
           cnd=1'b1;
        end

        if(ifun == 4'b0001) //cmovle
        begin
            if((sf^of)|zf)
            begin
                cnd=1'b1;
            end 
        end
        
        if(ifun == 4'b0010) //cmovl
        begin
            if(sf^of)
            begin
                cnd=1'b1;
            end
        end
        
        if(ifun == 4'b0011) //cmove
        begin
            if(zf)
            begin
                cnd=1'b1;
            end 
        end
        
        if(ifun == 4'b0100) //cmone
        begin
            if(~zf)
            begin
                cnd=1'b1;
            end
        end
        
        if(ifun == 4'b0101) //cmovge
        begin
            if(~(sf^of))
            begin
                cnd=1'b1;
            end
        end
        
        if(ifun == 4'b0110) //cmovg
        begin
            if((~(sf^of)&(~zf)))  //note here
            begin
                cnd=1'b1;
            end
        end
        
        a = valA;
        b = 0;
        sel = 2'b00;   //add
        valE = result;
        
    end
    
    else if (icode == 4'b0111) //jxx
    begin
        if(ifun == 4'b0000) //jmp
        begin
            cnd=1'b1;
        end
        
        if(ifun == 4'b0001) //jle
        begin
            if((sf^of)|zf)
            begin
                cnd=1'b1;
            end 
        end
        
        if(ifun == 4'b0010) //jl
        begin
            if(sf^of)
            begin
                cnd=1'b1;
            end
        end
        if(ifun == 4'b0011) //je
          begin
            if(zf)
            begin
                cnd=1'b1;
            end 
        end
        if(ifun == 4'b0100) //jne
        begin
            if(~zf)
            begin
                cnd=1'b1;
            end
        end
        if(ifun == 4'b0101) //jge
        begin
            if(~(sf^of))
            begin
                cnd=1'b1;
            end
        end
        if(ifun == 4'b0110) //jg
        begin
            if((~(sf^of)&(~zf)))
            begin
                cnd=1'b1;
            end
        end
       
    end

    else if(icode == 4'b0100) //rmmovq
    begin
        a = valB;
        b = valC;
        sel = 2'b00;
        valE = result;
    end

    else if(icode == 4'b0101) //mrmovq
    begin
        a = valB;
        b = valC;
        sel = 2'b00;
        valE = result;
    end

    else if(icode == 4'b0011) //irmovq
    begin
        a = valC;
        b = 64'b0;
        sel = 2'b00;
        valE = result;
    end

    else if(icode == 4'b1011 || icode == 4'b1001) //popq || ret
    begin
        a = valB;
        b = 64'b1000;
        sel = 2'b00;
        valE = result;
    end

    else if(icode == 4'b1010 || icode == 4'b1000) //pushq || call
    begin
        a = valB;
        b = 64'b1000;
        sel = 2'b01;
        valE = result;
    end


//end

end
endmodule

