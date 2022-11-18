module add64_test();

    reg signed [63:0]a;
	reg signed [63:0]b;
    reg signed cin;
    wire signed [63:0]result;
    wire signed overflow;

    add_64bit dut(.a(a),.b(b),.cin(cin),.sum(result),.overflow(overflow));

    initial
    begin
        $dumpfile("add_out.vcd");
        $dumpvars(0,add64_test);
        //Case 1
        assign a = 64'b100111011110; 
        assign b = 64'b1101100101011;
        assign cin = 1'b0;
        #50;
        //Case 2
        assign a = 64'b001000011111001011010001100011100010;
        assign b = 64'b001000101001011011010011001001101010;
        assign cin = 1'b0;
        #50;
        //Case 3
        assign a = 64'b11010011;
        assign b = 64'b11010011;
        assign cin = 1'b0;
        #50;
        //Case 4
        assign a = 64'b1010101110101101011000100010101001010010101001010011;
        assign b = 64'b100010011010101010010101001111011010101010110101010;
        assign cin = 1'b0;
        #50;
        //Case 5
        assign a = 64'b1111111111111111111111111111111110110010010010000000000001010011;
        assign b = 64'b100010011010101010010101001111011010101010110101010;
        assign cin = 1'b0;
        #50;
        //Case 6
        assign a = 64'b1111111111111111111111111111111111111111111111111111111111100111;
        assign b = 64'b1111111111111111111111111111111111111111111111111111111111010100;
        assign cin = 1'b0;
        #50;
        //Case 7
        assign a = 64'b1111111111111111111111111111111111111111101011111111111111100111;
        assign b = 64'b11111111110110100011111111111111111100100;
        assign cin = 1'b0;
        #50;
        //Case 8
        assign a = 64'b1111111111101101011110010100110111001011111100110001110001011000;
        assign b = 64'b111111111101101000111111111111111111010100;
        assign cin = 1'b0;
        #50;
    end
    initial 
    begin
	    $monitor("a=%b\nb=%b\ny=%b\noverflow=%b\n",a,b,result,overflow);
    end

endmodule