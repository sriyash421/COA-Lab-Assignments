`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2020 19:27:17
// Design Name: 
// Module Name: multiple_of_three
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
// Problem  - 2
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module multiple_of_three(x, clk, rst, z
    );
input x, clk, rst;                         
output reg z;
parameter S0 = 0, S1 = 1, S2 = 2;        // States show my current modulo 3 so if my PS == S0 z = 1 else 0
reg [1:0] PS, NS, MUL, NMUL;            // MUL stores my current 2^i modulo 3 so when a new bit  = 1 comes I add MUL to me present modulo 
always @ (posedge clk)                  // NS and NMUL store my corresponding moduli of next states
if (rst) begin                         // reset every modulo to 0
    PS <= S0;
    NS <= S0;
    MUL<=S1;
    NMUL <= S1;
   end
else begin                           // update my present state and multiplicand from  next
    PS <= NS;
    MUL <= NMUL;
    end
always @ (PS , x)
begin
    case (PS)
    S0 : begin
        if(x)                          // if x modulo becomes 0 + MUL = MUL and z becomes 0
            begin
                NS <= MUL;
                z <= 0;
            end
        end
    S1 : begin
        if(x) 
            begin
                NS <= (MUL == 1)?S2:S0;        // if x modulo increases by 1 or 2 depending on MUL value
                z <= (MUL == 1)?0:1;
            end
        end
    S2 : begin
        if(x) 
            begin
                NS <= (MUL == 1)?S0:S1;          // if x modulo increases by 1 or 2 depending on MUL value
                z <= (MUL == 1)?1:0;
            end
        end
    default: begin                    // if invalid input reset everything
        NS <= S0;
        z <= 1;
        end
    endcase
    if(MUL == S1) NMUL <= S2;            // if modulo = 1 then it becomes (2*1)%3 = 2
    else NMUL <= S1;                    // if modulo = 2 then it becomes (2*2)%3 = 1
    
end
    
endmodule
