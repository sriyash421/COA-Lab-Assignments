// Assignment - 3
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040
`include "array_multiplier.v"

module unsigned_array_mult_tb;
    //INPUTS
    reg clk;
    reg reset;
    reg [5:0]a;
    reg [5:0]b;

    // OUTPUTS
    wire [11:0] product;
    // initializing the module instance
    unsigned_array_mult uut (
        .clk(clk), 
        .reset(reset), 
        .a(a), 
        .b(b), 
        .product(product)
    );

    //generate clock with 10 ns clock period.
    always
        #5 clk = ~clk;
        
    initial begin  // various inputs 
        clk = 1;

        a=5'b01110;b=5'b01010;reset=1'b1;#10;reset=1'b0;#100;
        $display("a=%d b=%d product=%d",a,b,product);

        a=5'b00000;b=5'b01111;reset=1'b1;#10;reset=1'b0;#100;
        $display("a=%d b=%d product=%d",a,b,product);

        a=5'b01001;b=5'b00011;reset=1'b1;#10;reset=1'b0;#100;
        $display("a=%d b=%d product=%d",a,b,product);

        a=5'b11101;b=5'b01010;reset=1'b1;#10;reset=1'b0;#100;
        $display("a=%d b=%d product=%d",a,b,product);

        a=5'b10111;b=5'b00011;reset=1'b1;#10;reset=1'b0;#100;
        $display("a=%d b=%d product=%d",a,b,product);
        #10; $stop;
    end
    
endmodule

