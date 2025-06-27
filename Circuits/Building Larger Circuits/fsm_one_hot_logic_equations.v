module top_module(
    input d,
    input done_counting,
    input ack,
    input [9:0] state,    // 10-bit one-hot current state
    output B3_next,
    output S_next,
    output S1_next,
    output Count_next,
    output Wait_next,
    output done,
    output counting,
    output shift_ena
); 
    parameter S=4'd0, S1=4'd1, S11=4'd2, S110=4'd3, B0=4'd4, B1=4'd5, B2=4'd6, B3=4'd7, Count=4'd8, Wait=4'd9;
    
    reg [9:0] ns;
    assign ns[S] = (~d & (state[S] | state[S1] | state[S110])) | (ack & state[Wait]);
    assign ns[S1] = d & state[S];
    assign ns[S11] = d & (state[S1] | state[S11]);
    assign ns[S110] = ~d & state[S11];
    assign ns[B0] = d & state[S110];
    assign ns[B1] = state[B0];
    assign ns[B2] = state[B1];
    assign ns[B3] = state[B2];
    assign ns[Count] = state[B3] | (~done_counting & state[Count]);
    assign ns[Wait] = (~ack & state[Wait]) | (done_counting & state[Count]);
    
    assign B3_next = ns[B3];
    assign S_next = ns[S];
    assign S1_next = ns[S1];
    assign Count_next = ns[Count];
    assign Wait_next = ns[Wait];
    assign done = state[Wait];
    assign counting = state[Count];
    assign shift_ena = |state[7:4];
    

endmodule

