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
`include "bit_serial_adder.v"

module testBench_bit_serial_adder;  // test bench implementation 
    //INPUTS
    reg clk;
    reg reset;
    reg [7:0]I0;
    reg [7:0]I1;
    wire cin;

    // OUTPUTS
    wire [7:0] sum;
    wire cout;

    // initializing the module instance
    bit_serial_adder uut (
        .clk(clk), 
        .reset(reset), 
        .I0(I0), 
        .I1(I1), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    //generate clock with 10 ns clock period.
    always
        #5 clk = ~clk;
        
    initial begin  // various inputs 
        clk = 1;

        I0=8'b00000001;I1=8'b00000001;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b00000010;I1=8'b00000011;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b10000001;I1=8'b10000001;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b00011001;I1=8'b00110001;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b00000011;I1=8'b00000011;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b11111111;I1=8'b00000001;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b11111111;I1=8'b00000000;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        I0=8'b11111111;I1=8'b11111111;reset=1'b1;#10;reset=1'b0;#80;
        $display("sum=%d",sum);
        #10; $stop;
    end
endmodule