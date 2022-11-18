module tb_fetch;

  reg clk;
  reg [63:0] pc;
  
  wire [3:0] icode;
  wire [3:0] ifun;
  wire [3:0] rA;
  wire [3:0] rB; 
  wire [63:0] valC;
  wire [63:0] valP;

  fetch dut(.clk(clk),.pc(pc),.icode(icode),.ifun(ifun),.rA(rA),
              .rB(rB),.valC(valC),.valP(valP));
  
  initial begin 
    clk=0;
    pc=64'd0;
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
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    // #15 clk=~clk;pc=valP;
    // #15 clk=~clk;
    
  end 
  
  initial 
		$monitor("clk=%d pc=%d icode=%b ifun=%b rA=%b rB=%b,valC=%d,valP=%d\n",clk,pc,icode,ifun,rA,rB,valC,valP);
endmodule