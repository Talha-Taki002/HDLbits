module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
   	parameter S1 = 2'b00, S2 = 2'b01, S3 = 2'b10;
    reg [1:0] ns, cs;
    
    always @(*) begin
        case (cs)
            S1 : ns = x ? S2 : S1;
            S2 : ns = x ? S2 : S3;
            S3 : ns = x ? S2 : S1;
            default : ns = S1;
        endcase
    end
    
    always @(posedge clk, negedge aresetn) begin
        if (~aresetn) cs <= S1;
        else cs <= ns;
    end
    
    assign z = (cs == S3) & x;

endmodule

