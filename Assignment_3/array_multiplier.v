// Assignment - 3
// Problem  - 1
// Semester Aut - 2020 
// Group - 53
// Name_1 : Hardik Aggarwal 
// Roll_1 : 18CS10021
// Name_2 : Sriyash Poddar
// Roll_2 : 18CS30040

module unsigned_array_mult ( // 5x5 bit array multiplier
    input clk,reset,
    input [5:0]a,
    input [5:0]b,
    output reg [11:0]product
);
    reg [4:0]counter;
    reg [5:0]sum;
    reg [11:0]partial_product;
    reg [5:0]b_j;
    always @(posedge reset) begin //reset all values
        counter = 4'b0000;
        product = 11'b00000000000;
    end
    always @(posedge clk) begin
        if(counter<4'b0101) begin
            b_j = {5{b[counter]}};
            sum = a&b_j; //TAKING AND OF M AND Q_J
            partial_product = sum << counter; //PARTIAL PRODUCT
            product = product + partial_product;// ADD TO FINAL PRODUCT
            counter = counter + 1; 
        end
    end
endmodule