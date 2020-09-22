`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2020 00:18:48
// Design Name: 
// Module Name: unsigned_seq_mult_RS_tb
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
// Problem  - 3
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module unsigned_seq_mult_RS_tb ;
reg [5:0] a, b;
reg clk, rst, load;
wire [12:0] product;

// unit under test  =  unsigned_seq_mult_RS

unsigned_seq_mult_RS uut (.a(a), .b(b), .clk(clk), .rst(rst), .load(load), .product(product));

initial begin       // various inputs to the module 
    clk = 0;      
    rst = 1;
    load = 0;
    a = 0;
    b = 0;
    # 100              // wait for 200 ns for global initialization to finish 
    
    rst = 0;           
    load = 1;
    a = 19;
    b = 9;
    
    # 100;
    load = 0;
    # 100
    rst = 0;           
    load = 1;
    a = 25;
    b = 25;
    
    # 100;
    load = 0;
    # 100
    rst = 0;           
    load = 1;
    a = 51;
    b = 63;
    
    # 100;
    load = 0;
    # 100
    rst = 0;           
    load = 1;
    a = 0;  
    b = 37;
    
    #500 $finish;
end

always begin
#5 clk = ~clk;
$monitor ($time, " clk = %d, rst = %d, load = %d, a = %d, b  = %d, product = %d", clk, rst, load, a, b, product);  // whenever any of the value changes print to screen 

end
endmodule
