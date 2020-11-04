`timescale 1ns / 1ps
// Assignment - 5
// Problem  - 4
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module carry_save_adder_tb;
    //Inputs
    reg [19:0] I[8:0];
    //Output
    wire [19:0]out;
    
    //uut - unit under testing
    carry_save_adder uut (I[0], I[1], I[2], I[3], I[4], I[5], I[6], I[7], I[8], out);

    initial begin
        //initialize inputs
        I[0] = 0; I[1] = 0;I[2] = 0;I[3] = 0;I[4] = 0;I[5] = 0;I[6] = 0;I[7] = 0;I[8] = 0; 
        $monitor("I[0]=%d I[1]=%d I[2]=%d I[3]=%d I[4]=%d I[5]=%d I[6]=%d I[7]=%d I[8]=%d sum=%d",I[0],I[1],I[2],I[3],I[4],I[5],I[6],I[7],I[8],out);
        #200;

        I[0] = 1*1 ; I[1] = 2*2 ;I[2] = 3*3 ;I[3] = 4*4 ;I[4] = 5*5 ;I[5] = 6*6 ;I[6] = 7*7 ;I[7] = 8*8 ;I[8] = 9*9 ;

        #100;

        I[0] = 10 ; I[1] = 20 ;I[2] = 30 ;I[3] = 40 ;I[4] = 50 ;I[5] = 60 ;I[6] = 70 ;I[7] = 80 ;I[8] = 90 ;

        #100;
    end
    
endmodule