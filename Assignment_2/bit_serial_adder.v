`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 19:06:50
// Design Name: 
// Module Name: bit_serial_adder
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

module bit_serial_adder ( //8 bit serial adder
    clk,
    reset,
    a,
    b,
    cin,
    s,
    cout
);
    input clk, reset, a, b, cin;
    output reg s, cout;
    reg f, c;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            s = 0; // resetting the values
            f = 0;
        end
        else begin
            if(f) begin
                c = cin; // when adding bits for the first time
                f = 1;
            end
            else begin
                c = cout; // propagating the carry value
            end
            s = a ^ b ^ c; //required calculations
            cout = (a&b) | (c&(a^b));
        end
    end
endmodule