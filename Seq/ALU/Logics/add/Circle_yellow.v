module Circle_yellow(
    output signed p,
    output signed  g,
    
    input signed p_prev,
    input signed g_prev,

    input signed p_prev_two,
    input signed g_prev_two);

wire g_inter;

and(p,p_prev,p_prev_two);

and(g_inter,p_prev,g_prev_two);
or(g,g_prev,g_inter);

endmodule