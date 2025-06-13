module top_module(output wire out, input wire a, b, sel); 
    assign out = ~sel&a | sel&b;

endmodule

