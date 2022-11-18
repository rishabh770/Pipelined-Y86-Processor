module f_reg(input clk , input [64:1] upred_PC, output reg [64:1]F_predPC);

initial begin
    F_predPC = 64'd30; 
end

always @(posedge clk)
begin
    F_predPC = upred_PC;
end
endmodule