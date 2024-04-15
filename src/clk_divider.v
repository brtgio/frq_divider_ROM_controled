module clk_divider (
    input clock_in,      // input clock on FPGA
    input [27:0] divisor_input, // input divisor value
    input reset_n,       // active low reset signal
    output reg clock_out // output clock after dividing the input clock by divisor
);

reg [27:0] counter = 28'd0;
reg [27:0] divisor;
reg flipflop1, flipflop2;

always @(posedge clock_in or posedge reset_n) begin
    if (reset_n==1) begin
        counter <= 28'd0;
        clock_out <= 1'b0;
    end else begin
        if (divisor_input != divisor) begin
            divisor <= divisor_input;
            counter <= 28'd0;
        end else begin
            counter <= counter + 28'd1;
            if (counter >= (divisor - 1))
                counter <= 28'd0;

            // Si el divisor no es un múltiplo exacto de 50MHz, usar dos flip-flops para sincronizar la salida
            if (divisor != 50_000_000) begin
                flipflop1 <= (counter < (divisor / 2));
                flipflop2 <= flipflop1;
                clock_out <= flipflop2;
            end else begin
                // Si el divisor es un múltiplo exacto de 50MHz, simplemente pasar la señal de entrada a la salida
                clock_out <= clock_in;
            end
        end
    end
end

endmodule















