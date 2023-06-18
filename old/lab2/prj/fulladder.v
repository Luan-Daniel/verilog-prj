`include "..\\..\\lab01\\src\\half_adder.v"

module fulladder(
	input wire a_i,
	input wire b_i,
	input wire cin_i,

	output wire sum_o,
	output wire car_o
);

	wire w_sum, w_car1, w_car2;

	// U1
	half_adder u1(
		.a_i(a_i),
		.b_i(b_i),
		.s_i(w_sum),
		.c_i(w_car1)
	);

	// U1
	half_adder u2(
		.a_i(w_sum),
		.b_i(cin_i),
		.s_i(sum_o),
		.c_i(w_car2)
	);

	// U3
	assign car_o = w_car1 || w_car2;

endmodule
