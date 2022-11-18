module Square_red_test();

    reg a;
	reg b;

    wire p;
    wire g;

    Square_red dut(.a(a),.b(b),.p(p),.g(g));

    initial
    begin
        $dumpfile("sq_red.vcd");
        $dumpvars(0,Square_red_test);
        assign a = 1'b0;
        assign b = 1'b1;
        #50;
    end
    initial 
    begin
	    $monitor("a=%b\nb=%b\np=%b\ng=%b\n",a,b,p,g);
    end

endmodule