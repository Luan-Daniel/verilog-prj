module processor (entrada_a, entrada_b, saida_a, saida_b, clk_i);

input wire entrada_a, entrada_b, clk_i;

output reg saida_a;
output wire saida_b;

reg entradasAeB;

wire w_sinal1;
wire w_sinal2;

always@(entrada_a or entrada_b)
begin
	entradasAeB = entrada_a & entrada_b;
end

always@(posedge clk_i)
begin
	if (entradasAeB == 1)
		saida_a = 1;
	else
		saida_a = 0;
end

assign w_sinal1 = entrada_a & entrada_b;

assign w_sinal2 = entrada_a & entrada_b;

assign saida_b = w_sinal2 | w_sinal2;


endmodule
