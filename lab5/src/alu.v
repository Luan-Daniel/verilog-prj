module alu
#(parameter N = 4)
(a, b, carry_in, select, result, n_flag, c_flag, v_flag, z_flag);
  localparam MSB = (N-1);
  localparam LSB = (0);

  input [MSB:LSB] a, b;
  input carry_in;
  input [2:0] select;
  output [MSB:LSB] result;
  output n_flag, c_flag, v_flag, z_flag;

  // - logic module -
  // sel: 111 | 110 | 101 | 100
  // op:  (~a) (a^b) (a|b) (a&b)
  wire [MSB:LSB] logic_result;
  logic_module #(.N(N)) MOD_1(
    .a(a), .b(b),
    .select(select[1:0]),
    .result(logic_result)
  );

  // - arithmetic module -
  // sel: 011 | 010 | 001 | 000
  // op: (a-1) (a+1) (a-b) (a+b)
  wire carry_out;
  wire [MSB:LSB] arithmetic_result;
  arithmetic_module #(.N(N)) MOD_0(
    .a(a), .b(b),
    .carry_in(carry_in),
    .select(select[1:0]),
    .carry_out(carry_out),
    .result(arithmetic_result)
  );

  // - result mux -
  // sel || result
  // 1XX => logic_result
  // 0XX => arithmetic_result
  mux2 #(.N(N)) MUX_0(
    .in_0(arithmetic_result),
    .in_1(logic_result),
    .select(select[2]),
    .result(result)
  );

  flag_circuit #(.N(N)) FC_0(
    .a(a), .b(b), .c(carry_out),
    .s(arithmetic_result),
    .n_flag(n_flag), // negative flag
    .c_flag(c_flag), // carry flag
    .v_flag(v_flag), // overflow flag
    .z_flag(z_flag)  // zero flag
  );

endmodule