`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2020 00:07:08
// Design Name: 
// Module Name: unsigned_seq_mult_LS
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
// Assignment - 3
// Problem  - 2
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040


module unsigned_seq_mult_LS(clk, rst, load, a, b, product);
input clk, rst, load;     // rst set everything to 0 and load is to load the current value of a and b
input [5:0] a, b;
output reg [12:0] product;    // stores the result

reg [5:0] A, B;    // registers to store the current values present in A and B
reg [2:0] ctr;     // ctr to keep track of the bit position we are in 
reg [12:0] temp;   // temp register to store the value of left shifted B 

always @(posedge clk, posedge rst, posedge load) begin   // on positive edge of clock , reset or load
    if(rst) begin        // if reset set everything to 0
        
        A <= 0;
        B <= 0;
        product <= 0;
        ctr <= 0;
     
     end
     
     else if(load) begin      // if load then load everything into A and B registers 
        
        A <= a;
        B <= b;
        ctr <= 0;
        product <= 0;
     
     end
     
     else if(ctr < 6) begin    // run this loop 6 times 
     
        if(A[0]) temp = B<<ctr;       // if current bit value is 1 then add B << 6
        else temp = 0;             // else add 0 
        product <= (product + temp);    //non blocking assignment to // P(i+1) = P(i) + X(i)*store_b*2^i 
        ctr <= ctr + 1 ;                  // increase the counter
        A <= A >> 1;                   // right shift A to bring the new bit at 0th location
        
     end
end

endmodule
