`timescale 1ns / 1ps
// Assignment - 3
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module partial_product (
    input [5:0]a,
    input [5:0]b,
    input [4:0]i,
    output[11:0]product
);
    assign product = (a&{5{b[i]}}) << i;
endmodule

module unsigned_array_mult ( // 5x5 bit array multiplier
    input [5:0]a,
    input [5:0]b,
    output [11:0]product
);
    wire [11:0]partial_product[5:0];
    genvar i;
    generate
        for (i=0;i<=5;i= i+1) begin
            partial_product inst (.product(partial_product[i]),.a(a),.b(b),.i(i)); //generating partial products for each bit
        end
    endgenerate
    // taking the final sum
    assign product = partial_product[0]+partial_product[1]+partial_product[2]+partial_product[3]+partial_product[4]+partial_product[5];
endmodule