/**
 * lab0 - multiplexador 2x1
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** src\mux2x1.v **
 * Define um modulo para um multiplexador 2x1
 */

/**
 * Modulo para multiplexador 2x1
 * @param A_i I|Primeiro dado do mux
 * @param B_i I|Segundo dado do mux
 * @param S_i I|Seletor do mux
 * @param X_o O|Saida do mux
 */

module mux2x1
(A_i, B_i, S_i, X_o);
	input A_i, B_i, S_i;
	output X_o;

	assign X_o = (S_i)? B_i : A_i;

endmodule //mux2x1
