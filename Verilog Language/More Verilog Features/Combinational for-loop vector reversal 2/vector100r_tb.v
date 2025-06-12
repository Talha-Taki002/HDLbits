`timescale 1ns/1ps

module vector100r_tb;
    reg [99:0] in, _out;
    wire [99:0] out;

    top_module dut(
        .in(in),
        .out(out)
    );

    function [99:0] bit_reverse;
        input [99:0] data;
        integer i;
        begin
            for (i = 0; i < 100; i = i + 1) begin
                bit_reverse[i] = data[99 - i];
            end
        end
    endfunction

    initial begin
        $dumpfile("vector100r_waveform.vcd");
        $dumpvars(0, vector100r_tb);

        in = 100'hDEADBEEFCAFEBABE123456789;
        _out = bit_reverse(in);
        #10;
        $display("in      = %h", in[9:0]);
        $display("out     = %h", out[9:0]);
        $display("expected= %h\n", _out[9:0]);

        in = 100'h0123456789ABCDEFFEDCBA987;
        _out = bit_reverse(in);
        #10;
        $display("in      = %h", in[9:0]);
        $display("out     = %h", out[9:0]);
        $display("expected= %h\n", _out[9:0]);

        in = 100'hAAAAAAAAA555555555AAAAAAA;
        _out = bit_reverse(in);
        #10;
        $display("in      = %h", in[9:0]);
        $display("out     = %h", out[9:0]);
        $display("expected= %h\n", _out[9:0]);

        in = 100'hFFFFFFFFFFFFFFFFFFFFFFFFF;
        _out = bit_reverse(in);
        #10;
        $display("in      = %h", in[9:0]);
        $display("out     = %h", out[9:0]);
        $display("expected= %h\n", _out[9:0]);

        in = 100'h123456789ABCDEFFEDCBA9876;
        _out = bit_reverse(in);
        #10;
        $display("in      = %h", in[9:0]);
        $display("out     = %h", out[9:0]);
        $display("expected= %h\n", _out[9:0]);

        $finish;
    end
endmodule