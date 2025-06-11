`timescale 1ns/1ps

module notgate_tb;
    reg in, expected;
    wire out;

    top_module dut(
        .in(in), 
        .out(out)
    );
    
    initial begin
        $dumpfile("notgate_waveform.vcd");
        $dumpvars(0, notgate_tb);

        for(integer i = 0; i < 10; ++i) begin
            in = 0;
            expected = 1;
            #10;
            in = 1;
            expected = 0;
            #10;
        end
        $finish;
    end

endmodule