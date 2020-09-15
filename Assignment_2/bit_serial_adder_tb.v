`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 19:23:20
// Design Name: 
// Module Name: bit_serial_adder_tb
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

module bit_serial_adder_tb;
    reg clk,reset,cin;
    reg[7:0] I1;
    reg[7:0] I2;
    reg[7:0] O;
    wire s,cout;
    
    bit_serial_adder inst_1 (clk,reset,I1,I2,cin,O,cout);

    initial begin
        clk = 0;
        #1 ;
        clk = ~ clk;
        reset = 1;
        forever #1 clk = ~ clk;
    end
    
    // initial begin
    //     I1 = 2'b00110001;
    //     I2 = 2'b00010100;
    //     reset = 1; a=0; b=0; // adding 49 + 20
    //     #2; a = I1[0]; b = I2[0]; cin = 1; s = O[0];
    //     #2; a = I1[1]; b = I2[1]; cin = 0; s = O[1];
    //     #2; a = I1[2]; b = I2[2]; cin = 0; s = O[2];
    //     #2; a = I1[3]; b = I2[3]; cin = 0; s = O[3];
    //     #2; a = I1[4]; b = I2[4]; cin = 0; s = O[4];
    //     #2; a = I1[5]; b = I2[5]; cin = 0; s = O[5];
    //     #2; a = I1[6]; b = I2[6]; cin = 0; s = O[6];
    //     #2; a = I1[7]; b = I2[7]; cin = 0; s = O[7];
    // end
    initial begin
        I1 = 2'b00110001;
        I2 = 2'b00010100;
        reset = 0; a=0; b=0; // adding 49 + 20
        #2; cin = 1;
        #2; cin = 0;
        #2; cin = 0;
        #2; cin = 0;
        #2; cin = 0;
        #2; cin = 0;
        #2; cin = 0;
        #2; cin = 0;
    end

    
endmodule
