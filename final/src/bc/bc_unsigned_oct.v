module bc_unsigned_oct
(B, HEX0, HEX1, HEX2, HEX3);
  input [9:0] B;
  output [7:0] HEX0, HEX1, HEX2, HEX3;

  bc_hex BH_0(
    .B_in({1'b0, B[2:0]}),
    .HEX(HEX0)
  );

  bc_hex BH_1(
    .B_in({1'b0, B[5:3]}),
    .HEX(HEX1)
  );

  bc_hex BH_2(
    .B_in({1'b0, B[8:6]}),
    .HEX(HEX2)
  );

  bc_hex BH_3(
    .B_in({3'b000, B[9]}),
    .HEX(HEX3)
  );
endmodule