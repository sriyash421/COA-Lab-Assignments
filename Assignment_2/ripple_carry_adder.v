`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 15:21:34
// Design Name: 
// Module Name: ripple_carry_adder
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

module adder(a, b, cin , sum , cout);
    input a, b, cin;
    output sum, cout;
    assign sum = (a^b^cin);
    assign cout = ((a&b) | ((b&cin) | (cin & a)));
endmodule

module ripple_carry_adder(a, b, cin , sum , cout);
    input [7:0]a;
    input [7:0]b;
    input cin;
    output [7:0]sum;
    output cout;
    wire [6:0]carry;
    adder a0(a[0], b[0], cin , sum[0], carry[0]);
    adder a1(a[1], b[1], carry[0] , sum[1], carry[1]);
    adder a2(a[2], b[2], carry[1] , sum[2], carry[2]);
    adder a3(a[3], b[3], carry[2] , sum[3], carry[3]);
    adder a4(a[4], b[4], carry[3] , sum[4], carry[4]);
    adder a5(a[5], b[5], carry[4] , sum[5], carry[5]);
    adder a6(a[6], b[6], carry[5] , sum[6], carry[6]);
    adder a7(a[7], b[7], carry[6] , sum[7], cout);
    

endmodule
