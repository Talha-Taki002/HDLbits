`timescale 1ns/1ps

module vectorgates_tb;
    reg [3:0] a, b;
    wire [2:0] out_or_bitwise, _out_or_bitwise;
    wire [5:0] out_not, _out_not;
    wire out_or_logical, _out_or_logical;

    top_module dut(
        .a(a[2:0]), 
        .b(b[2:0]),
        .out_or_bitwise(out_or_bitwise),
        .out_or_logical(out_or_logical),
        .out_not(out_not)
    );

    assign _out_or_bitwise = a[2:0] | b[2:0], _out_or_logical = a[2:0] || b[2:0];
    assign _out_not[2:0] = ~a[2:0], _out_not[5:3] = ~b[2:0];

    initial begin
        $dumpfile("vectorgates_waveform.vcd");
        $dumpvars(0, vectorgates_tb);

        for(a = 0; a < 8; ++a) begin
            for(b = 0; b < 8; ++b) begin
                #5;
            end
        end
        $finish;

    end

endmodule