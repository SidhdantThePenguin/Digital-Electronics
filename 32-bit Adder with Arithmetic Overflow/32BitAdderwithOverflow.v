module Addern( X, Y, carryin, S, carryout, overflow);
     
     parameter n = 32;
     input [n-1 : 0] X, Y;
     input carryin;
     output reg [n-1 : 0] S;
     output reg carryout, overflow;

     always @(X, Y, carryin)
        begin
            S = X + Y + carryin;         // Directly using the adding operator 
            carryout = (X[n-1] & Y[n-1]) | (X[n-1] & ~S[n-1]) | (Y[n-1] & ~S[n-1]);
            overflow = (X[n-1] & Y[n-1] & ~S[n-1]) | (~X[n-1] & ~Y[n-1] & S[n-1]);
        end

endmodule

//================Testbench================


module tb;
    reg [31:0] X, Y;
    reg carryin;

    wire [31:0] S;
    wire carryout, overflow;

    Addern adder(X, Y, carryin, S, carryout, overflow);

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, tb);
    end

    initial begin

        // Test Case 1: No carry, no overflow

        X=32'h00000001; Y = 32'h00000001; carryin = 0; #10;

        // Test Case 2: Carry, no overflow

        X=32'hFFFFFFFF; Y = 32'h00000001; carryin = 0; #10;

        // Test Case 3: No carry, overflow

        X=32'h7FFFFFFF; Y = 32'h00000001; carryin = 0; #10;

        // Test Case 4: Carry, overflow

        X=32'h7FFFFFFF; Y = 32'h7FFFFFFF; carryin = 0; #10;

        $finish;

    end

endmodule