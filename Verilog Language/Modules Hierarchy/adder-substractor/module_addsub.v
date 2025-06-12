module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);	
    wire c1, c2;
    wire [15:0] lo_sum, hi_sum;
    wire [31:0] _b;
    assign _b = {32{sub}} ^ b;
    add16 add_lo(.a(a[15:0]), .b(_b[15:0]), .cin(sub), .sum(lo_sum), .cout(c1));
    add16 add_hi(.a(a[31:16]), .b(_b[31:16]), .cin(c1), .sum(hi_sum), .cout(c2));
    
    assign sum = {hi_sum, lo_sum};

endmodule

