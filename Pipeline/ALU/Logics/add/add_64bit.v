// `include "Square_red.v"
// `include "Circle_green.v"
// `include "Circle_yellow.v"

module add_64bit (
    input signed [63:0]a,
    input signed [63:0]b,
    input signed cin,
    output signed [63:0]sum,
    output signed overflow);

wire P[63:0][6:0], G[63:0][6:0], inter[63:0],inter_g1,inter_g2;

genvar s;
genvar i;
genvar k;
genvar m;

generate
    for (s = 0; s < 64; s = s + 1)
    begin
        Square_red s1(P[s][0], G[s][0], a[s], b[s]);
    end
    
    for (k = 1; k < 7; k = k + 1)
    begin
        for (i = 0; i < 64; i = i + 1)
        begin
            if(i < 2**(k-1))
                Circle_green c1(P[i][k], G[i][k], P[i][k-1], G[i][k-1]);
            else
                Circle_yellow c2(P[i][k], G[i][k], P[i][k-1], G[i][k-1], P[i-(2**(k-1))][k-1], G[i-(2**(k-1))][k-1]);
        end
    end
        xor x2(sum[0],P[0][0],cin);
        for (m = 0; m < 63; m = m + 1)
        begin
            buf b1(inter[m],G[m][6]);
            xor x1(sum[m+1],inter[m],P[m+1][0]);
        end
        
        buf(inter_g1,G[62][6]);
        buf(inter_g2,G[63][6]);
        xor x3(overflow,inter_g1,inter_g2);

endgenerate


endmodule
