`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2020 19:53:05
// Design Name: 
// Module Name: multiple_of_three_tb
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
// Problem  - 2
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module multiple_of_three_tb;
reg clk, rst, x;
wire z;
multiple_of_three uut(.clk(clk), .rst(rst), .x(x), .z(z));       // initialize module object

initial
begin
     clk = 0;
     rst = 1;      // reset all the inputs and states
     x = 0;
     #100;          // wait for initialization to finish
     
     rst = 0;
     x = 0;
     
     # 10;             // provide various inputs from LSB side
     x = 0;
     # 10;
     x = 1;
     
     #10;
     x = 0;
    #5;
    x = 1;
    # 5;
    x = 0;
    #10;
    x = 1;
    # 10
    x = 1;
    # 20 ;
    $finish;           // finish and exit simulation
     
end

always
begin
    #5
    clk = ~clk;
    $monitor ("time = ", $time , " clk = %d, rst = %d, x = %d, z  = %d", clk, rst, x, z); // print when any of the following changes 
end
endmodule
