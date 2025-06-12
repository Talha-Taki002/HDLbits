`timescale 1ns/1ps
module gates4_tb;
    reg [4:0] in;
    wire out_and, _out_and, out_or, _out_or, out_xor, _out_xor;

    top_module dut(
        .in(in[3:0]),
        .out_and(out_and),
        .out_or(out_or),
        .out_xor(out_xor)
    );

    assign _out_and = in[0] & in[1] & in[2] & in[3];
    assign _out_or = in[0] | in[1] | in[2] | in[3];
    assign _out_xor = in[0] ^ in[1] ^ in[2] ^ in[3];

    initial begin
        $dumpfile("gates4_waveform.vcd");
        $dumpvars(0, gates4_tb);

        for(in = 0; in < 16; ++in) begin
            #5;
        end
        $finish;
    end
endmodule