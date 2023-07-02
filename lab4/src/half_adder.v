/**
 * lab4
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** lab4\src\half_adder.v **
 * Define um modulo para um meio somador de N bits
 */

module half_adder
(a, b, sum, cout);
	input  a, b;
	output sum;
	output cout;

	assign sum = a ^ b;
	assign cout = a & b;

endmodule //half_adder
