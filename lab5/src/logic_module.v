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

  mux #(.N(N), .S(2)) L_MUX(
    .buses({comp_res, xor_res, or_res, and_res}),
    .select(select),
    .result(result)
  );
endmodule