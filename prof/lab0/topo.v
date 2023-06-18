/*
ESTE EXEMPLO DESCREVE O ARQUIVO DE TOPO
DA HIERARQUIA. SÃO FEITAS DUAS INSTÂNCIA:
mux2x1 E or_base.

OBSERVAR SEMPRE AS PORTAS DE CADA MÓDULO
WIRE -> UTILIZADO PARA INTERLIGAR PORTAS
REG -> PARA REGISTRAR SAÍDAS
*/

module topo (a, b, sel, op_or);

input wire  a;
input wire  b;
input wire  sel;

output wire  op_or;

wire ligacao;

// INSTÂNCIA mux2x1 <"APELIDO" u0> <INTERLIGAÇÃO>
mux2x1 u0 (.a(a), .b(b), .sel(sel), .op(ligacao));

// INSTÂNCIA or_base <"APELIDO" u1> <INTERLIGAÇÃO>
or_base u1(.a(ligacao), .b(1), .c(op_or));

endmodule
