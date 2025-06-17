module bcd_counter(input clk, input reset, input enable, input [3:0] limit, output [3:0] q);
    always @(posedge clk) begin
        if (reset) q <= 4'd0;
        else if (enable) begin
            if (q == limit) q <= 4'd0;
            else q <= q + 4'd1;
        end
    end
endmodule

module counter(input clk, input reset, input ena, input [7:0] limit, output [7:0] q);
    wire enable;
    assign enable = (q[3:0] == limit[3:0] && ena);
    bcd_counter bcd1(clk, reset, ena, limit[3:0], q[3:0]);
    bcd_counter bcd10(clk, reset, enable, limit[7:4], q[7:4]);
endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    wire [1:0] enable;
    
    assign enable = {mm == 8'h59 && ss == 8'h59, ss == 8'h59};
    
    counter second(clk, reset, ena, 8'h59, ss);
    counter minute(clk, reset, enable[0], 8'h59, mm);

    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            pm <= 1'b0;
        end
        else if (enable[1] && ena) begin
            if (hh == 8'h11) pm <= ~pm;
            case (hh)
                8'h12 : hh <= 8'h01;
                8'h09 : hh <= 8'h10;
                default: hh <= hh + 8'h01;
            endcase
        end
    end

endmodule

