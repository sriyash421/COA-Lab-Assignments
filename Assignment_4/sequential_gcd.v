`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2020 00:18:48
// Design Name: 
// Module Name: sequential_gcd
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
// Problem  - 3
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module MUX ( //MUX to shift between values of B => B or A-B
    input [7:0]I0,
    input [7:0]I1,
    input sel,
    output reg[7:0]out
);
    always @(*)begin
        case (sel)
            0: out = I0;
            1: out = I1;
            default: out = 8'dx;
        endcase
    end 
endmodule

module MUX_ ( //MUX to shift between values of B => A or B or A-B
    input [7:0]I0,
    input [7:0]I1,
    input [7:0]I2,
    input [1:0]sel,
    output reg[7:0]out
);
    always @(*)begin
        case (sel)
            0: out = I0;
            1: out = I1;
            2: out = I2;
            default: out = 8'dx;
        endcase
    end 
endmodule


module LOAD ( // To load from the bus the given input A or B
    output reg[7:0]dout,
    input [7:0]din,
    input load, clk
);
    always @(posedge clk) begin
        if (load) dout <= din;
    end
endmodule

// module SUB(
//     output reg[7:0]out,
//     input [7:0]I0,
//     input [7:0]I1
// );
//     assign out = I0-I1;
// endmodule

module datapath (
    input clk,
    input [15:0]din,
    input ldA,ldB,
    input [1:0]selA,
    input selB,
    output eq,lt,
    output [7:0]dout
);
    wire [7:0]diff,A,B,tempA,tempB;

    MUX_ MUX_1 (.I0(din[7:0]),.I1(B),.I2(diff),.sel(selA),.out(tempA)); //Setting A
    LOAD A_ (.dout(A),.din(tempA),.load(ldA),.clk(clk)); //Loading A

    MUX MUX_2 (.I0(din[15:8]),.I1(A),.sel(selB),.out(tempB)); //Setting B
    LOAD B_ (.dout(B),.din(tempB),.load(ldB),.clk(clk)); //Loading B

    assign lt = (A<B); // COMP to check if subtraction should continue
    assign eq = (B=={8{1'b0}}); // COMP to check if we should swap

    assign diff = A-B; // temp var in the given algorithm
    assign dout = diff; //difference in the var
endmodule

module controller ( //Controller to simulate FSM
    input clk,reset,lt,eq,load_val,done,
    output reg ldA,ldB,selB,load_in,out_val,
    output reg [1:0]selA
);
    reg [2:0] state;
    parameter S0=0,S1=1,S2=2; //states

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            state <= S0; //reset the state
        end
        else begin
           case (state)
                S0: if(load_val && load_in) state <=S1; //take input and move to S1
                S1: if(!lt && eq) state <= S2; //calculate gcd and done
                S2: if(done && out_val) state <= S0; //final absorbing state
                default: state <= S0;
            endcase 
        end
    end
    always @(*) begin
        case (state)
            S0: //taking input
            begin 
                load_in=1;
                out_val=0;
                selA=0;
                ldA=1;
                selB=0;
                ldB=1;
            end
            S1: if(lt)
                begin //swapping
                    load_in=0;
                    out_val=0;
                    selA=1;
                    ldA=1;
                    selB=1;
                    ldB=1;
                end
                else if(!eq)
                begin //subtracting
                    load_in=0;
                    out_val=0;
                    selA=2;
                    ldA=1;
                    selB=0;
                    ldB=0;
                end
            S2: //saving result
            begin 
                load_in=0;
                out_val=1;
                selA=2'dx;
                ldA=0;
                selB=1'dx;
                ldB=0;
            end
            default:
            begin 
                load_in=1'dx;
                out_val=1'dx;
                selA=2'dx;
                ldA=0;
                selB=1'dx;
                ldB=0;
            end
        endcase
    end
endmodule

module gcd (
    input clk,reset,load_val,done,
    output load_in,out_val,
    input [15:0]din,
    output [7:0]dout
);
    //Control elements of the circuit
    wire ldA,ldB,selB,lt,eq;
    wire [1:0]selA;
    //Initialising hardware
    controller cp
    (
        .clk(clk),
        .reset(reset),
        .load_val(load_val),
        .load_in(load_in),
        .out_val(out_val),
        .done(done),
        .ldA(ldA),
        .ldB(ldB),
        .selA(selA),
        .selB(selB),
        .eq(eq),
        .lt(lt)
    );
  
    datapath dp
    (
        .clk(clk),
        .din(din),
        .dout(dout),
        .ldA(ldA),
        .ldB(ldB),
        .selA(selA),
        .selB(selB),
        .eq(eq),
        .lt(lt)
    );
    
endmodule