module priorityEncoder (W, Y, z);
    input [3:0] W;
    output reg [1:0] Y;
    output reg z;

    integer k;

    always @(*)
    begin
       Y = 2'bx;
       z = 0;

       for (k = 0; k < 4; k = k+1)
          if (W[k])
            begin
                Y = k;
                z = 1;
            end
    end

endmodule


//==========Testbench============

module tb;
   reg [3:0] W;
   wire [1:0] Y;
   wire z;

   priorityEncoder uut(W, Y, z);

   initial begin
    $dumpfile("priorityEncoder.vcd");
    $dumpvars(0, tb);
   end

   initial begin
    W = 4'b0000; #10;
    W = 4'b0001; #10;
    W = 4'b0011; #10;
    W = 4'b0111; #10;
    W = 4'b1111; #10;
    W = 4'b1010; #10;

    $finish;

   end

endmodule