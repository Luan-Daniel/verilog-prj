/*
ESTE EXEMPLO DESCREVE UM MEIO-SOMADOR
*/

// MODULO + NOME + PORTLIST
module halfadd (a, b, sum, carry);

// DECLARAÇÃO DAS PORTAS - INPUT E OUTPUT
input  wire a, b; 
output wire sum, carry;

// COMPORTAMENTO DO MEIO-SOMADOR
// OBSERVAR O OPERADOR ASSIGN -> UTILIZADO PARA LÓGICA COMBINACIONAL
assign sum = a ^ b;   // OPERADOR LÓGICO OU
assign carry = a & b; // OPERADOR LÓGICO AND

endmodule