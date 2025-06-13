module top_module(output wire [99:0] out, input wire sel, input wire [99:0] a, b);
    wire [99:0] sel_ext;
    assign sel_ext = {100{sel}};
    assign out = ~sel_ext&a | sel_ext&b;
endmodule

