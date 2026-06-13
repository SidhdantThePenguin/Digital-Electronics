module Encode8to3(W, Y, V);
   input [7:0] W;
   output reg V;
   output reg [2:0] Y;

   always @(W) begin
     V = 1'b1;
     case (W)
       8'b00000001 : Y = 3'b000;
       8'b00000010 : Y = 3'b001;
       8'b00000100 : Y = 3'b010;
       8'b00001000 : Y = 3'b011;
       8'b00010000 : Y = 3'b100;
       8'b00100000 : Y = 3'b101;
       8'b01000000 : Y = 3'b110;
       8'b10000000 : Y = 3'b111;
       default: begin Y = 3'b000; V = 1'b0; end     //Incase input is not onehot encoded
     endcase

   end

endmodule


//======Testbench========

module tb;
  reg [7:0] W;
  wire [2:0] Y;
  wire V;

  Encode8to3 uut(W, Y, V);

  initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, tb);
  end

  initial begin
    W = 8'b00000001; #10;   //000
    W = 8'b00001000; #10;   //011
    W = 8'b00100000; #10;   //101
    W = 8'b00110000; #10;   //V=1

    $finish;

  end

endmodule