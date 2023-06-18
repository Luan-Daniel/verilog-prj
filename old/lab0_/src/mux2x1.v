/*
ESTE EXEMPLO DESCREVE UM MULTIPLEXADOR 
COM DUAS PORTAS DE ENTRADA, SELETOR DE 
UM BIT (2^n POSSIBILIDADES) E UMA SAÍDA
*/
module mux2x1
(
	input a, 
	input b, 
	input sel,
	
	output reg op
);

// PROCESSO QUE OBSERVA QUALQUER 
// MUDANÇA NOS SINAIS a or b or sel
always @(a or b or sel) // EXEMPLO COMPORTAMENTAL
begin
  if (sel == 1'b1)
    op = a;
  else
    op = b;
end

endmodule
