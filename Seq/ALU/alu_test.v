module alu_test();

    reg signed [1:0]sel;
    reg signed [63:0]a;
	reg signed [63:0]b;
    reg signed cin;
    wire signed [63:0]result;
    wire signed overflow;

    alu dut(.sel(sel),.a(a),.b(b),.cin(cin),.result(result),.overflow(overflow));

    initial
    begin
        $dumpfile("alu_out.vcd");
        $dumpvars(0,alu_test);
        assign sel = 2'b00;
        assign a = 64'b11100011110110101101101;
        assign b = 64'b11110100100100010000110;
        assign cin = 1'b0;
        #50;
        assign sel = 2'b01;
        assign a = 64'b1001000100010001000100010001000100010001000100010001000100010001;
        assign b = 64'b1110111011101110111011101110111011101110111011101110111011101110;
        assign cin = 1'b0;
        #50;
        assign sel = 2'b10;
        assign a = 64'b1111111111111111111111111111111111111111111111111111111111111100;
        assign b = 64'b1111111111111111111111111111111111111111111111111111111111111100;
        assign cin = 1'b0;
        #50;
        assign sel = 2'b11;
        assign a = 64'b0000001111111010010000000010101111111111000101001111110000000110;
        assign b = 64'b1111111111111111111110010000001001011111100100000001101011110001;
        assign cin = 1'b0;
        #50;
    end
    initial 
    begin
	    $monitor("a=%b\nb=%b\ny=%b\noverflow=%b\nselect=%b",a,b,result,overflow,sel);
    end

endmodule