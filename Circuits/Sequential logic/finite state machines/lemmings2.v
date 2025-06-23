module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    
	parameter L = 2'b00, R = 2'b01, FL = 2'b10, FR = 2'b11;
    reg [1:0] current_state, next_state;
    
    always @(*) begin
        case (current_state)
            L : next_state = ~ground ? FL : (bump_left ? R : L);
            R : next_state = ~ground ? FR : (bump_right ? L : R);
            FL : next_state = ground ? L : FL;
            FR : next_state = ground ? R : FR;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) current_state <= L;
        else current_state <= next_state;
    end
    
    assign walk_left = current_state == L;
    assign walk_right = current_state == R;
    assign aaah = current_state == FL || current_state == FR;

endmodule

