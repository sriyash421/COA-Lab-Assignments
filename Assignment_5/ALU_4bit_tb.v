`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2020 20:22:25
// Design Name: 
// Module Name: ALU_4bit_tb
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
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040


module ALU_4bit_tb;
   reg [3:0] A;
    reg [3:0] B;
    reg [3:0] S;    
    reg cin, M;
    wire [3:0] F;
    wire cout;
    ALU_4bit a1(A,B,M,S,F,cin,cout);        // initializing the module instance 
    initial begin      // various inputs 
    M = 1'b0;
    S = 4'b0001;
    cin = 0;
    $monitor ("time = ", $time , " A = %d, B = %d, M = %d, S  = %d, F = %d, cin = %d, cout = %d", A, B, M, S, F, cin , cout);  // show output when any of the following changes
    #10 A=4'b0001;B=4'b0001;
  
    #10 A=4'b0101;B=4'b0101;
    
    #10 A=4'b0010;B=4'b0011;
    
    #10 A=4'b0001;B=4'b0101;
    
    #10 A=4'b1001;B=4'b0001;
    
    #10 A=4'b0011;B=4'b0011;
    
    #10 A=4'b1111;B=4'b0001;
    
    #10 A=4'b1111;B=4'b0100;
    
    #10 A=4'b1111;B=4'b1111;
 
     #10 $stop;           // finish after 10 time steps 
     $finish;
    end 
    
    
    

endmodule
