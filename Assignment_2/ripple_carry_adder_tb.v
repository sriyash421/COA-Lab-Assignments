`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 15:30:16
// Design Name: 
// Module Name: ripple_carry_adder_tb
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


module ripple_carry_adder_tb;
reg [7:0] a;

reg [7:0] b;

reg cin;

wire [7:0] sum;

wire cout;

ripple_carry_adder rca(a,b,cin,sum,cout);

initial begin

#10 a=8'b00000001;b=8'b00000001;cin=1'b0;

#10 a=8'b00000001;b=8'b00000001;cin=1'b1;

#10 a=8'b00000010;b=8'b00000011;cin=1'b0;

#10 a=8'b10000001;b=8'b10000001;cin=1'b0;

#10 a=8'b00011001;b=8'b00110001;cin=1'b0;

#10 a=8'b00000011;b=8'b00000011;cin=1'b1;

#10 a=8'b11111111;b=8'b00000001;cin=1'b0;

#10 a=8'b11111111;b=8'b00000000;cin=1'b1;

#10 a=8'b11111111;b=8'b11111111;cin=1'b0;

 #10 $stop;
end
endmodule
