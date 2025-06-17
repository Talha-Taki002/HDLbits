module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);
    reg [11:0] Q;
    bcdcount counter0 (clk, reset, c_enable[0], Q[3:0]);
    bcdcount counter1 (clk, reset, c_enable[1], Q[7:4]);
    bcdcount counter2 (clk, reset, c_enable[2], Q[11:8]);
    //always @(posedge clk) begin
    assign  {OneHertz, c_enable} = {Q[11:0] == 12'h999, Q[7:0] == 8'h99, Q[3:0] == 4'h9, 1'b1};
   // end

endmodule

