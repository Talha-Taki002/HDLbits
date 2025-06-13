module mux(output out, input a, b, sel);
    assign out = ~sel&a | sel&b;
endmodule

module mux4(output out, input a, b, c, d, input [1:0] sel);
    wire x, y;
    mux mux1(x, a, b, sel[0]);
    mux mux2(y, c, d, sel[0]);
    mux mux3(out, x, y, sel[1]);
endmodule

module top_module (
    input c,
    input d,
    output [3:0] mux_in
);
    mux4 mux4_1(mux_in[0], 0, 1, 1, 1, {c, d});
    mux4 mux4_2(mux_in[1], 0, 0, 0, 0, {c, d});
    mux4 mux4_3(mux_in[3], 0, 0, 0, 1, {c, d});
    mux4 mux4_4(mux_in[2], 1, 0, 1, 0, {c, d});

endmodule
	
