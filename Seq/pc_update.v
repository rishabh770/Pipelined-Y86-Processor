module pc_update(
    input clk,
    input [4:1] icode,
    input cnd,
    input [64:1] valC,
    input [64:1] valM,
    input [64:1] valP,
    output reg [64:1] new_pc
);

always @(*)
begin


    if(icode==4'b0111) //jxx
    begin
      if(cnd==1'b1)
        begin
          new_pc=valC;
        end
      else
        begin
          new_pc=valP;
        end
    end
    else if(icode==4'b1000) //call
      begin
        new_pc=valC;
      end
    else if(icode==4'b1001) //ret
      begin
        new_pc=valM;
      end
    else
      begin
        new_pc=valP;
      end
    end

endmodule