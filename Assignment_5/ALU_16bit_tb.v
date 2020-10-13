`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2020 00:10:19
// Design Name: 
// Module Name: ALU_16bit_tb
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


module ALU_16bit_tb;
    reg [15:0] A, B;  // A and B are operands 
    reg [3:0] S;     // S is the control input 
    reg cin, M;     // cin is the input carry(note that it is opposite to the usual convention) , M is the logic selector
    wire [15:0] F;   // F is the output
    wire cout;      // cout is the output carry (opposiite convention)
    ALU_16bit a1(A,B,M,S,F,cin,cout);        // initializing the module instance 
    initial begin      // various inputs     // the outputs are represented in 2 complement's form 
    $monitor ("time = ", $time , " A = %d, B = %d, M = %d, S  = %d, F = %d, cin = %d, cout = %d", A, B, M, S, F, cin , cout);  // show output when any of the following changes
    
    #10 A = 3; B = 1;
    M = 1;
    cin = 0;
    S = 12;
    #10 A = 9; B = 13;
    M = 1;
    cin = 1;
    S = 0;
    #10 A = 1; B = 5;
    M = 0;
    cin = 0;
    S = 2;
    #10 A = 84; B = 248;
    M = 1;
    cin = 0;
    S = 7;
    #10 A = 141; B = 118;
    M = 0;  
    cin = 1;
    S = 3;
    #10 A = 51; B = 159;
    M = 1;
    cin = 0;
    S = 6;
    #10 A = 23858; B = 20493;
    M = 0;
    cin = 1;
    S = 8;
    #10 A = 12451; B = 5642;
    M = 1;
    cin = 1;
    S = 5;
    #10 A = 41751; B = 43096;
    M = 1;
    cin = 0;
    S = 4;
    #10 A = 48555; B = 36018;
    M = 1;
    cin = 0;
    S = 9;
     #10 $stop;           // finish after 10 time steps 
     $finish;
    end 
   
endmodule