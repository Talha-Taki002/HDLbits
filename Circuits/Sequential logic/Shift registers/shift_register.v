module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] q;
    
    assign out = q[0];
    always @(posedge clk) begin
        if (~resetn) q <= 4'd0;
        else begin
            q <= {in, q[3:1]};
        end
    end

endmodule

