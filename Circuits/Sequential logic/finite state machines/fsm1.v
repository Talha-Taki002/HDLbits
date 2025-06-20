module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset) out <= B;
        else begin
            case (in)
                1'b0: out <= (out == A? B:A);
                default: out <= out;
            endcase
        end
    end


endmodule

