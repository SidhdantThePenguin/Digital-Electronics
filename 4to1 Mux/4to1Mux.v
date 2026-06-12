module mux4to1 (W, S, f);
    input [3:0] W;
    input [1:0] S;

    output reg f;

    always @(W,S)
     if (S == 0)
        f = W[0];
     else if (S == 1)
        f = W[1];
     else if (S == 2)
        f = W[2];
     else
        f = W[3];

endmodule


//==============Testbench====================

module tb;

   reg [3:0] W;
   reg [1:0] S;
   wire f;

    mux4to1 M1(W, S, f);

    initial begin
        $dumpfile("mux4to1.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        W = 4'b0001; S = 0; #10;
        W = 4'b0010; S = 1; #10;
        W = 4'b0100; S = 2; #10;
        W = 4'b1000; S = 3; #10;
        W = 4'b1011; S = 2; #10;

        $finish;
    
    end

endmodule