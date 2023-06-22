/**
 * lab2 - Teste para full_adder
 * Aluno: Luan Daniel de Oliveira Melo (20102096)
 *
 ** lab2\src\full_adder_tb.v **
 * @see full_adder
 */

module full_adder_tb
#(parameter N = 3);

  reg [N-1:0] reg_a, reg_b;
  reg reg_i;
  wire [N-1:0] wire_s;
  wire wire_c;

  integer TIME_COUNT;

  full_adder #(N) ADD_0(
    .a(reg_a),
    .b(reg_b),
    .i(reg_i),
    .s(wire_s),
    .c(wire_c)
  );

  initial begin
    TIME_COUNT = 0;
    $display("i+a+b   | c sum | time");
    for (integer i = 0; i < 2**(2*N+1); i = i + 1) begin
      {reg_i, reg_a, reg_b} = i;
      #5; TIME_COUNT = TIME_COUNT+5;
      $display("%d+%d+%d | %b  %d | %d", reg_i, reg_a, reg_b, wire_c, wire_s, TIME_COUNT);
    end
    $finish;
  end

endmodule