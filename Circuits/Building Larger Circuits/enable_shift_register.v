module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd4, E = 3'd5;
    reg [2:0] ns, cs;
    
    always @(*) begin
        case (cs)
            A : ns = B;
            B : ns = C;
            C : ns = D;
            D : ns = E;
            E : ns = E;
            default : ns = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) cs <= A;
        else cs <= ns;
    end
    
    assign shift_ena = (cs != E);

endmodule

