module circuitA (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module circuitB ( input x, input y, output z );
    assign z = ~(x^y);
endmodule

module top_module (input x, input y, output z);
    wire [3:0] out;
    circuitA IA1(x, y, out[0]);
    circuitB IB1(x, y, out[1]);
    circuitA IA2(x, y, out[2]);
    circuitB IB2(x, y, out[3]);
    
    assign z = (out[0] | out[1]) ^ (out[2] & out[3]);

endmodule

