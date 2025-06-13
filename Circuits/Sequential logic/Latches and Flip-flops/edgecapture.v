module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    wire [31:0] last;
    always @(posedge clk) begin
        if (reset) out <= 0;
        else begin
            for(int i = 0; i < 32; ++i) begin
                if (last[i] ^ in[i]) begin 
                    if (last[i]) out[i] <= 1;
                end
            end
        end
        last <= in;
    end

endmodule

