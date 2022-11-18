module Square_red(
    output signed p,
    output signed g,
    input signed a,
    input signed b
);

xor(p,a,b);
and(g,a,b);

endmodule