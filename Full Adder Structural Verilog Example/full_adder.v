module full_adder(x, y, Cin, s, Cout);

     input x, y, Cin;
     output s, Cout;

     xor(s, x, y, Cin);
     and(z1, x, y);
     and(z2, y, Cin);
     and(z3, x, Cin);
     or(Cout, z1, z2, z3);

endmodule

// ============ Test Bench ============

module tb;

  reg x, y, Cin;
  wire s, Cout;

  // Instantiate the DUT

  full_adder FA1(x, y, Cin, s, Cout);

  //waveform dump

  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, tb);
  end

  // Test cases

  initial begin

    x = 0; y = 0; Cin = 0; #10;

    x = 0; y = 1; Cin = 0; #10;

    x = 1; y = 1; Cin = 1; #10;

    x = 1; y = 1; Cin = 0; #10;

    $finish;
  
  end

endmodule