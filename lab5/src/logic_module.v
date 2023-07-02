module logic_module
#(parameter N = 4)
(a, b, select, result);
  localparam MSB = (N-1);
  localparam LSB = (0);

  input [MSB:LSB] a, b;
  input [1:0] select;
  output [MSB:LSB] result;

  wire [MSB:LSB]
    and_res, or_res,
    xor_res, comp_res;

  assign and_res = a&b;
  assign or_res = a|b;
  assign xor_res = a^b;
  assign comp_res = ~a;

  mux4 #(.N(N)) L_MUX(
    .in_00(and_res),
    .in_01(or_res),
    .in_10(xor_res),
    .in_11(comp_res),
    .select(select),
    .result(result)
  );
endmodule