module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c1, c2, _c2;
    wire [15:0] lo_sum, hi_sum0, hi_sum1, hi_sum;
    add16 add_lo(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(lo_sum), .cout(c1));
    add16 add_hi0(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(hi_sum0), .cout(c2));
    add16 add_hi1(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(hi_sum1), .cout(_c2));
    
	mux2 mux(hi_sum0, hi_sum1, c1, hi_sum);
    assign sum = {hi_sum, lo_sum};
      
endmodule

module mux2(input [15:0] a, b, input sel, output [15:0] q);
    assign q = ({16{~sel}} & a) | ({16{sel}} & b); 
endmodule

