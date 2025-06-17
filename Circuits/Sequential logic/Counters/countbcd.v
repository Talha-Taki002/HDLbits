module bcd (
    input clk,
    input reset,      
    input enable,
    output [3:0] q);
    
    always @(posedge clk) begin
        if (reset) q <= 0;
        else if (enable) begin
            if (q == 4'd9) q <= 0;
            else q <= q + 1;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    // sequential logic
    bcd bcd_counter1(clk, reset, 1'b1, q[3:0]);
    bcd bcd_counter10(clk, reset, ena[1], q[7:4]);
    bcd bcd_counter100(clk, reset, ena[2], q[11:8]);
    bcd bcd_counter1000(clk, reset, ena[3], q[15:12]);
    
    // combinational logic
    assign ena[3:1] = {q[11:0] == 12'h999, q[7:0] == 8'h99, q[3:0] == 4'h9};

endmodule

