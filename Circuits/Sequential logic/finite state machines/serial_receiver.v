module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    reg [1:0] cs, ns;
    reg [3:0] cnt;
    
    parameter IDLE = 2'b00, READ = 2'b01, DONE = 2'b10, WAIT = 2'b11;
    
    always @(*) begin
        case (cs)
            IDLE : ns = in ? IDLE : READ;
            READ : ns = (cnt <= 4'd8) ? READ : (in ? DONE : WAIT);
            DONE : ns = in ? IDLE : READ;
            WAIT : ns = in ? IDLE : WAIT;
            default : ns = IDLE;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            cs <= IDLE;
            cnt <= 0;
        end
        else begin
            cs <= ns;
            if (ns == READ) cnt <= (cnt <= 4'd8) ? cnt + 1'b1 : cnt;
            else cnt <= 0;
        end
    end
    
    assign done = cs == DONE;

endmodule

