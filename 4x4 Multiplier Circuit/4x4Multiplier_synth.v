module FullAdder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & a) | (cin & b);

endmodule

module FourBitMultiplier(M, Q, P);
    input [3:0] M, Q;
    output [7:0] P;

    wire [3 : 0] PP0, PP1;
    wire [3:0] C1, C2, C3;

    FullAdder F1A0(M[1] & Q[0], M[0] & Q[1], 1'b0, PP0[0], C1[0]);
    FullAdder F1A1(M[2] & Q[0], M[1] & Q[1], C1[0], PP0[1], C1[1]);
    FullAdder F1A2(M[3] & Q[0], M[2] & Q[1], C1[1], PP0[2], C1[2]);
    FullAdder F1A3(1'b0, M[3] & Q[1], C1[2], PP0[3], C1[3]);

    FullAdder F2A0(PP0[1], M[0] & Q[2], 1'b0, PP1[0], C2[0]);
    FullAdder F2A1(PP0[2], M[1] & Q[2], C2[0], PP1[1], C2[1]);
    FullAdder F2A2(PP0[3], M[2] & Q[2], C2[1], PP1[2], C2[2]);
    FullAdder F2A3(C1[3], M[3] & Q[2], C2[2], PP1[3], C2[3]);

    FullAdder F3A0(PP1[1], M[0] & Q[3], 1'b0, P[3], C3[0]);
    FullAdder F3A1(PP1[2], M[1] & Q[3], C3[0], P[4], C3[1]);
    FullAdder F3A2(PP1[3], M[2] & Q[3], C3[1], P[5], C3[2]);
    FullAdder F3A3(C2[3], M[3] & Q[3], C3[2], P[6], P[7]); 

    assign P[0] = M[0] & Q[0];
    assign P[1] = PP0[0];
    assign P[2] = PP1[0];

endmodule