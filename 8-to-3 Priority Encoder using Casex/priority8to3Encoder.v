module priority8to3Encoder (W, Y, z);
   input [7:0] W;
   output reg [2:0] Y;
   output reg z;

   always @(W) begin
    z = 1'b1;
    casex(W)
      8'b00000001 : Y = 3'b000;
      8'b0000001x : Y = 3'b001;
      8'b000001xx : Y = 3'b010;
      8'b00001xxx : Y = 3'b011;
      8'b0001xxxx : Y = 3'b100;
      8'b001xxxxx : Y = 3'b101;
      8'b01xxxxxx : Y = 3'b110;
      8'b1xxxxxxx : Y = 3'b111;
      default : begin z = 1'b0; Y = 3'bx; end
    endcase
   end

endmodule


//=======Testbench==========

module tb;
  reg [7:0] W;
  wire [2:0] Y;
  wire z;

  priority8to3Encoder uut(W, Y, z);

  initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, tb);
  end

  initial begin
    W = 8'b00000001; #10;    //000
    W = 8'b00100001; #10;    //101
    W = 8'b01010100; #10;    //110
    W = 8'b00001000; #10;    //011
    W = 8'b00000101; #10;    //010

    $finish;
  end

endmodule