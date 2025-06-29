module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter S = 4'd0, S1 = 4'd1, S11 = 4'd2, S110 = 4'd3, B0 = 4'd4, B1 = 4'd5, B2 = 4'd6, B3 = 4'd7, COUNT = 4'd8, WAIT = 4'd9;
    reg [3:0] ns, cs;
    
    always @(*) begin
        case (cs)
            S : ns = data ? S1 : S;
            S1 : ns = data ? S11 : S;
            S11 : ns = data ? S11 : S110;
            S110 : ns = data ? B0 : S;
            B0 : ns = B1;
            B1 : ns = B2;
            B2 : ns = B3;
            B3 : ns = COUNT;
            COUNT : ns = done_counting ? WAIT : COUNT;
            WAIT : ns = ack ? S : WAIT;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) cs <= S;
        else cs <= ns;
    end
    
    assign shift_ena = cs == B0 || cs == B1 || cs == B2 || cs == B3;
    assign counting = cs == COUNT;
    assign done = cs == WAIT;
        

endmodule

