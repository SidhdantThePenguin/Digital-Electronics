`timescale 1ns / 1ps

module mux2to1 (x1, x2, s, f);
    input x1, x2, s;
    output f;
    reg f;

    always@(*)
       if (s == 0)
            f = x1;
       else 
            f = x2;   

endmodule

module mux2to1_tb;
    reg x1, x2, s;
    wire f;
    
    mux2to1 uut (
        .x1(x1),
        .x2(x2),
        .s(s),
        .f(f)
    );
    
    initial begin
        
        $dumpfile("mux2to1_tb.vcd");
        $dumpvars(0, mux2to1_tb);

        x1=0; x2=0; s=0; #10;
        x1=1; x2=0; s=0; #10;
        x1=0; x2=1; s=1; #10;
        x1=1; x2=1; s=1; #10;

        $finish;
    end

endmodule