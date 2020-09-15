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

module bit_serial_adder_tb;
    reg clk,reset,a,b,cin;
    wire s,cout;
    
    bit_serial_adder inst_1 (.clk(clk),.reset(reset),.s(s),.cout(cout),.a(a),.b(b));

    initial begin
        clk = 0;
        #1 ;
        clk = ~ clk;
        reset = 0;
        forever #1 clk = ~ clk;
    end

    initial begin
        reset = 1; a=0; b=0; // adding 49 + 20
        #2; a = 1; b = 0; cin = 1;
        #2; a = 0; b = 0; cin = 0;
        #2; a = 0; b = 1; cin = 0;
        #2; a = 0; b = 0; cin = 0;
        #2; a = 1; b = 1; cin = 0;
        #2; a = 1; b = 0; cin = 0;
    end

    
endmodule
