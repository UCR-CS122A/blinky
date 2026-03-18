`include "src/top.sv"

module top_tb;

logic clkin;
wire  ledout;

top blink_inst
(
    .clk(clkin),
    .led(ledout)
);

localparam CLK_PERIOD = 2; // clk period is 2 ticks
always #(CLK_PERIOD/2) clkin = ~clkin; // toggle clk every sim tick

initial begin
    $dumpfile("build/top.vcd"); // save waveform script at build/top.vcd
    $dumpvars(0, top_tb); // collect all available signals (wires/reg)
end

initial begin
    clkin <= 0; // start clk at 0
    #(CLK_PERIOD*20); // simulate for 20 cycles
    $finish; // end simulation
end

endmodule
