module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] ns, cs;
    
    always @(*) begin
        case (cs)
            A : ns = r[1] ? B : (r[2] ? C : (r[3] ? D : A));
            B : ns = ~r[1] ? A : B;
            C : ns = ~r[2] ? A : C;
            D : ns = ~r[3] ? A : D;
            default : ns = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (~resetn) cs <= A;
        else cs <= ns;
    end
    
	assign g = {cs == D, cs == C, cs == B};
    
    

endmodule

