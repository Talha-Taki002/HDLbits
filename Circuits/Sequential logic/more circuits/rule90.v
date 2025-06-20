module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for(integer i = 0; i < 512; i = i + 1) begin
                q[i] <= (i > 0? q[i-1]:1'b0) ^ (i < 511? q[i+1]:1'b0);
            end
        end
    end
    
    

endmodule

