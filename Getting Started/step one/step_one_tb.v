`timescale 1ns / 1ps

module step_one_tb;

    wire out, expected;

    top_module dut (
        .one(out)
    );

    assign expected = 1'b1;

    initial begin
        $dumpfile("step_one_waveform.vcd");
        $dumpvars(0, step_one_tb);

        #50
        $finish;
    end

endmodule
