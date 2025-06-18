module my_dff(input clk, input data, output q);
    always @(posedge clk) begin
        q <= data;
    end
endmodule

module my_mux(input a, b, sel, output q);
    assign q = (~sel & a) | (sel & b);
endmodule

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire [2:0] w, r;
[2;2R[3;1R[>77;30706;0c]10;rgb:bfbf/bfbf/bfbf]11;rgb:0000/0000/0000    wire clk, L;
    
    assign r = SW;
    assign clk = KEY[0];
    assign L = KEY[1];
    
    my_mux mux1(LEDR[2], r[0], L, w[0]);
    my_dff dff1(clk, w[0], LEDR[0]);
    my_mux mux2(LEDR[0], r[1], L, w[1]);
    my_dff dff2(clk, w[1], LEDR[1]);
    my_mux mux3(LEDR[2] ^ LEDR[1], r[2], L, w[2]);	
    my_dff dff3(clk, w[2], LEDR[2]);                                                 
    
   
endmodule

