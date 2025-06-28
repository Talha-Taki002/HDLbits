module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A = 1'b0, B = 1'b1;
    reg ns, cs;
    
    always @(*) begin
        case (cs)
            A : ns = x ? B : A;
            B : ns = B;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) cs <= A;
        else cs <= ns;
    end
    
    assign z = ((cs == A) && x) || ((cs == B) && ~x);

endmodule

