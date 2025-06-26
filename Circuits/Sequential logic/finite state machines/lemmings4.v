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
    
    parameter L = 3'b000, R = 3'b001, FL = 3'b010, FR = 3'b011, DL = 3'b100, DR = 3'b101, ST = 3'b110;
    reg [2:0] cs, ns;
    reg [4:0] cnt;
    
    always @(*) begin
        case (cs)
            L : ns = ~ground ? FL : (dig ? DL : (bump_left ? R : L));
            R : ns = ~ground ? FR : (dig ? DR : (bump_right ? L : R));
            FL : ns = ~ground ? FL : (cnt >= 5'd20 ? ST : L);
            FR : ns = ~ground ? FR : (cnt >= 5'd20 ? ST : R);
            DL : ns = ground ? DL : FL;
            DR : ns = ground ? DR : FR;
            ST : ns = ST;
			default : ns = L;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            cs <= L;
            cnt <= 5'd0;
        end
        else begin
            cs <= ns;
            if (cs == FL || cs == FR) cnt <= (cnt < 5'd20 ? cnt + 1'b1 : cnt);
            else if (cs == L || cs == R) cnt <= 5'd0;
        end
    end
   
    
    always @(*) begin
        walk_left = cs == ST? 1'b0 : (cs == L);
        walk_right = cs == ST ? 1'b0 : (cs == R);
        aaah = cs == ST ? 1'b0 : (cs == FL || cs == FR);
        digging = cs == ST ? 1'b0 : (cs == DL || cs == DR);
    end
                
endmodule

