module addern (carryin, X, Y, carryout, sum);
    parameter n = 32;
    input carryin;
    input [n-1:0] X;
    input [n-1:0] Y;
    output reg carryout;
    output reg [n-1:0] sum;

    reg [n:0] C;
    integer k;

    always @ (X, Y, carryin)
        begin
            C[0] = carryin;
            for (k = 0; k < n; k = k+1)
                begin
                    sum[k] = X[k] ^ Y[k] ^ C[k];
                    C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
                end
            carryout = C[n];
        end

endmodule

//=====================TestBench======================


module tb;
    reg carryin;
    reg [31:0] X;
    reg [31:0] Y;
    wire carryout;
    wire [31:0] sum;

    addern uut (carryin, X, Y, carryout, sum);

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        // Test case 1
        carryin = 0; X = 32'h00000000; Y = 32'h00000000; #10;
        // Test case 2
        carryin = 0; X = 32'hFFFFFFFF; Y = 32'h00000001; #10;
        // Test case 3
        carryin = 1; X = 32'h12345678; Y = 32'h87654321; #10;
        // Test case 4
        carryin = 0; X = 32'hAAAAAAAA; Y = 32'h55555555; #10;
        // Test case 5
        carryin = 1; X = 32'h7FFFFFFF; Y = 32'h7FFFFFFF; #10;
    end

endmodule

