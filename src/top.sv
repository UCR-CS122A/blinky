module top
(
    input wire clk,

    output wire led
);

logic [63:0] clk_div_counter;

assign clk_2s   = clk_div_counter[25]; // assuming 25MHz toggle roughly every 2s
assign clk_1s   = clk_div_counter[24]; // assuming 25MHz toggle roughly every 1s
assign clk_0s5  = clk_div_counter[23]; // assuming 25MHz toggle roughly every 0.5s
assign clk_0s25 = clk_div_counter[22]; // assuming 25MHz toggle roughly every 0.25s

assign clk_2x_slow = clk_div_counter[1];
assign clk_4x_slow = clk_div_counter[2];
assign clk_8x_slow = clk_div_counter[3];

assign led = clk_1s;

always_ff @(posedge clk) begin
    clk_div_counter <= clk_div_counter + 1;
end

endmodule
