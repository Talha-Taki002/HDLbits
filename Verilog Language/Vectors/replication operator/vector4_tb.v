`timescale 1ns/1ps

module vector4_tb;
    reg [7:0] in;
    reg [31:0] _out;
    wire [31:0] out;

    top_module dut(
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("vector4_waveform.vcd");
        $dumpvars(0, vector4_tb);

        in = 8'b00001101;
        _out = 32'b00000000000000000000000000001101;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b00011010;
        _out = 32'b00000000000000000000000000011010;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b10010101;
        _out = 32'b11111111111111111111111110010101;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b10000110;
        _out = 32'b11111111111111111111111110000110;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        in = 8'b00101111;
        _out = 32'b00000000000000000000000000101111;
        #10;
        $display("in=%b, out=%b, expected=%b", in, out, _out);

        $finish;
    end
endmodule