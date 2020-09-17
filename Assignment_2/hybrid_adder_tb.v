`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 19:23:20
// Design Name: 
// Module Name: hybrid_adder_tb
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



module hybrid_adder_tb;     // test bench implementation 
    reg [7:0] a;
    
    reg [7:0] b;
    
    reg cin;
    
    wire [7:0] sum;
    
    wire cout;
    hybrid_adder ha(a,b,cin,sum,cout);        // initializing the module instance 
    
    initial begin      // various inputs 
    
    #10 a=8'b00000001;b=8'b00000001;cin=1'b0;
    
    #10 a=8'b00000001;b=8'b00000001;cin=1'b1;
    
    #10 a=8'b00000010;b=8'b00000011;cin=1'b0;
    
    #10 a=8'b10000001;b=8'b10000001;cin=1'b0;
    
    #10 a=8'b00011001;b=8'b00110001;cin=1'b0;
    
    #10 a=8'b00000011;b=8'b00000011;cin=1'b1;
    
    #10 a=8'b11111111;b=8'b00000001;cin=1'b0;
    
    #10 a=8'b11111111;b=8'b00000000;cin=1'b1;
    
    #10 a=8'b11111111;b=8'b11111111;cin=1'b0;
    
     #10 $stop;           // finish after 10 time steps 
    end
endmodule
