module mux4x1 #(parameter BUS_SIZE=4) (
	input  [BUS_SIZE-1:0] a_i,
	input  [BUS_SIZE-1:0] b_i,
	input  [BUS_SIZE-1:0] c_i,
	input  [BUS_SIZE-1:0] d_i,
	input  [1:0] sel_i,
	output [BUS_SIZE-1:0] mux_o
);

	assign mux_o = sel_i[1] ?
		(sel_i[0] ? d_i: c_i) :
		(sel_i[0] ? b_i: a_i);

endmodule //mux4x1
