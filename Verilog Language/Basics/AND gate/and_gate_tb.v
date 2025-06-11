`timescale 1ns/1ps

module and_gate_tb;
    reg a, b, expected;
    wire out;

    top_module dut(
        .a(a), 
        .b(b),
        .out(out)
    );
    
    initial begin
        $dumpfile("and_gate_waveform.vcd");
        $dumpvars(0, and_gate_tb);

        for(integer i = 0; i < 10; ++i) begin
            a = 0;
            b = 0;
            expected = 0;
            #10;

            a = 0;
            b = 1;
            expected = 0;
            #10;

            a = 1;
            b = 0;
            expected = 0;
            #10;

            a = 1;
            b = 1;
            expected = 1;
            #10;
        end
        $finish;
    end

endmodule