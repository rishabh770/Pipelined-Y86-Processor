module xor_64bit(
    input signed [64:1]a,
    input signed [64:1]b,
    output signed [64:1]result
);

genvar i;
generate 
    for(i = 1; i < 65; i = i + 1) 
        xor g1(result[i],a[i],b[i]);
endgenerate

endmodule
