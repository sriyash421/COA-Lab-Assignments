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
    input clk,reset,
    input [7:0]I0,
    input [7:0]I1,
    output reg cin,
    output reg [7:0]sum,
    output reg cout
);
    reg [3:0]count;
    always @(posedge reset) begin
        sum=8'b00000000; // reset the values
        cin=0;
        count=4'b0000;
    end
    
    always @(posedge clk) begin
        if(count < 4'b1000) begin
            sum[count] = I0[count] ^ I1[count] ^ cin; // SUM
            cout = (I0[count] & I1[count]) | (cin & (I0[count] ^ I1[count])); //CARRY
            cin = cout; // PROPAGATING CARRY
            count = count+1; //INCREASING COUNTER 
        end
    end
endmodule