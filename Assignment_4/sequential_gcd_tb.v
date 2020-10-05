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
`include "sequential_gcd.v"


`timescale 1ns / 1ps

module sequential_gcd_tb;
    //INPUTS
    reg clk,reset,load_val,done;
    reg [15:0]din;
    reg [7:0]A,B;
    

    wire load_in,out_val;
    wire [7:0]dout;
    // initializing the module instance
    // unit under test = unsigned_array_mult
    gcd uut(
        .clk(clk),
        .load_val(load_val),
        .done(done),
        .din(din),
        .load_in(load_in),
        .out_val(out_val),
        .dout(dout)  
    );

    always 
        begin
            #2 clk=~clk;
        end
    initial
    
    begin
        //monitor
        $monitor("time=%t,a=%d,b=%d,out=%d",$time,A,B,dout);
        //intialisation to S0
        clk=0;
        A = 8'dx;
        B = 8'dx;
        reset=1;
        load_val=0;
        done=0;
        din = {A,B};

        #100;
        //calculating GCD for 143 and 91
        A = 143;
        B = 91;
        reset = 0;
        load_val=1;
        done=0;
        din = {A,B};
        #50; $stop;
    end
    
endmodule