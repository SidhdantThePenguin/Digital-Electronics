module full_adder (x, y, cin, s, cout);
    
    input x, y, cin;
    output s, cout;

    assign s = x ^ y ^ cin;
    assign cout = (x & y) | (cin & x) | (cin & y);

endmodule


module tb;

     reg x, y, cin;
     wire s, cout;

     full_adder f1(x, y, cin, s, cout);

     initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, tb);
     end

     initial begin
        x = 0; y = 0; cin = 0; #10;
        x = 0; y = 0; cin = 1; #10;
        x = 0; y = 1; cin = 0; #10;
        x = 0; y = 1; cin = 1; #10;
        x = 1; y = 0; cin = 0; #10;
        x = 1; y = 0; cin = 1; #10;
        x = 1; y = 1; cin = 0; #10;
        x = 1; y = 1; cin = 1; #10;
     end

endmodule