/**
 * lab4 - Parameter Full Adder
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** lab4\src\full_adder.v **
 * Define um modulo para um somador de N bits
 */

module full_adder
#(parameter N = 4)
(a, b, i, s, c);
	input [N-1:0] a, b;
	input i;
	output [N-1:0] s;
	output c;

	wire [N-1:0] s1, s2, i1;
	wire c1, c2;

	assign i1 = 0 + i;

	half_adder #(N) U1(
		.a(a),
		.b(b),
		.s(s1),
		.c(c1)
	);

	half_adder #(N) U2(
		.a(s1),
		.b(i1),
		.s(s),
		.c(c2)
	);

	assign c = c1 || c2;

endmodule //full_adder
