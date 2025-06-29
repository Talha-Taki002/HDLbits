module top_module (input a, input b, input c, output out);
	
    wire tmp;
    andgate inst1 (.a(a), .b(b), .c(c), .d(1), .e(1), .out(tmp));
    assign out = ~tmp;

endmodule

