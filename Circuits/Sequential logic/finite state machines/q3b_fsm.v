module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    reg [2:0] cs, ns;
    
    always @(*) begin
        case (cs)
            A : ns = x ? B : A;
            B : ns = x ? E : B;
            C : ns = x ? B : C;
            D : ns = x ? C : B;
            E : ns = x ? E : D;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) cs <= A;
        else cs <= ns;
    end
    
    assign z = cs == E || cs == D;
    
    

endmodule

