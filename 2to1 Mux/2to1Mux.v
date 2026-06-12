module mux2to1 (w0, w1, s, f);
   input w0, w1, s;
   output f;

   assign f = s ? w1 : w0;

endmodule

//Testbench

module tb;

    reg w0, w1, s;
    wire f;

    mux2to1 uut(w0, w1, s, f);

    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, tb);
    end

    initial begin

        w0 = 0; w1 = 0; s = 0; #10;
        w0 = 0; w1 = 0; s = 1; #10;

        w0 = 1; w0 = 0; s = 0; #10;
        w0 = 0; w1 = 1; s = 1; #10;

        $finish;
    end

endmodule