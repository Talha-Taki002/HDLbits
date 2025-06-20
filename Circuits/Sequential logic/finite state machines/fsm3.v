module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    
    reg [3:0] state, next_state;
    
    // hot logic
    always @(*) begin
        next_state[A] = ~in & (state[A] | state[C]);
        next_state[B] = in  & (state[A] | state[B] | state[D]);
        next_state[C] = ~in & (state[B] | state[D]);
        next_state[D] = in & state[C];
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= 4'b0001;
        else state <= next_state;
    end
    
    assign out = state[D];

endmodule

