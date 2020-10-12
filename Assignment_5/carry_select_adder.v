`timescale 1ns / 1ps
// Assignment - 5
// Problem  - 3
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module full_adder (
    input I0,
    input I1,
    input cin,
    output sum,
    output cout
);
    assign sum = I0 ^ I1 ^ cin;
    assign cout = (I0 & I1) | (cin & I1) | (I0 & cin);
endmodule

module MUX (
    input I0,
    input I1,
    input sel,
    output reg out
);
    always @(*)begin
        case (sel)
            0: out = I0;
            1: out = I1;
            default: out = 1'dx;
        endcase
    end    
endmodule

module carry_select_adder (
    input [15:0]I0,
    input [15:0]I1,
    input cin,
    output [15:0]out,
    output cout
);
    wire [15:0]temp1;
    wire [15:0]temp2;
    wire [16:0]cin1;
    wire [16:0]cin2;

    assign cin1[0] = 1'b0;
    assign cin2[0] = 1'b1;
    
    genvar i;
    
    generate
        for(i=0;i<=15;i = i+1) begin
            full_adder inst (I0[i],I1[i],cin1[i],temp1[i],cin1[i+1]);
        end
    endgenerate

    generate
        for(i=0;i<=15;i = i+1) begin
            full_adder inst (I0[i],I1[i],cin2[i],temp2[i],cin2[i+1]);
        end
    endgenerate

    generate
        for(i=0;i<=15;i = i+1) begin
            MUX mux_inst (temp1[i],temp2[i],cin,out[i]);
        end
    endgenerate

    MUX mux_inst_ (cin1[16],cin2[16],cin,cout);
endmodule