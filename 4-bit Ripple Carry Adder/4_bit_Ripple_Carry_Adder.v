module fullAdder (cin, x, y, s, cout);
      input cin, x, y;
      output s, cout;

      assign s = (x ^ y) ^ cin;
      assign cout = (x & y) | (cin & x) | (cin & y);

endmodule

module rippleCarryAdder (x0, x1, x2, x3, y0, y1, y2, y3, carryin, s0, s1, s2, s3, carryout);
        input x0, x1, x2, x3, y0, y1, y2, y3, carryin;
        output s0, s1, s2, s3, carryout;

        fullAdder Stage0 (carryin, x0, y0, s0, c1);
        fullAdder Stage1 (c1, x1, y1, s1, c2);
        fullAdder Stage2 (c2, x2, y2, s2, c3);
        fullAdder Stage3 (c3, x3, y3, s3, carryout);

endmodule




// ================ TestBench ================


module tb;
        reg x0, x1, x2, x3, y0, y1, y2, y3, carryin;
        wire s0, s1, s2, s3, carryout;

        // instantiate the ripple carry adder

        rippleCarryAdder rca (x0, x1, x2, x3, y0, y1, y2, y3, carryin, s0, s1, s2, s3, carryout);

        initial begin
            $dumpfile("rippleCarryAdder.vcd");
            $dumpvars(0, tb);
        end

        initial begin

            // test case 1
            x0 = 0; x1 = 0; x2 = 0; x3 = 0;
            y0 = 0; y1 = 0; y2 = 0; y3 = 0;
            carryin = 0;
            #10;

            // test case 2
            x0 = 1; x1 = 0; x2 = 1; x3 = 1;
            y0 = 1; y1 = 1; y2 = 0; y3 = 1;
            carryin = 1;
            #10;

            // test case 3
            x0 = 1; x1 = 1; x2 = 1; x3 = 1;
            y0 = 1; y1 = 1; y2 = 1; y3 = 1;
            carryin = 0;
            #10;

            // test case 4
            x0 = 0; x1 = 1; x2 = 0; x3 = 1;
            y0 = 1; y1 = 0; y2 = 1; y3 = 0;
            carryin = 0;
            #10;

        end

endmodule

