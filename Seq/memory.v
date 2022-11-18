module memory(clk, icode, valA, valB, valE, valM, dram_val);

input clk;
input [4:1]icode;
input [64:1] valA;
input [64:1] valB;
input [64:1] valC;
input [64:1] valE;
input [64:1] valP;

output reg [64:1] valM;
output reg [64:1]dram_val;
// output reg [64:1] ram_val;  // to check

reg [64:1] ram[1:1024];  //double it out

always @(*)
begin
    if(icode == 4'b0100) //rmmovq
    begin
        ram[valE] = valA;
        dram_val = ram[valE];
    end
    else if(icode == 4'b0101) //mrmovq
    begin
        valM = ram[valE];
        dram_val = valM;
    end
    else if(icode == 4'b1000) //call
    begin
        ram[valE] = valP;
        dram_val = ram[valE];
    end
    else if(icode == 4'b1001) //ret
    begin
        valM = ram[valA];
        dram_val = ram[valM];
    end
    else if(icode == 4'b1010) //pushq
    begin
        ram[valE] = valA;
        dram_val = ram[valE];
    end
    else if(icode == 4'b0100) //popq
    begin
        valM = ram[valA];
        dram_val = valM;
    end
end

endmodule
