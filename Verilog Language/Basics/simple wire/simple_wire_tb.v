`timescale 1ns / 1ps

module simple_wire_tb;

    reg in;
    wire out, expected;

    top_module dut (
        .in(in),
        .out(out)
    );

    assign expected = in;

    initial begin
        $dumpfile("simple_wire_waveform.vcd");
        $dumpvars(0, simple_wire_tb);

        in = 1'b0;
        for(integer i = 0; i < 20; i += 1) begin
            #5;
            in = ~in;
        end

        $finish;
    end

endmodule