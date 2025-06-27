module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= 2'b01;
        else begin
            if (train_valid && train_taken) state <= (state < 2'b11 ? state + 1'b1 : state);
            else if (train_valid && ~train_taken) state <= (state > 2'b00 ? state - 1'b1 : state);
        end
    end

endmodule

