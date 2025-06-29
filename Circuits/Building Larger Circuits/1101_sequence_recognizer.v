module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    parameter A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4;
    reg [2:0] ns, cs;
    
    always @(*) begin
        case (cs)
            A : ns = data ? B : A;
            B : ns = data ? C : A;
            C : ns = ~data ? D : C;
            D : ns = data ? E : A;
            E : ns = E;
            default : ns = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) cs <= A;
        else begin
            cs <= ns;
        end
    end
    
    assign start_shifting = cs == E;

endmodule

