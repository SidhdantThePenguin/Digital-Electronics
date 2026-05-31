module mux2to1 (x1, x2, s, f);
       
    input x1, x2, s;
    output f;

    assign f = (~s & x1) | (s & x2);

endmodule

module adder (w1, w2, s1, s0);
    
    input w1, w2;
    output s1, s0;

    assign s1 = w1 & w2;
    assign s0 = w1 ^ w2;

endmodule

module Toplvl (a, b, c, d, m, s1, s0);

    input a, b, c, d, m;
    output s1, s0;

    wire w1, w2;

    mux2to1 U1(a, c, m, w1);
    mux2to1 U2(b, d, m, w2);

    adder U3(w1, w2, s1, s0);

endmodule