module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    
    reg [5:0] Y;
    assign Y[0] = ~w & (y[0] | y[3]);
    assign Y[1] = y[0] & w;
    assign Y[2] = w & (y[1] | y[5]);
    assign Y[3] = ~w & (y[1] | y[2] | y[4] | y[5]);
    assign Y[4] = w & (y[2] | y[4]);
    assign Y[5] = w & y[3];
    
    
    assign Y1 = Y[1];
    assign Y3 = Y[3];

endmodule


