// ESCALA DE TEMPO: 1ns -> unidade de tempo/1ps -> passo de simulação
`timescale 1ns/1ps  

// NOME DO MÓDULO DE SIMULAÇÃO - TOPO DA HIERARQUIA
// OBSERVE QUE NÃO POSSUI PORTLIST
module halfadder_tb;

// PARA SIMULAÇÃO: SINAIS QUE VÃO SER 
// INJETADOS (MODIFICADOS) SÃO DO TIPO reg
// SINAIS QUE VÃO SER "LIDOS" OU INTERCONECTAM
// MÓDULOS SÃO DO TIPO wire 
reg  a_tb, b_tb; 
wire carry_tb, sum_tb;

// INSTÂNCIA halfadd A SER SIMULADA
// AQUI É FEITO O PORTMAP, OU SEJA,
// A LIGAÇÃO ENTRE OS MÓDULOS
halfadd U0(
	.a		(a_tb), 
	.b		(b_tb), 
	.sum	(sum_tb), 
	.carry	(carry_tb)
);

// CORPO DA SIMULAÇÃO - AQUI VAMOS TESTAR O halfadd.v
// OBSERVE:
// SINAIS INICIALIZADOS COM ZERO
// TODOS OS POSSÍVEIS ESTADOS DE a_tb E b_tb SÃO CONTEMPLADOS
initial begin
  a_tb = 1'b0;
  b_tb = 1'b0;
  #2;// TEMPORIZAÇÃO - DOIS CICLOS DE SIMULAÇÃO
  a_tb = 1'b1;
  b_tb = 1'b0;
  #2;
  a_tb = 1'b0;
  b_tb = 1'b1;
  #2;
  a_tb = 1'b1;
  b_tb = 1'b1;
  #5;
  $end();
end
// Fim do módulo
endmodule