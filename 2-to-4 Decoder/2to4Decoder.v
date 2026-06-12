module dec2to4 (W, En, Y);
    input [1:0] W;
    input En;
    output reg [3:0] Y;

    always @ (W, En)
       case({En, W})
          3'b100 : Y = 4'b0001;
          3'b101 : Y = 4'b0010;
          3'b110 : Y = 4'b0100;
          3'b111 : Y = 4'b1000;
          default : Y = 4'b0000;

       endcase

endmodule



//=========Testbench========

module tb;
  
  reg [1:0] W;
  reg En;
  wire [3:0] Y;

  dec2to4 uut(W, En, Y);

  initial begin
    $dumpfile("dec2to4.vcd");
    $dumpvars(0, tb);
  end

  initial begin

    W = 2'b00; En = 1'b1; #10;
    W = 2'b01; En = 1'b1; #10;
    W = 2'b10; En = 1'b1; #10;
    W = 2'b11; En = 1'b1; #10;
    W = 2'b10; En = 1'b0; #10;

    $finish;
  
  end

endmodule
