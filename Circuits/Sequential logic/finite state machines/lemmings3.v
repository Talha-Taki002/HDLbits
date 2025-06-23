module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter L = 3'b000, R = 3'b001, FL = 3'b010, FR = 3'b011, DL = 3'b100, DR = 3'b101;
    reg [2:0] current_state, next_state;
    
    always @(*) begin
        case (current_state)
            L : next_state = ~ground ? FL : (dig ? DL : (bump_left ? R : L));
            R : next_state = ~ground ? FR : (dig ? DR : (bump_right ? L : R));
            FL : next_state = ~ground ? FL : L;
            FR : next_state = ~ground ? FR : R;
            DL : next_state = ~ground ? FL : DL;
            DR : next_state = ~ground ? FR : DR;
            default next_state = L;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) current_state <= L;
        else current_state <= next_state;
    end
    
    always @(*) begin
        walk_left = current_state == L;
        walk_right = current_state == R;
        aaah = current_state == FL || current_state == FR;
        digging = current_state == DL || current_state == DR;
    end

endmodule

