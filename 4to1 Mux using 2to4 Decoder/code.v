module dec2to4 (W, Y);
   input [1:0] W;
   output reg [3:0] Y;

   always @(W)
     case(W)
        2'b00 : Y = 4'b0001;
        2'b01 : Y = 4'b0010;
        2'b10 : Y = 4'b0100;
        2'b11 : Y = 4'b1000;
     endcase

endmodule


module mux4to1 (S, W, f);
    input [1:0] S;
    input [3:0] W;
    output f;

    wire [3:0] Y;

    dec2to4 u1(S, Y);

    assign f = (W[0] & Y[0]) | (W[1] & Y[1]) | (W[2] & Y[2]) | (W[3] & Y[3]);

endmodule





//====================TestBench==========================

module tb;

   reg [1:0] S;
   reg [3:0] W;
   wire f;

   mux4to1 uut(S , W, f);

   initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, tb);
   end

   initial begin
    S = 2'b00; W = 4'b1010; #10;
    S = 2'b01; W = 4'b1010; #10;
    S = 2'b10; W = 4'b1010; #10;
    S = 2'b11; W = 4'b1010; #10;

    $finish;

   end

endmodule