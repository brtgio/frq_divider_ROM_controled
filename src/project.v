/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_frq_divider (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    top frq_divider(
        .clk(clk),
        .reset_n(rst_n),
        .F_select(ui_in[4:0]),
        .clk_out(uio_in[2])
    );

    // All output pins must be assigned. If not used, assign to 0.
    assign uo_out [7:0] = 8'b00000000; // Example: ou_out is the sum of ui_in and uio_in
    assign uio_out [7:3] = 4'b0000;
    assign uio_oe [7:0] = 8'b00000100;

endmodule

