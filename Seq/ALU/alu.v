// `include "Logics/add/Square_red.v"
// `include "Logics/add/Circle_green.v"
// `include "Logics/add/Circle_yellow.v"
// `include "Logics/add/add_64bit.v"
// `include "Logics/and/and_64bit.v"
// `include "Logics/xor/xor_64bit.v"
// `include "Logics/sub/sub_64bit.v"

module alu (
    input [1:0]sel,
    input signed [63:0]a,
    input signed [63:0]b,
    input signed cin,
    output signed [63:0]result,
    output signed overflow
);

wire signed [63:0]result_add;
wire signed [63:0]result_sub;
wire signed [63:0]result_and;
wire signed [63:0]result_xor;
wire signed overflow_add;
wire signed overflow_sub;

reg overflow_reg;
reg [63:0]result_reg;

  add_64bit s1(a,b,1'b0,result_add,overflow_add); 
  sub_64bit s2(a,b,1'b0,result_sub,overflow_sub);
  and_64bit s3(a,b,result_and);
  xor_64bit s4(a,b,result_xor);

always @(*)
    begin
        case (sel)
        2'b00 : 
            begin
                overflow_reg = overflow_add;
                result_reg = result_add;
            end
        2'b01 :
            begin
                overflow_reg = overflow_sub;
                result_reg = result_sub;
            end
        2'b10 : 
            begin
                overflow_reg = 1'b0;
                result_reg = result_and;
            end
        2'b11 :
            begin
                overflow_reg = 1'b0;
                result_reg = result_xor;
            end 
        endcase
    end
    assign overflow = overflow_reg;
    assign result = result_reg;
endmodule