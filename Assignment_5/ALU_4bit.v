`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2020 17:45:36
// Design Name: 
// Module Name: ALU_4bit
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

// Assignment - 5
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040


 module CLA_Adder(a, b, cin, sum, cout);  // 4 bit carry look ahead adder
    input[3:0] a,b;
    input cin;
    output [3:0] sum;
    output cout;
    wire p0, p1, p2, p3, g0, g1, g2, g3, c1, c2, c3, c4;
    assign p0 = (a[0]^b[0]), 
    p1 = (a[1]^b[1]),                              // assigning the propagating values
    p2 = (a[2]^b[2]), 
    p3 = (a[3]^b[3]);
    assign g0 = (a[0]&b[0]),                       // assigning the generating values 
    g1 = (a[1]&b[1]), 
    g2 = (a[2]&b[2]), 
    g3 = (a[3]&b[3]);
    assign c0 = cin, 
    c1 = g0|(p0&cin),                               // assigning the c values using g and p
    c2 = g1|(p1&g0)|(p1&p0&cin), 
    c3 = g2|(p2&g1)|(p2&p1&g0)|(p1&p1&p0&cin), 
    c4 = g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
    assign sum[0] = p0^c0,
    sum[1] = p1^c1,                                      // calculating sum using pi ^ ci 
    sum[2] = p2^c2,
    sum[3] = p3^c3;
    assign cout= c4;
endmodule



module logic_module(S, A1, B1, F1);   // moudule to implement bit by bit logic output function 

input [3:0] S;
input A1, B1;
output F1;
assign F1 =  ((!A1)&B1&(!S[0]))|((!A1)&(!B1)&(!S[1]))|(A1&(!B1)&S[2])|(A1&B1&S[3]);
endmodule


module ALU_4bit( A, B, M, S, F , cin , cout);
input M, cin;
input [3:0] A,B, S;
output [3:0] F;
output cout;
reg [3:0] X, Y;
wire cla_cout;
wire [3:0]logic, arith;                          // calling 4 instances of logic unit for each bit 
logic_module l0(S, A[0], B[0], logic[0]);
logic_module l1(S, A[1], B[1], logic[1]);
logic_module l2(S, A[2], B[2], logic[2]);
logic_module l3(S, A[3], B[3], logic[3]);


always @(*)              // setting inputs to the adder based on values of Select input
begin
case(S)
    0:begin
        X = A;               // F = A
        Y = 0;
    end 
    1:begin
        X = A|B;              // F = (A|B)
        Y = 0;
    end
    2:begin
        X = A|(~B);            // F = A|(B')
        Y = 0;
    end
    3:begin
        X = 0;                  // F = -1            
        Y = 4'b1111;
    end
    4:begin
        X = A;                 // F = A + (A&B')
        Y = A&(~B);
    end
    5:begin
        X = (A|B);             // F = (A|B) + (A&B')
        Y = A&(~B);
    end
    6:begin
        X = A;              // F = A - B  - 1
        Y = ~B;
    end
    7:begin                     // F = A&B - 1
         X = A&B;
         Y = 4'b1111;          
    end
    8:begin                     
          X = A;                 // F =  A + A&B
          Y = A&B;
    end
    9:begin
          X = A;                  // F = A + B
          Y = B;
    end
    10:begin
          X = A|(~B);              // F = (A|B') + A&B
          Y = A&B;
    end
    11:begin
          X = A&B;                // F = A&B - 1
          Y = 4'b1111;
    end
    12:begin
          X = A;                 // F =  A  + A
          Y = A;
    end
    13:begin
          X = A|B;             // F = (A|B) + A
          Y = A;
    end
    14:begin
          X = A|(~B);            // F = (A|B') + A
          Y = A;
    end
    15:begin                     // F =  A - 1
          X = A;
          Y = 4'b1111;         
    end
    default begin                   // defaults to 0
          X = 0;
          Y = 0;
    end
endcase
end
wire cla_cin = !cin;                     // set cin to cla
CLA_Adder cl1(X, Y,cla_cin,arith,cla_cout);   // call the cla adder
assign cout = !cla_cout;         // set the cout as negation of cout from cla 
assign F = M?logic:arith;       // 2x1 mux to select logic or arithmatic operations 
endmodule
