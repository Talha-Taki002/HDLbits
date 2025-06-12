`timescale 1ns/1ps

module vector1_tb;
    reg [15:0] in;
    wire [7:0] out_lo, out_hi, _out_lo, _out_hi;

    assign _out_lo = in[7:0], _out_hi = in[15:8];

    top_module dut(.in(in), .out_lo(out_lo), .out_hi(out_hi));

    initial begin
        $dumpfile("vector1_waveform.vcd");
        $dumpvars(0, vector1_tb);
        
        for(in = 0; in < (1<<16); ++in) begin
            #5;
            if (in == 16'b1111111111111111) $finish;
        end
        $finish;
    end

endmodule