module flag_circuit_tb
#(parameter N = 4);
  localparam MSB = (N-1);
  localparam MASK = 4'b1111;

  reg [MSB:0] a, b;
  reg i;
  wire [MSB:0] s;
  wire c, n_flag, c_flag, v_flag, z_flag;

  full_adder #(.N(N)) ADD_0(
    .a(a),
    .b(b),
    .i(i),
    .s(s),
    .c(c)
  );

  flag_circuit #(.N(N)) FC_0 (
    .a(a),
    .b(b),
    .s(s),
    .c(c),
    .n_flag(n_flag),
    .c_flag(c_flag),
    .v_flag(v_flag),
    .z_flag(z_flag)
  );

  initial begin
    `define expect_eq(expd_const, var, mask) if ((var&mask)!=(expd_const&mask)) $display("[!] Fail: expected %s==%-b; actually %-b;\n %s", `"var`", (expd_const&mask), (var&mask), `__FILE__); else $display("[OK] Success");

    {i, a, b} = 0; #10
    `expect_eq(4'b0001, {n_flag,c_flag,v_flag,z_flag}, MASK);

    a = 1;
    b = 1; #10
    `expect_eq(4'b0000, {n_flag,c_flag,v_flag,z_flag}, MASK);

    a = ~0; #10
    `expect_eq(4'b0101, {n_flag,c_flag,v_flag,z_flag}, MASK);

    b = ~0; #10
    `expect_eq(4'b1100, {n_flag,c_flag,v_flag,z_flag}, MASK);

    {a, b} = 0;
    a[MSB] = 1;
    b[MSB] = 1; #10
    `expect_eq(4'b0111, {n_flag,c_flag,v_flag,z_flag}, MASK);

    a = -7;
    b = -7; #10
    `expect_eq(4'b0110, {n_flag,c_flag,v_flag,z_flag}, MASK);

    a = 3;
    b = -7; #10
    `expect_eq(4'b1000, {n_flag,c_flag,v_flag,z_flag}, MASK);
  end

endmodule
