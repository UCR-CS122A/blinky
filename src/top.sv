module top
(
    input clk,

    output led
);

reg [63:0] clk_div_counter;

assign clk_2s   = clk_div_counter[25]; // assuming 25M
assign clk_1s   = clk_div_counter[24]; // assuming 25M
assign clk_0s5  = clk_div_counter[23]; // assuming 25M
assign clk_0s25 = clk_div_counter[22]; // assuming 25M

assign led = clk_1s;

always @(posedge clk) begin
    clk_div_counter <= clk_div_counter + 1;
end

endmodule
