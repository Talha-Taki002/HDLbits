module Full_adder (input a, b, cin, output cout, sum );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    Full_adder full_adder0(a[0], b[0], cin, cout[0], sum[0]);
    Full_adder full_adder1(a[1], b[1], cout[0], cout[1], sum[1]);
    Full_adder fullder_adder2(a[2], b[2], cout[1], cout[2], sum[2]);
    

endmodule

