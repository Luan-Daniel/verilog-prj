module adder
#(parameter N = 4)
(a, b, c_in, sum, c_out);
	input [N-1:0] a, b;
	input c_in;
	output [N-1:0] sum;
	output c_out;

	wire [N:0] gc;
	genvar gi;
	generate
		for (gi = 0; gi < N; gi = gi + 1) begin : gen_adder
			if (gi==0) assign gc[0] = c_in;
			full_adder FA(.a(a[gi]), .b(b[gi]), .cin(gc[gi]), .cout(gc[gi+1]), .sum(sum[gi]));
			if (gi==N-1) assign c_out = gc[N];
		end
	endgenerate

endmodule //full_adder