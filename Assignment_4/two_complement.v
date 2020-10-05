`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2020 01:15:48
// Design Name: 
// Module Name: two_complement
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

// Assignment - 4
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module two_complement(x, clk, rst, z            
    );
input x, clk, rst;
output reg z;
parameter S0 = 0, S1 = 1;        // S0 : we are yet to see first 1, S1 : we have already seen out first 1 
reg [0:1]  PS, NS;
always @ (posedge clk)       
if (rst) begin
    PS <= S0;       // reset to state 0 
    NS <= S0;       
   end
else begin
    PS <= NS;       // else update present state as next state
    end

always @(PS or x)   // whenever input or state changes
    case (PS)
    S0 : begin                  // if I have not 
        z <= x;
        NS <= S1;              // whenever I encounter my first one start changing every new bit to z = !x
        end
    S1 : begin
        z <= !x;               // We have already encountered a 1 hence always z = !x
        NS <= S1;
        end
    default: begin               // invalid input hence reset my state 
        NS <= S0;
        z <= 0;
        end
    endcase


endmodule
