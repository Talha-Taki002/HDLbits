`timescale 1ps/1ps

module top_module;
	reg in, clk;
    reg [2:0] s;
    
    wire out;
    
    initial begin
        in = 0;
        s = 2;
        clk = 0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        #20 in = 1'b1;
        #10 in = 1'b0;
        #10 in = 1'b1;
        #30 in = 1'b0;
    end
    
    initial begin
        #10 s = 3'd6;
        #10 s = 3'd2;
        #10 s = 3'd7;
        #10 s = 3'd0;
    end
    
    q7 dut(.clk(clk), .in(in), .s(s), .out(out));
    
endmodule

