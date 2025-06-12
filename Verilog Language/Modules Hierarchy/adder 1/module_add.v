module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);	
    wire c1, c2;
    wire [15:0] lo_sum, hi_sum;
    add16 add_low(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(lo_sum), .cout(c1));
    add16 add_high(.a(a[31:16]), .b(b[31:16]), .cin(c1), .sum(hi_sum), .cout(c2));
    
    assign sum = {hi_sum, lo_sum};
     
    

endmodule

