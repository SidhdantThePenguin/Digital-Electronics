module example_synth (x,y,z,g,f);
    input x,y,z;
    output g,f;
    wire k;

    assign k = y ^ z;
    assign g = k ^ x;
    assign f = (~k & z) | (k & x);

endmodule