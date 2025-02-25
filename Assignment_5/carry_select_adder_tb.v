`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2020 17:56:44
// Design Name: 
// Module Name: carry_select_adder_tb
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
// Problem  - 3
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040


module carry_select_adder_tb;
    //Inputs
    reg [15:0]I0;
    reg [15:0]I1;
    reg cin;
    //Output
    wire [16:0]out;
    //uut - unit under testing
    carry_select_adder uut (I0,I1,cin,out);

    //initialize inputs
    initial begin
        I0 = 0; I1 = 0; cin = 0;
        $monitor("I0=%d I1=%d sum=%d",I0,I1,out);

        #50; I0 = 16'b1110110000011100; I1 = 16'b1111111101000110;

        #50; I0 = 16'b0001110101111101; I1 = 16'b1101110101111000;

        #50; I0 = 16'b1101110110000011; I1 = 16'b0001010111011101;

        #50; I0 = 16'b0000000101100000; I1 = 16'b0011011010011110;

        #10; $stop;
    end
    
endmodule
