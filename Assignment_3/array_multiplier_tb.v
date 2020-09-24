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
    reg [5:0]a;
    reg [5:0]b;

    // OUTPUTS
    wire [11:0] product;
    // initializing the module instance
    // unit under test = unsigned_array_mult
    unsigned_array_mult uut (
        .a(a), 
        .b(b), 
        .product(product)
    );
    
    initial begin  // various inputs
        a=5'b00000; b=5'b00000;
        $monitor("a=%d b=%d product=%d",a,b,product);

        #100; a=5'b01110; b=5'b01010;

        #100; a=5'b00000; b=5'b01111;

        #100; a=5'b01001; b=5'b00011;

        #100; a=5'b11101; b=5'b01010;

        #100; a=5'b10111; b=5'b00011;
        
        #10; $stop;
    end
    
endmodule

