module arithmetic_module
#(parameter N = 4)
(a, b, carry_in, select, carry_out, result);
  localparam MSB = (N-1);
  localparam LSB = (0);

  input [MSB:LSB] a, b;
  input carry_in;
  input [1:0] select;
  output carry_out;
  output [MSB:LSB] result;

  wire [MSB:LSB] inc = 1, dec = -1;
  wire [MSB:LSB] b_res;

  mux4 #(.N(N)) B_MUX(
    .in_00(b),
    .in_01(-b),
    .in_10(inc),
    .in_11(dec),
    .select(select),
    .result(b_res)
  );

  adder #(.N(N)) ADDER(
    .a(a), .b(b_res),
    .c_in(carry_in),
    .c_out(carry_out), .sum(result)
  );
endmodule