/**
 * lab1 - Meio somador de 1 bit
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** src\half_adder.v **
 * Define um modulo para um meio somador de 1-bit
 */

/**
 * Modulo para half adder de 1bit
 * @param a I|Primeiro bit da soma
 * @param b I|Segundo bit da soma
 * @param s O|Resultado da soma
 * @param c O|Carry da soma
 */

module half_adder
(a, b, s, c);
	input a, b;
	output s, c;

	//assign {c, s} = a + b;
	assign c = a & b;
	assign s = a ^ b;

endmodule //half_adder
