module top (
    input clk,
    input reset_n,
    input [4:0] F_select,
    output reg clk_out
);

wire [27:0] divider;

f_select_ROM  ROM_inst (
	 .clk(clk),
    .dir(F_select),
    .rst(reset_n),
    .data(divider)
);

clk_divider clk_divider_inst (
    .clock_in(clk),
	.reset_n(reset_n),
    .divisor_input(divider),
    .clock_out (clk_out)
);

endmodule

