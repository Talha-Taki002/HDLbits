module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    MUXDFF MUXDFF1(KEY[0], KEY[3], KEY[1], KEY[2], SW[3], LEDR[3]);
    MUXDFF MUXDFF2(KEY[0], LEDR[3], KEY[1], KEY[2], SW[2], LEDR[2]);
    MUXDFF MUXDFF3(KEY[0], LEDR[2], KEY[1], KEY[2], SW[1], LEDR[1]);
    MUXDFF MUXDFF4(KEY[0], LEDR[1], KEY[1], KEY[2], SW[0], LEDR[0]);

endmodule

module MUXDFF (input clk, w, E, L, R, output Q);
    reg [1:0] r;
    
    mux2 mux(Q, w, E, r[0]);
    mux2 _mux(r[0], R, L, r[1]);
    
    always @(posedge clk) begin
        Q <= r[1];
    end

endmodule

module mux2(input a, b, sel, output q);
    assign q = (~sel & a) | (sel & b);
endmodule

