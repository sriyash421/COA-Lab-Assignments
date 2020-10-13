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

module csa_block( // CSA block to generate C and S at each node
    input [22:0]a,
    input [22:0]b,
    input [22:0]c,
    output [22:0]sum,
    output [22:0]cout
);
    wire [22:0]temp_cout;
    genvar i;
    generate
        for (i=0;i<=22;i= i+1) begin
            full_adder inst (.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.carry(temp_cout[i]));
        end
    endgenerate
    assign cout = temp_cout << 1; //Shifting the carry by one bit per level of CSA
endmodule

module carry_save_adder ( //module to add 9 numbers
    input [22:0]I0,
    input [22:0]I1,
    input [22:0]I2,
    input [22:0]I3,
    input [22:0]I4,
    input [22:0]I5,
    input [22:0]I6,
    input [22:0]I7,
    input [22:0]I8,
    output [22:0]out
);
    wire [22:0] cout[6:0];
    wire [22:0] sum[6:0];
    // Building the tree
    csa_block inst_0 (I2,I1,I0,sum[0],cout[0]);

    csa_block inst_1 (I3,I4,I5,sum[1],cout[1]);

    csa_block inst_2 (I6,I7,I8,sum[2],cout[2]);
    
    csa_block inst_3 (sum[0],sum[1],sum[2],sum[3],cout[3]);

    csa_block inst_4 (cout[0],cout[1],cout[2],sum[4],cout[4]);

    csa_block inst_5 (sum[4],cout[4],cout[3],sum[5],cout[5]);

    csa_block inst_6 (sum[3],sum[5],cout[5],sum[6],cout[6]);

    //Final sum
    assign out = sum[6] + cout[6];
endmodule

