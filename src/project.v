

`define default_netname none

module tt_um_frq_divider(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    top frq_divider(

        .clk(uio_in[0]),
        .reset_n(ui_in[5]),
        .F_select(ui_in[4:0]),
        .clk_out(uio_out[1])
        
    );

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out [7:0] = 8'b00000000; // Example: ou_out is the sum of ui_in and uio_in
    assign  uio_out [7:2] = 6'd0;
    assign  uio_out [0] = 1'b0;
    assign uio_oe [7:0] = 8'b00000010;

endmodule

