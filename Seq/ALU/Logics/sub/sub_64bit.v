// `include "../add/add_64bit.v"
// `include "../add/Square_red.v"
// `include "../add/Circle_green.v"
// `include "../add/Circle_yellow.v"

module sub_64bit(a,b,cin,result,overflow);

input signed [64:1]a;
input signed [64:1]b;
input signed cin;
output signed [64:1]result;
output signed overflow;

wire [64:1]k;
wire carry1;
wire [64:1]bcomp;
assign k = 64'b1;
assign carry1 = 1'b0;
wire [64:1]b2s;
genvar i;
generate for(i=1;i<65;i=i+1)
        begin
            not(bcomp[i],b[i]);
        end
endgenerate

add_64bit A1(k,bcomp,carry1,b2s,c);

add_64bit A2(b2s,a,cin,result,overflow);

endmodule 