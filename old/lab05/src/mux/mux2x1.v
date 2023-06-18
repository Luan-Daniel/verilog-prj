module mux2x1 #(parameter BUS_SIZE=4) (
	input  [BUS_SIZE-1:0]a_i,
	input  [BUS_SIZE-1:0]b_i,
	input  sel_i,
	output [BUS_SIZE-1:0]mux_o
);

	assign mux_o = sel_i ? b_i : a_i;

endmodule //mux2x1
