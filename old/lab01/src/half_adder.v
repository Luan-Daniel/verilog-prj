module half_adder(
	input wire a_i,
	input wire b_i,

	output wire s_i,
	output wire c_i
);

assign s_i = a_i ^ b_i;
assign c_i = a_i & b_i;

endmodule
