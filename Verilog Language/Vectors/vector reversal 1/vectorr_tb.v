`timescale 1ns/1ps

module vectorr_tb;
    reg [7:0] in, _out;
    wire [7:0] out;

    top_module dut(
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("vectorr_waveform.vcd");
        $dumpvars(0, vectorr_tb);

        in = 8'b00001101;
        _out = 8'b10110000;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b00011010;
        _out = 8'b01011000;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b00010101;
        _out = 8'b10101000;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b00000110;
        _out = 8'b01100000;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b00101111;
        _out = 8'b11110100;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        $finish;
    end
endmodule