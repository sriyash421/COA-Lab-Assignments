`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2020 01:42:05
// Design Name: 
// Module Name: two_comlement_tb
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


// Assignment - 4
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module two_comlement_tb;
reg x,clk, rst; 
wire z;
two_complement uut(.x(x), .clk(clk), .rst(rst), .z(z));       // initialize unit under test

initial
begin
     clk = 0;
     rst = 1;                // first reset our mealy machine 
     x = 0;                 // various inputs of leftmost bit 1 by one
     #100; 
                            // wait for initialization to finish 
     rst = 0;
     x = 0;
     
     # 10;
     x = 0;
     # 20;
     x = 1;
                  
     #20;
     x = 0;
    #5;
    x = 1;
    # 5;
    x = 0;
    #100;
    x = 1;
    # 10
    x = 1;
    # 20 ;
    $finish;         // finish and exit simulation
     
end

always
begin
#5
clk = ~clk;
$monitor ("time = ", $time , " clk = %d, rst = %d, x = %d, z  = %d", clk, rst, x, z);  // show output when any of the following changes
end

endmodule
