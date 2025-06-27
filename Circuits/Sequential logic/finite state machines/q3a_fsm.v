module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] cs, ns;
    reg [1:0] cnt;
    
    always @(*) begin
        case (cs)
            A : ns = s ? B : A;
            B : ns = C;
            C : ns = D;
            D : ns = B;
            default : ns = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            cs <= A;
            cnt <= 0;
        end
        else begin
            cs <= ns;
            case (cs)
                B : cnt <= w;
                C, D : cnt <= cnt + w;
                default : cnt <= cnt;
            endcase
        end
    end
                
      
    assign z = (cs == B && cnt == 2'b10);

endmodule

