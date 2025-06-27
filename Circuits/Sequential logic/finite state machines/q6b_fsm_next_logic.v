module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;
    reg [3:1] ns;
    
    always @(*) begin
        case (y)
            A : ns = w ? A : B;
            B : ns = w ? D : C;
            C : ns = w ? D : E;
            D : ns = w ? A : F;
            E : ns = w ? D : E;
            F : ns = w ? D : C;
            default : ns = A;
        endcase
    end
    
    assign Y2 = ns[2];

endmodule

