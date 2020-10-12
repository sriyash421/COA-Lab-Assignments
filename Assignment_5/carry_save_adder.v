`timescale 1ns / 1ps
// Assignment - 5
// Problem  - 4
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module full_adder (
    input a,b,cin,
    output sum,carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (cin & b) | (a & cin);
endmodule

module carry_save_adder(
    input [15:0]a,
    input [15:0]b,
    input [15:0]c,
    output [17:0]sum
);
    wire [15:0]carry1;
    wire [15:0]carry2;
    wire [15:0]sum1;
    genvar i;
    generate
        for (i=0;i<=15;i= i+1) begin
            full_adder inst (.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum1[i]),.carry(carry1[i]));
        end
    endgenerate

    assign sum[0] = sum1[0];
    assign carry2[0] = 0;
    generate
        for (i=1;i<=15;i= i+1) begin
            full_adder inst (.a(sum1[i]),.b(carry1[i-1'b1]),.cin(carry2[i-1'b1]),.sum(sum[i]),.carry(carry2[i]));
        end
    endgenerate

    full_adder inst_ (.a(carry1[15]),.b(carry2[15]),.cin(1'b0),.sum(sum[16]),.carry(sum[17]));
endmodule