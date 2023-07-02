module full_adder
(a, b, cin, sum, cout);
	input  a, b, cin;
	output sum;
	output cout;

	wire s0, c0, c1;

	half_adder HA_0(
		.a(a),
		.b(b),
		.sum(s0),
		.cout(c0)
	);

	half_adder HA_1(
		.a(s0),
		.b(cin),
		.sum(sum),
		.cout(c1)
	);

	assign cout = c0 | c1;

endmodule //full_adder