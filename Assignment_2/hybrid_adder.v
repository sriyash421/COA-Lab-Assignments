`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 19:06:50
// Design Name: 
// Module Name: hybrid_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



// Assignment - 2
// Problem  - 2
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040



 module CLA_Adder(a, b, cin, sum, cout);  // 4 bit carry look ahead adder
    input[3:0] a,b;
    input cin;
    output [3:0] sum;
    output cout;
    wire p0, p1, p2, p3, g0, g1, g2, g3, c1, c2, c3, c4;
    assign p0 = (a[0]^b[0]), 
    p1 = (a[1]^b[1]),                              // assigning the propagating values
    p2 = (a[2]^b[2]), 
    p3 = (a[3]^b[3]);
    assign g0 = (a[0]&b[0]),                       // assigning the generating values 
    g1 = (a[1]&b[1]), 
    g2 = (a[2]&b[2]), 
    g3 = (a[3]&b[3]);
    assign c0 = cin, 
    c1 = g0|(p0&cin),                               // assigning the c values using g and p
    c2 = g1|(p1&g0)|(p1&p0&cin), 
    c3 = g2|(p2&g1)|(p2&p1&g0)|(p1&p1&p0&cin), 
    c4 = g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
    assign sum[0] = p0^c0,
    sum[1] = p1^c1,                                      // calculating sum using pi ^ ci 
    sum[2] = p2^c2,
    sum[3] = p3^c3;
    assign cout= c4;
endmodule

module hybrid_adder(a, b, cin , sum, cout);  // 8 bit hybrid adder using two 4 bit carry look ahead adders
input [7:0] a, b;
input cin;
output [7:0]sum;
output cout;
wire c0;
CLA_Adder a0(a[3:0], b[3:0], cin , sum[3:0], c0);                // instance for 4 lsb 
CLA_Adder a1(a[7:4], b[7:4], c0, sum[7:4], cout);                // instance for 4 msb
endmodule
