module mux4
#(parameter N = 4)
(in_00, in_01, in_10, in_11, select, result);
  input [N-1:0] in_00, in_01, in_10, in_11;
  input [1:0] select;
  output [N-1:0] result;

  assign result =
  (select[1])?
    ((select[0])? in_11:in_10):
    ((select[0])? in_01:in_00);

endmodule