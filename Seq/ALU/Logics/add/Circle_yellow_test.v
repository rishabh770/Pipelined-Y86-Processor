module Circle_yellow_test();

    reg a;
	reg b;
    reg c;
    reg d;

    wire p;
    wire g;

    Circle_yellow dut(.p_prev(a),.g_prev(b),.p_prev_two(c),.g_prev_two(d),.p(p),.g(g));

    initial
    begin
        $dumpfile("cir_yellow.vcd");
        $dumpvars(0,Circle_yellow_test);
        assign a = 1'b0;
        assign b = 1'b1;
        assign c = 1'b0;
        assign d = 1'b0;
        #50;
    end
    initial 
    begin
	    $monitor("a=%b\nb=%b\nc=%b\nd=%b\np=%b\ng=%b\n",a,b,c,d,p,g);
    end

endmodule