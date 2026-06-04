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