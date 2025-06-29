module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter NONE = 4'd0, ONE = 4'd1, TWO = 4'd2, THREE = 4'd3, FOUR = 4'd4, FIVE = 4'd5, SIX = 4'd6, FLAG = 4'd7, DISCARD = 4'd8, ERROR = 4'd9;
    
    reg [3:0] cs, ns;
    
    always @(*) begin
        case (cs)
            NONE : ns = in ? ONE : NONE;
            ONE : ns = in ? TWO : NONE;
            TWO : ns = in ? THREE : NONE;
            THREE : ns = in ? FOUR : NONE;
            FOUR : ns = in ? FIVE : NONE;
            FIVE : ns = in ? SIX : DISCARD;
            SIX : ns = in ? ERROR : FLAG;
            FLAG : ns = in ? ONE : NONE;
            DISCARD : ns = in ? ONE : NONE;
            ERROR : ns = in ? ERROR : NONE;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) cs <= NONE;
        else cs <= ns;
    end
    
    assign flag = cs == FLAG;
    assign err = cs == ERROR;
    assign disc = cs == DISCARD;
    
    
    
    

endmodule

