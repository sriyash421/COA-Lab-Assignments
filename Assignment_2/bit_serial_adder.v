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
            s = 0;
            f = 0;
        end
        else begin
            if(f) begin
                c = cin;
                f = 1;
            end
            else begin
                c = cout
            end
            s = a ^ b ^ c;
            cout = (a&b) | (c&(a^b))
        end
    end
endmodule