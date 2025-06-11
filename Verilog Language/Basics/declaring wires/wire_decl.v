`timescale 1ns/1ps

module wire_decl_tb;
    reg [4:0] in;
    wire a, b, c, d, expected, expected_n;
    wire w1, w2, w3, out, out_n;

    assign a = in[0], b = in[1], c = in[2], d = in[3];
    top_module dut(
        .a(a), 
        .b(b),
        .c(c),
        .d(d),
        .out(out),
        .out_n(out_n)
    );

    and(w1, a, b);
    and(w2, c, d);
    or(w3, w1, w2);

    assign expected = w3;
    assign expected_n = ~w3;
    
    initial begin
        $dumpfile("wire_decl_waveform.vcd");
        $dumpvars(0, wire_decl_tb);

        for(in = 0; in < 16; ++in) begin
            #10;
        end
        $finish;
    end

endmodule