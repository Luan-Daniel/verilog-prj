/*
ESTE EXEMPLO DESCREVE UM MULTIPLEXADOR 
PARAMETRIZÁVEL 
*/

module mux_2x1_p 
#(
 parameter N = 4
 )
(
	input [N-1:0] a, 
	input [N-1:0] b, 
	input sel,
	
	output reg [N-1:0] op
);

always @(a or b or sel) 
begin
  if (sel == 1'b1)
     op = a;
  else
    op = b;
end

endmodule