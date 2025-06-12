`timescale 1ns/1ps

module vector5_tb;
    reg a, b, c, d, e;
    wire [24:0] out;
    wire [24:0] _out;

    top_module dut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .out(out)
    );

    assign _out[24] = ~a ^ a;
    assign _out[23] = ~a ^ b;
    assign _out[22] = ~a ^ c;
    assign _out[21] = ~a ^ d;
    assign _out[20] = ~a ^ e;

    assign _out[19] = ~b ^ a;
    assign _out[18] = ~b ^ b;
    assign _out[17] = ~b ^ c;
    assign _out[16] = ~b ^ d;
    assign _out[15] = ~b ^ e;

    assign _out[14] = ~c ^ a;
    assign _out[13] = ~c ^ b;
    assign _out[12] = ~c ^ c;
    assign _out[11] = ~c ^ d;
    assign _out[10] = ~c ^ e;

    assign _out[9] = ~d ^ a;
    assign _out[8] = ~d ^ b;
    assign _out[7] = ~d ^ c;
    assign _out[6] = ~d ^ d;
    assign _out[5] = ~d ^ e;

    assign _out[4] = ~e ^ a;
    assign _out[3] = ~e ^ b;
    assign _out[2] = ~e ^ c;
    assign _out[1] = ~e ^ d;
    assign _out[0] = ~e ^ e;

    initial begin
        $dumpfile("vector5_waveform.vcd");
        $dumpvars(0, vector5_tb);

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        e = 0;
        #10;

        a = 0;
        b = 0;
        c = 1;
        d = 1;
        e = 1;
        #10;

        a = 1;
        b = 0;
        c = 1;
        d = 1;
        e = 1;
        #10;

        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        #10;

        a = 1;
        b = 1;
        c = 1;
        d = 1;
        e = 1;
        #10;

        $finish;
    end
endmodule