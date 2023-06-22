/**
 * lab0 - multiplexador 2x1
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** lab0\src\mux2x1_tb.v **
 * Testes para multiplexador 2x1
 * @see mux2x1
 */

`timescale 1ps/1ps
module mux2x1_tb;

	reg a_tb, b_tb, s_tb;
	wire x_tb;

	mux2x1 M0(
		.A_i (a_tb),
		.B_i (b_tb),
		.S_i (s_tb),
		.X_o (x_tb)
	);

	initial begin
		a_tb = 1'b0;
		b_tb = 1'b1;
		s_tb = 1'b0;
		#5;
		s_tb = 1'b1;
		#5;
		$finish;
	end

	always @(a_tb or b_tb or s_tb) begin
		$display ("a_tb: %b", a_tb);
		$display ("b_tb: %b", b_tb);
		$display ("s_tb: %b", s_tb);
		$display ("x_tb: %b", x_tb);
	end

endmodule //mux2x1_tb
