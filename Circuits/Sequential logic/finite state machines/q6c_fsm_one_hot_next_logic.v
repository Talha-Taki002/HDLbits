module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    reg [6:1] Y;
    assign Y[1] = w & (y[1] | y[4]);
    assign Y[2] = y[1] & ~w;
    assign Y[3] = ~w & (y[2] | y[6]);
    assign Y[4] = w & (y[2] | y[3] | y[5] | y[6]);
    assign Y[5] = ~w & (y[3] | y[5]);
    assign Y[6] = ~w & y[4];
    
    
    assign Y2 = Y[2];
    assign Y4 = Y[4];

endmodule

