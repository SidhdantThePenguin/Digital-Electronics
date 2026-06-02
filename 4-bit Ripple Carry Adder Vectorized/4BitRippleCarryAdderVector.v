module fullAdder(cin, x, y, s, cout);
    input cin, x, y;
    output s, cout;

    assign s = cin ^ x ^ y;
    assign cout = (cin & x) | (cin & y) | (x & y);

endmodule

module fourbitRippleCarryAdderVector(X, Y, carryin, S, carryout);
    input carryin;
    input [3:0] X;
    input [3:0] Y;
    output carryout;
    output [3:0] S;

    wire [3:1] C;

    fullAdder FA0(carryin, X[0], Y[0], S[0], C[1]);
    fullAdder FA1(C[1], X[1], Y[1], S[1], C[2]);
    fullAdder FA2(C[2], X[2], Y[2], S[2], C[3]);
    fullAdder FA3(C[3], X[3], Y[3], S[3], carryout);

endmodule





//================TestBench================

module tb;
  
      reg carryin;
      reg [3:0] X;
      reg [3:0] Y;

      wire carryout;
      wire [3:0] S;

      //instantiate the fourbitRippleCarryAdderVector

      fourbitRippleCarryAdderVector adder(X, Y, carryin, S, carryout);

      initial begin
          $dumpfile("RippleCarryAdderVector.vcd");
          $dumpvars(0, tb);
      end

      initial begin

          X = 4'b0000; Y = 4'b0000; carryin = 0; #10;   // Adding 0 + 0

          X = 4'b0001; Y = 4'b0001; carryin = 0; #10;   // Adding 1 + 1

          X = 4'b0010; Y = 4'b0010; carryin = 0; #10;   // Adding 2 + 2

          X = 4'b0100; Y = 4'b0100; carryin = 0; #10;   // Adding 4 + 4

          $finish;

      end

endmodule
