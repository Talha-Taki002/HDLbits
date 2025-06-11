`timescale 1ns/1ps

module _7458_tb;
    reg [10:0] in;
    wire [9:0] w;
    wire out1, out2, expected1, expected2;
    wire w1, w2, w3, w4;

    assign w = in[9:0];
    top_module dut (
        .p1a(w[0]),
        .p1b(w[1]),
        .p1c(w[2]),
        .p1d(w[3]),
        .p1e(w[4]),
        .p1f(w[5]),
        .p2a(w[6]),
        .p2b(w[7]),
        .p2c(w[8]),
        .p2d(w[9]),
        .p1y(out1),
        .p2y(out2)
    );

    and(w1, w[0], w[1], w[2]);
    and(w2, w[3], w[4], w[5]);
    or(expected1, w1, w2);
    and(w3, w[6], w[7]);
    and(w4, w[8], w[9]);
    or(expected2, w3, w4);

    initial begin
        $dumpfile("7458_waveform.vcd");
        $dumpvars(0, _7458_tb);

        for(in = 0; in < (1<<10); ++in) begin
            #5;
        end
        $finish;
    end


endmodule