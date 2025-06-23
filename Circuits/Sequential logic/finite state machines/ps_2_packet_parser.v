module top_module(
    input clk,
    input [7:0] in,
    input reset,
    output done);
    
    parameter B0 = 2'b00, B1 = 2'b01, B2 = 2'b10, B3 = 2'b11;
    reg [1:0] cs, ns;
    
    always @(*) begin
        case (cs)
            B0 : ns = in[3] ? B1 : B0;
            B1 : ns = B2;
            B2 : ns = B3;
            B3 : ns = in[3] ? B1: B0;
            default : ns = B0;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) cs <= B0;
        else cs <= ns;
    end
    
    assign done = cs == B3;
    
    

endmodule

