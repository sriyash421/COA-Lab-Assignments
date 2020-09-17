`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 19:23:20
// Design Name: 
// Module Name: bit_serial_adder_tb
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
// Problem  - 3
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module bit_serial_adder_tb; // test bench implementation 
    reg [7:0] I1;
    reg [7:0] I2;
    reg [7:0] O;
    reg clk,reset,a,b,cin;
    wire s,cout;
    
    bit_serial_adder inst_1 (.clk(clk),.reset(reset),.s(s),.cout(cout),.a(a),.b(b)); // initializing the module instance 

    initial begin
        clk = 0;
        #1 ;
        clk = ~ clk;
        reset = 0;
        forever #1 clk = ~ clk;
    end

    initial begin
        I1 = 2'b00110001; // various inputs 
        I2 = 2'b00010100;
        reset = 1; a=0; b=0; // adding 49 + 20
        #2;        a = I1[0]; b = I2[0]; cin = 1;
        #2;O[0]=s; a = I1[1]; b = I2[1]; cin = 0;
        #2;O[1]=s; a = I1[2]; b = I2[2]; cin = 0;
        #2;O[2]=s; a = I1[3]; b = I2[3]; cin = 0;
        #2;O[3]=s; a = I1[4]; b = I2[4]; cin = 0;
        #2;O[4]=s; a = I1[5]; b = I2[5]; cin = 0;
        #2;O[5]=s; a = I1[6]; b = I2[6]; cin = 0;
        #2;O[6]=s; a = I1[7]; b = I2[7]; cin = 0;
        #2;O[7]=s;
    end
endmodule
