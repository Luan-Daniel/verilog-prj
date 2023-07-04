module bc_unsigned_hex
(B, HEX0, HEX1, HEX2, HEX3);
  input [9:0] B;
  output [7:0] HEX0, HEX1, HEX2, HEX3;

  bc_hex BH_0(
    .B_in(B[3:0]),
    .HEX(HEX0)
  );

  bc_hex BH_1(
    .B_in(B[7:4]),
    .HEX(HEX1)
  );

  bc_hex BH_2(
    .B_in({2'b00, B[9:8]}),
    .HEX(HEX2)
  );

  assign HEX3 = ~8'b0011_1111; // 7seg 0
endmodule