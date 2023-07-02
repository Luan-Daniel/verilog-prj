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

	wire [N-1:0] gc;
	genvar gi;
	generate
		for (gi = 0; gi < N; gi = gi + 1) begin : gen_adder
			half_adder HA(.a(a[gi]), .b(b[gi]), .s(s[gi]), .c(gc[gi]));
			if (gi == 0) assign gc[0] = i;
			else assign gc[gi] = HA.c;
		end
	endgenerate
	assign c = gc[N-1];

endmodule //full_adder
