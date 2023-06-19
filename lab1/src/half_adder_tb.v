/**
 * lab1 - Meio somador de 1 bit
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** src\half_adder_tb.v **
 * Testes para meio somador
 * @see half_adder
 */

module half_adder_tb;

	reg reg_a, reg_b;
	wire wire_s, wire_c;

	integer TIME_COUNT;

	half_adder ADD_0(
		.a(reg_a),
		.b(reg_b),
		.s(wire_s),
		.c(wire_c)
	);

	initial begin
		TIME_COUNT = 0;
		reg_a = 1'b0;
		reg_b = 1'b0;
		#5; TIME_COUNT = TIME_COUNT+5;
		reg_a = 1'b0;
		reg_b = 1'b1;
		#5; TIME_COUNT = TIME_COUNT+5;
		reg_a = 1'b1;
		reg_b = 1'b0;
		#5; TIME_COUNT = TIME_COUNT+5;
		reg_a = 1'b1;
		reg_b = 1'b1;
		#5; TIME_COUNT = TIME_COUNT+5;
		$finish;
	end

	always @(reg_a or reg_b) begin
		$display ("TIME: %d", TIME_COUNT);
		$display ("reg: 2'b%b%b", reg_a, reg_b);
		$display ("res: 2'b%b%b", wire_c, wire_s);
	end

endmodule
