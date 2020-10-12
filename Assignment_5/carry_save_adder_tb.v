`timescale 1ns / 1ps
// Assignment - 5
// Problem  - 3
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040
`include "carry_save_adder.v"

module carry_save_adder_tb;

    reg [15:0]I0;
    reg [15:0]I1;
    reg [15:0]I2;

    wire [17:0]out;

    carry_save_adder uut (I0,I1,I2,out);

    initial begin
        I0 = 0; I1 = 0; I2=0;
        $monitor("I0=%d I1=%d I2=%d sum=%d",I0,I1,I2,out);

        #100; I0 = 16'b1110110000011100; I1 = 16'b1111111101000110; I2 = 16'b0000000101100000;

        #10; $stop;
    end
    
endmodule