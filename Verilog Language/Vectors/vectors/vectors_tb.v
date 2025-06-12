`timescale 1ns/1ps

module vectors_tb;
    reg [2:0] in;
    wire [2:0] out, _out;
    wire o0, o1, o2, _o0, _o1, _o2;

    top_module dut(
        .vec(in),
        .outv(out),
        .o0(o0),
        .o1(o1),
        .o2(o2)
    );

    assign _out = in;
    assign _o0 = in[0], _o1 = in[1], _o2 = in[2];


    initial begin
        $dumpfile("vectors_waveform.vcd");
        $dumpvars(0, vectors_tb);

        for(in = 0; in < 8; ++in) begin
            #5;
            if (in == 7) $finish;
        end
        $finish;
    end

endmodule