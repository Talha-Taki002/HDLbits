`timescale 1ns/1ps

module four_wires_tb;

    reg [2:0] in = 3'b000;
    wire a = in[0], b = in[1], c = in[2];
    wire w, x, y, z, _w, _x, _y, _z;

    top_module dut (
        .a(a), .b(b), .c(c),
        .w(w), .x(x), .y(y), .z(z)
    );

    assign _w = a, _x = b, _y = b, _z = c;

    initial begin
        $dumpfile("four_wires_waveform.vcd");
        $dumpvars(0, four_wires_tb);

        for(in = 0; in < 8; ++in) begin
            #10;
            if (in == 3'b111) $finish;
        end
        $finish;
    end

endmodule