module full_adder(x, y, Cin, s, Cout);

     input x, y, Cin;
     output s, Cout;

     xor(s, x, y, Cin);
     and(z1, x, y);
     and(z2, y, Cin);
     and(z3, x, Cin);
     or(Cout, z1, z2, z3);

endmodule