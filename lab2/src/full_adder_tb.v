/**
 * lab2 - Teste para full_adder
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** lab2\src\full_adder_tb.v **
 * @see full_adder
 */

module full_adder_tb;

  reg reg_a, reg_b, reg_i;
  wire wire_s, wire_c;

  integer TIME_COUNT;

  full_adder ADD_0(
    .a(reg_a),
    .b(reg_b),
    .i(reg_i),
    .s(wire_s),
    .c(wire_c)
  );

  initial begin
    TIME_COUNT = 0;
    $display("abi | cs | time");
    for (integer i = 0; i < 8; i = i + 1) begin
      {reg_a,reg_b, reg_i} = i;
      #5; TIME_COUNT = TIME_COUNT+5;
      $display("%b%b%b | %b%b | %d", reg_a, reg_b, reg_i, wire_c, wire_s, TIME_COUNT);
    end
    $stop;
  end

endmodule