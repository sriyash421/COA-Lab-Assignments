`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2020 23:55:05
// Design Name: 
// Module Name: ALU_16bit
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
// Assignment - 5
// Problem  - 2
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040


module ALU_16bit( A, B, M, S, F , cin , cout);

input M, cin;
input [15:0] A, B;
input [3:0]S;
output [15:0] F;
output cout;
wire [2:0]carry;    // to store the ripple carries generated.
ALU_4bit b0(A[3:0], B[3:0] , M, S, F[3:0], cin ,carry[0]);    // 4 different instances of the 4 bit ALU unit 
ALU_4bit b1(A[7:4], B[7:4] , M, S, F[7:4], carry[0] ,carry[1]);
ALU_4bit b2(A[11:8], B[11:8] , M, S, F[11:8], carry[1] ,carry[2]);
ALU_4bit b3(A[15:12], B[15:12] , M, S, F[15:12], carry[2] ,cout);

endmodule
