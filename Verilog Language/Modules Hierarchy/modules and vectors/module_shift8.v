module mux4(input [7:0] d0, d1, d2, d3, input [1:0] sel, output [7:0] q);
    // sop
    assign q = ({8{(~sel[0]) & (~sel[1])}} & d0) | ({8{(sel[0]) & (~sel[1])}} & d1) | ({8{(~sel[0]) & (sel[1])}} & d2) 
                                                                                      | ({8{(sel[0]) & (sel[1])}} & d3);
endmodule
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);	
    wire [7:0] w1, w2, w3;
    my_dff8 dff1(.clk(clk), .d(d), .q(w1));
    my_dff8 dff2(.clk(clk), .d(w1), .q(w2));
    my_dff8 dff3(.clk(clk), .d(w2), .q(w3));
    
    mux4 mux(d, w1, w2, w3, sel, q); 
    
   
endmodule

