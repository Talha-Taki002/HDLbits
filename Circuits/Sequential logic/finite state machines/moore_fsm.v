module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next_state;
    
    always @(*) begin
        case (s)
            3'b001: next_state = B;
            3'b011: next_state = C;
            3'b111: next_state = D;
            default: next_state = A;
        endcase
    end
    
    reg flag;
    always @(posedge clk) begin
        if (reset) begin
            flag <= 1'b1;
            state <= A;
        end
        else begin
            flag <= next_state < state? 1'b1 : (next_state > state? 1'b0 : flag);
            state <= next_state;
        end
    end
    
    assign dfr = state == A || flag;
    assign fr1 = state <= C;
    assign fr2 = state <= B;
    assign fr3 = state == A;
    


endmodule

