module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
    count4 counter(.clk(clk), .enable(c_enable), .load(c_load), .d(c_d), .Q(Q));
    always @(*) begin
        c_enable = enable;
        c_load = reset || (Q == 12 && enable)? 1:0;
        c_d = 1;
    end
    

endmodule

