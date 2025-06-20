// systemVerilog
top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    
    integer i, j, di, dj, ni, nj, count;
    reg [15:0][15:0] grid, next_grid;

    // Flatten q for output
    always_comb begin
        for (i = 0; i < 16; i++)
            for (j = 0; j < 16; j++)
                q[i*16 + j] = grid[i][j];
    end

    // Next state logic
    always_comb begin
        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin
                count = 0;
                for (di = -1; di <= 1; di++) begin
                    for (dj = -1; dj <= 1; dj++) begin
                        if (!(di == 0 && dj == 0)) begin
                            ni = (i + di + 16) % 16;
                            nj = (j + dj + 16) % 16;
                            count = count + grid[ni][nj];
                        end
                    end
                end

                if (count == 3)
                    next_grid[i][j] = 1;
                else if (count == 2)
                    next_grid[i][j] = grid[i][j];
                else
                    next_grid[i][j] = 0;
            end
        end
    end

    // Sequential update
    always @(posedge clk) begin
        if (load) begin
            for (i = 0; i < 16; i++)
                for (j = 0; j < 16; j++)
                    grid[i][j] <= data[i*16 + j];
        end else begin
            for (i = 0; i < 16; i++)
                for (j = 0; j < 16; j++)
                    grid[i][j] <= next_grid[i][j];
        end
    end

endmodule

