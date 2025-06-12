`timescale 1ns/1ps
module vector3_tb;
    reg [4:0] a, b, c, d, e, f;
    wire [7:0] w, _w, x, _x, y, _y, z, _z;

    top_module dut(
        .a(a), 
        .b(b), 
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    assign _w = {a, b[4:2]}, _x = {b[1:0], c, d[4:4]}, _y = {d[3:0], e[4:1]}, _z = {e[0:0], f, 2'b11};

    initial begin
        $dumpfile("vector3_waveform.vcd");
        $dumpvars(0, vector3_tb);

        a = 5'b01101;
        b = 5'b00111;
        c = 5'b10101;
        d = 5'b11111;
        e = 5'b00010;
        f = 5'b11000;
        #10;
        a = 5'b01011;
        b = 5'b00000;
        c = 5'b11001;
        d = 5'b00101;
        e = 5'b01110;
        f = 5'b11000;
        #10;
        a = 5'b10101;
        b = 5'b00100;
        c = 5'b00011;
        d = 5'b00000;
        e = 5'b11001;
        f = 5'b11000;
        #10;
        a = 5'b01011;
        b = 5'b11011;
        c = 5'b10000;
        d = 5'b00001;
        e = 5'b11010;
        f = 5'b11101;
        #10;
        a = 5'b00001;
        b = 5'b00010;
        c = 5'b00100;
        d = 5'b01000;
        e = 5'b10000;
        f = 5'b11010;
        #10;
        $finish;
    end
endmodule