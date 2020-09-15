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

module bit_serial_adder (
    clk,
    reset,
    I1,
    I2,
    cin,
    O,
    cout
);
    input clk, reset, cin;
    input reg[7:0] I1;
    input reg[7:0] I2;
    input reg a,b;
    output reg[7:0] O;
    output reg s, cout;
    reg f, c, counter;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            s = 0;
            f = 0;
            counter = 0;
        end
        else begin
            if(f) begin
                c = cin;
                f = 1;
            end
            else begin
                c = cout;
            end
            a = I1[counter];
            b = I2[counter];
            s = a ^ b ^ c;
            cout = (a&b) | (c&(a^b));
            O[counter] = s;
            counter = counter + 1;
        end
    end
endmodule