module mux2
#(parameter N = 4)
(in_0, in_1, select, result);
  input [N-1:0] in_0, in_1;
  input select;
  output [N-1:0] result;

  assign result = (select)? in_1: in_0;

endmodule