module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [100:0] carry_in;
    wire [99:0] carry_out;
    
    assign carry_in[0] = cin;
    
    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin : loop
            bcd_fadd add(.a(a[(i*4 + 3): i*4]), .b(b[(i*4 + 3): i*4]), .cin(carry_in[i]), .cout(carry_out[i]), .sum(sum[(i*4 + 3): i*4]));
            assign carry_in[i+1] = carry_out[i];
        end
    endgenerate
    assign cout = carry_in[100];
    
    

endmodule

