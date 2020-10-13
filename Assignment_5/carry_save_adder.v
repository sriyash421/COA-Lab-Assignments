`timescale 1ns / 1ps
// Assignment - 5
// Problem  - 4
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module full_adder ( //Full adder to generate C and S
    input a,b,cin,
    output sum,carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (cin & b) | (a & cin);
endmodule

module cla_adder (
    input [19:0]a,
    input [19:0]b,
    output [19:0]sum
);
    wire c1,c2,c3,c4,c5;

    cla_adder_4bit cla1 (a[3:0],   b[3:0],   1'b0, sum[3:0],   c1);
    cla_adder_4bit cla2 (a[7:4],   b[7:4],   c1,   sum[7:4],   c2);
    cla_adder_4bit cla3 (a[11:8],  b[11:8],  c2,   sum[11:8],  c3);
    cla_adder_4bit cla4 (a[15:12], b[15:12], c3,   sum[15:12], c4);
    cla_adder_4bit cla5 (a[19:16], b[19:16], c4,   sum[19:16], c5);
    
endmodule

module cla_adder_4bit (
    input [3:0] a,b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] p,g,c;
 
    assign p=a^b;//propagate
    assign g=a&b; //generate
    
    assign c[0]=cin;
    assign c[1]= g[0]|(p[0]&c[0]);
    assign c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
    assign c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
    assign cout= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&p[0]&c[0];
    assign sum=p^c;

endmodule

module csa_block( // CSA block to generate C and S at each node
    input [19:0]a,
    input [19:0]b,
    input [19:0]c,
    output [19:0]sum,
    output [19:0]cout
);
    wire [19:0]temp_cout;
    genvar i;
    generate
        for (i=0;i<=19;i= i+1) begin
            full_adder inst (.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.carry(temp_cout[i]));
        end
    endgenerate
    assign cout = temp_cout << 1; //Shifting the carry by one bit per level of CSA
endmodule

module carry_save_adder ( //module to add 9 numbers
    input [19:0]I0,
    input [19:0]I1,
    input [19:0]I2,
    input [19:0]I3,
    input [19:0]I4,
    input [19:0]I5,
    input [19:0]I6,
    input [19:0]I7,
    input [19:0]I8,
    output [19:0]out
);
    wire [19:0] cout[6:0];
    wire [19:0] sum[6:0];
    // Building the tree
    csa_block inst_0 (I2,I1,I0,sum[0],cout[0]);

    csa_block inst_1 (I3,I4,I5,sum[1],cout[1]);

    csa_block inst_2 (I6,I7,I8,sum[2],cout[2]);
    
    csa_block inst_3 (sum[0],sum[1],sum[2],sum[3],cout[3]);

    csa_block inst_4 (cout[0],cout[1],cout[2],sum[4],cout[4]);

    csa_block inst_5 (sum[4],cout[4],cout[3],sum[5],cout[5]);

    csa_block inst_6 (sum[3],sum[5],cout[5],sum[6],cout[6]);

    //Final sum
    cla_adder final_adder (sum[6], cout[6], out);
endmodule

