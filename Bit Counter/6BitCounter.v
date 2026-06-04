module HalfAdder(A,B,Sum,Cout);
     input A,B;
     output Sum,Cout;
     assign Sum = A^B;
     assign Cout = A&B;
endmodule

module FullAdder(A,B,Cin,Sum,Cout);
     input A,B,Cin;
     output Sum,Cout;
     assign Sum = A^B^Cin;
     assign Cout = (A&B)|(B&Cin)|(A&Cin);

endmodule




module SixBitCounter(X,S);
     input [5:0] X;
     output [2:0] S;

     wire [1:0] s;
     wire [2:0] c;

     FullAdder FA0(X[1], X[2], X[0], s[0], c[0]);
     FullAdder FA1(X[4], X[5], X[3], s[1], c[1]);

     HalfAdder HA0(s[0], s[1], S[0], c[2]);
     FullAdder FA2(c[0], c[1], c[2], S[1], S[2]);

endmodule




//=============TestBench================


module tb;

   reg [5:0] X;
   wire [2:0] S;

   SixBitCounter UUT(X,S);

   initial begin
      $dumpfile("SixBitCounter.vcd");
      $dumpvars(0, tb);
   end

   initial begin
        X = 6'b000000; #10;
        X = 6'b111111; #10;
        X = 6'b000111; #10;
        X = 6'b101010; #10;
        X = 6'b110110; #10;
        X = 6'b111110; #10;
       $finish;

   end
   


endmodule

