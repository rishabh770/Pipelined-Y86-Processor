module Circle_green_test();

    reg a;
	reg b;

    wire p;
    wire g;

    Circle_green dut(.p_prev(a),.g_prev(b),.p(p),.g(g));

    initial
    begin
        $dumpfile("cir_green.vcd");
        $dumpvars(0,Circle_green_test);
        assign a = 1'b0;
        assign b = 1'b1;
        #50;
    end
    initial 
    begin
	    $monitor("a=%b\nb=%b\np=%b\ng=%b\n",a,b,p,g);
    end

endmodule