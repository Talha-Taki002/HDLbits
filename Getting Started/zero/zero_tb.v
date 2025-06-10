`timescale 1ns / 1ps

module zero_tb;
    wire expected, out;

    top_module dut (
        .zero(out)
    );

    assign expected = 1'b0;

    initial begin
        $dumpfile("zero_waveform.vcd");
        $dumpvars(0, zero_tb);

        #50
        $finish;
    end
    
endmodule