module flag_circuit
#(parameter N = 4)
(a, b, c, s, n_flag, c_flag, v_flag, z_flag);
  localparam MSB = (N-1);

  input [MSB:0] a, b, s;
  input c;
  output n_flag, c_flag, v_flag, z_flag;

  assign z_flag = !s; // zero flag
  assign n_flag = s[MSB]; // negative flag
  assign v_flag = ((a[MSB]&b[MSB])&(s[MSB]^a[MSB])); // overflow flag
  assign c_flag = c; // carry flag
endmodule
