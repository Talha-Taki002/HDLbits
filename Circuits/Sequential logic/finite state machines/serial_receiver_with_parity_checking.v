module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    reg [1:0] cs, ns;
    reg [3:0] cnt;
    reg odd;
    
    parameter IDLE = 2'b00, READ = 2'b01, DONE = 2'b10, WAIT = 2'b11;
    
    parity par(.clk(clk), .reset(cs != READ), .in(in), .odd(odd));
    
    always @(*) begin
        case (cs)
            IDLE : ns = in ? IDLE : READ;
            READ : ns = (cnt <= 4'd9) ? READ : (in ? (odd ? DONE : IDLE) : WAIT);
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
            if (ns == READ) begin
                cnt <= (cnt <= 4'd9) ? cnt + 1'b1 : cnt;
                if (cnt > 0 && cnt < 4'd9) out_byte[cnt-1] <= in;
            end
            else cnt <= 0;
        end
    end
    
    assign done = cs == DONE;

endmodule

    
