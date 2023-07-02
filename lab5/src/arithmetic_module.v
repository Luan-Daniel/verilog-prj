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

  full_adder #(.N(N)) ADDER(
    .a(a), .b(b_res),
    .i(carry_in),
    .c(carry_out), .s(result)
  );
endmodule