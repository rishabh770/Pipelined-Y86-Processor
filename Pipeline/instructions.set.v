##instructions

#set 1

//irmove
    instr_mem[30]=8'b00010000;
    instr_mem[31]=8'b00010000;
    instr_mem[32]=8'b00110000;
    instr_mem[33]=8'b11110011;  //5 to 6 
    instr_mem[34]=8'b00011001; 
    instr_mem[35]=8'b00000000; 
    instr_mem[36]=8'b00000000;
    instr_mem[37]=8'b00000000; 
    instr_mem[38]=8'b00000000; 
    instr_mem[39]=8'b00000000; 
    instr_mem[40]=8'b00000000; 
    instr_mem[41]=8'b00000000;
    instr_mem[42]=8'b00010000;
    instr_mem[43]=8'b00010000;
//irmove
    instr_mem[44]=8'b00110000;
    instr_mem[45]=8'b11110110;  //5 to 6 
    instr_mem[46]=8'b00001001; 
    instr_mem[47]=8'b00000000; 
    instr_mem[48]=8'b00000000;
    instr_mem[49]=8'b00000000; 
    instr_mem[50]=8'b00000000; 
    instr_mem[51]=8'b00000000; 
    instr_mem[52]=8'b00000000; 
    instr_mem[53]=8'b00000000;
//irmove
    instr_mem[54]=8'b00110000;
    instr_mem[55]=8'b11110111;  //5 to 6 
    instr_mem[56]=8'b00001111; 
    instr_mem[57]=8'b00000000; 
    instr_mem[58]=8'b00000000;
    instr_mem[59]=8'b00000000; 
    instr_mem[60]=8'b00000000; 
    instr_mem[61]=8'b00000000; 
    instr_mem[62]=8'b00000000; 
    instr_mem[63]=8'b00000000;
//subq
    instr_mem[64]=8'b01100001;
    instr_mem[65]=8'b01100111;

    instr_mem[66]=8'b00010000;
    instr_mem[67]=8'b00010000;
    instr_mem[68]=8'b00010000;
    instr_mem[69]=8'b00000000;


#set2

//irmove
    instr_mem[30]=8'b00010000;
    instr_mem[31]=8'b00010000;
    instr_mem[32]=8'b00110000;
    instr_mem[33]=8'b11110100; 
    instr_mem[34]=8'b00000100; 
    instr_mem[35]=8'b00000000; 
    instr_mem[36]=8'b00000000;
    instr_mem[37]=8'b00000000; 
    instr_mem[38]=8'b00000000; 
    instr_mem[39]=8'b00000000; 
    instr_mem[40]=8'b00000000; 
    instr_mem[41]=8'b00000000;

    instr_mem[42]=8'b00010000;
    instr_mem[43]=8'b00010000;
//rmmove
    instr_mem[44]=8'b01000000; 
    instr_mem[45]=8'b01000011; 
    instr_mem[46]=8'b00000010; 
    instr_mem[47]=8'b00000000; 
    instr_mem[48]=8'b00000000;
    instr_mem[49]=8'b00000000; 
    instr_mem[50]=8'b00000000; 
    instr_mem[51]=8'b00000000;
    instr_mem[52]=8'b00000000;
    instr_mem[53]=8'b00000000;

    instr_mem[54]=8'b00010000;
    instr_mem[55]=8'b00010000;
    instr_mem[56]=8'b00010000;
    instr_mem[57]=8'b00010000;
    instr_mem[58]=8'b00010000;
    instr_mem[59]=8'b00010000;
    instr_mem[60]=8'b00000000; 

#set3

//irmove
    instr_mem[30]=8'b00010000;
    instr_mem[31]=8'b00010000;
    instr_mem[32]=8'b00110000;
    instr_mem[33]=8'b11110100; 
    instr_mem[34]=8'b00000100; 
    instr_mem[35]=8'b00000000; 
    instr_mem[36]=8'b00000000;
    instr_mem[37]=8'b00000000; 
    instr_mem[38]=8'b00000000; 
    instr_mem[39]=8'b00000000; 
    instr_mem[40]=8'b00000000; 
    instr_mem[41]=8'b00000000;

    instr_mem[42]=8'b00010000;
    instr_mem[43]=8'b00010000;
//rmmove
    instr_mem[44]=8'b01000000; 
    instr_mem[45]=8'b01000011; 
    instr_mem[46]=8'b00000010; 
    instr_mem[47]=8'b00000000; 
    instr_mem[48]=8'b00000000;
    instr_mem[49]=8'b00000000; 
    instr_mem[50]=8'b00000000; 
    instr_mem[51]=8'b00000000;
    instr_mem[52]=8'b00000000;
    instr_mem[53]=8'b00000000;
    instr_mem[54]=8'b00010000;
    instr_mem[55]=8'b00010000;
//mrmove
    instr_mem[56]=8'b01010000; 
    instr_mem[57]=8'b01110011; 
    instr_mem[58]=8'b00000010; 
    instr_mem[59]=8'b00000000; 
    instr_mem[60]=8'b00000000;
    instr_mem[61]=8'b00000000; 
    instr_mem[62]=8'b00000000; 
    instr_mem[63]=8'b00000000;
    instr_mem[64]=8'b00000000;
    instr_mem[65]=8'b00000000;

    instr_mem[66]=8'b00010000;
    instr_mem[67]=8'b00010000;
    instr_mem[68]=8'b00010000;
    instr_mem[69]=8'b00010000;
    instr_mem[70]=8'b00010000; 
    instr_mem[71]=8'b00000000;  

#set4

    instr_mem[30]=8'b00010000;
    instr_mem[31]=8'b00010000;
//irmove
    instr_mem[32]=8'b00110000;
    instr_mem[33]=8'b11110100; //%7 to 4
    instr_mem[34]=8'b00000111; 
    instr_mem[35]=8'b00000000; 
    instr_mem[36]=8'b00000000;
    instr_mem[37]=8'b00000000; 
    instr_mem[38]=8'b00000000; 
    instr_mem[39]=8'b00000000; 
    instr_mem[40]=8'b00000000; 
    instr_mem[41]=8'b00000000;

//irmove
    instr_mem[42]=8'b00110000;
    instr_mem[43]=8'b11110110;  //5 to 6 
    instr_mem[44]=8'b00000101; 
    instr_mem[45]=8'b00000000; 
    instr_mem[46]=8'b00000000;
    instr_mem[47]=8'b00000000; 
    instr_mem[48]=8'b00000000; 
    instr_mem[49]=8'b00000000; 
    instr_mem[50]=8'b00000000; 
    instr_mem[51]=8'b00000000;

//subq
    instr_mem[52]=8'b01100001;
    instr_mem[53]=8'b01000110;

    
//cmovl
    instr_mem[54]=8'b00010000;
    instr_mem[55]=8'b00010000;
    instr_mem[56]=8'b00100010; 
    instr_mem[57]=8'b01000101; 
    instr_mem[58]=8'b00010000;

    instr_mem[59]=8'b00010000;
    instr_mem[60]=8'b00010000;
    instr_mem[61]=8'b00000000;
