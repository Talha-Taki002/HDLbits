module fadd(input a, b, cin, output cout, sum );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b&cin) | (a & cin);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    wire [100:0] carry_in;
    
    assign carry_in[0] = cin;
    
    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin : loop
            fadd add(a[i], b[i], carry_in[i], cout[i], sum[i]); 
            assign carry_in[i+1] = cout[i];
        end
    endgenerate

endmodule

