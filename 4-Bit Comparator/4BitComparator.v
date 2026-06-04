module fullAdder(x, y, carryIn, sum, carryOut);
    input x, y, carryIn;
    output sum, carryOut;

    assign sum = x ^ y ^ carryIn;
    assign carryOut = (x & y) | (y & carryIn) | ( x & carryIn);

endmodule

module Comparator(X, Y, V, N, Z);
    input [3:0] X, Y;
    output V, N, Z;

    wire [4:1] C;
    wire [3:0] S;

    fullAdder FA1(X[0], ~Y[0], 1'b1, S[0], C[1]);
    fullAdder FA2(X[1], ~Y[1], C[1], S[1], C[2]);
    fullAdder FA3(X[2], ~Y[2], C[2], S[2], C[3]);
    fullAdder FA4(X[3], ~Y[3], C[3], S[3], C[4]);

    assign V = C[3] ^ C[4];
    assign N = S[3];
    assign Z = ~(S[0] | S[1] | S[2] | S[3]);

endmodule



//=================TestBench=================

module tb;

    reg [3:0] X, Y;
    wire V, N, Z;

    Comparator UUT(X, Y, V, N, Z);

    initial begin
        $dumpfile("4BitComparator.vcd");
        $dumpvars(0, tb);
    end

initial begin

        X = 4'b0000; Y = 4'b0000; #10;

        X = 4'b0101; Y = 4'b0011; #10;

        X = 4'b0011; Y = 4'b0101; #10;

        X = 4'b0111; Y = 4'b0001; #10;

        X = 4'b1000; Y = 4'b0001; #10;

        X = 4'b0111; Y = 4'b1111; #10;

        X = 4'b1000; Y = 4'b0111; #10;

        $finish;
    end

endmodule

