module f_select_ROM #(
	parameter width_dir = 5, // Definir el ancho de width_dir
   width_data = 28 // Definir el ancho de width_data
)(
	 input clk,
    input [width_dir-1:0] dir,
    input rst,
    output  [width_data-1:0] data
);


reg [width_data:0] datan;

always @(posedge clk)
begin
	if (rst == 1) begin
		datan = 0;
	end
	else begin
		case (dir)
        0: datan = 50_000_000; 
        1: datan = 5_000_000; 
        2: datan = 2_500_00; 
        3: datan = 2_000_000; 
        4: datan = 1_000_000; 
        5: datan = 500_000; 
        6: datan = 250_000; 
        7: datan = 200_000; 
        8: datan = 100_000; 
        9: datan = 66_667; 
        10: datan = 50_000; 
        11: datan = 5_000; 
        12: datan = 2_500; 
        13: datan = 2_000; 
        14: datan = 1_000; 
        15: datan = 665; 
        16: datan = 500; 
        17: datan = 250; 
        18: datan = 200; 
        19: datan = 100; 
        20: datan = 65; 
        21: datan = 50; 
        22: datan = 12; 
        23: datan = 10; 
        24: datan = 8; 
        25: datan = 6; 
        26: datan = 4; 
        27: datan = 2; 
		endcase
	end
end
	assign data = datan;

endmodule











