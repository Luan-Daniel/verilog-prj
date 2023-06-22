/**
 * lab2 - Full Adder
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** lab2\src\full_adder.v **
 * Define um modulo para um somador de 1-bit
 */

/**
 * Modulo para full adder de 1bit
 * @param a I|Primeiro bit da soma
 * @param b I|Segundo bit da soma
 * @param i I|Carry In
 * @param s O|Resultado da soma
 * @param c O|Carry Out
 */

module full_adder
(a, b, i, s, c);
	input a, b, i;
	output s, c;

	wire s1, s2, c1, c2;

	half_adder U1(
		.a(a),
		.b(b),
		.s(s1),
		.c(c1)
	);

	half_adder U2(
		.a(s1),
		.b(i),
		.s(s),
		.c(c2)
	);

	assign c = c1 || c2;

endmodule //full_adder
