module top_module (
    input clk,
    input d,
    output q
);	
    reg a, b;
    always @(posedge clk) begin
        a <= d;
    end
    always @(negedge clk) begin
        b <= d;
    end
    always @(*)
        q = clk? a:b;

endmodule

