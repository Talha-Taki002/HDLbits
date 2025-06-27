module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    parameter START = 2'b00, FIRST = 2'b01, SECOND = 2'b10, DONE = 2'b11;
    reg [1:0] cs, ns;
    
    always @(*) begin
        case (cs)
            START : ns = in[3] ? FIRST : START;
            FIRST : ns = SECOND;
            SECOND : ns = DONE;
            DONE : ns = in[3] ? FIRST : START;
            default : ns = START;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            cs <= START;
        end
        else begin
            cs <= ns;
            out_bytes[23:16] <= (ns == FIRST ? in : out_bytes[23:16]);
            out_bytes[15:8] <= (ns == SECOND ? in : out_bytes[15:8]);
            out_bytes[7:0] <= (ns == DONE ? in : out_bytes[7:0]);
        end
    end
    
    assign done = cs == DONE;
                

    

endmodule

