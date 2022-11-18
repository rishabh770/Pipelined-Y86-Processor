module Circle_green(
    output signed p,
    output signed g,
    input signed p_prev,
    input signed g_prev
);

wire p_inter,g_inter;

not(p_inter,p_prev);
not(p,p_inter);

not(g_inter,g_prev);
not(g,g_inter);

endmodule