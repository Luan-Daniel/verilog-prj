module bc_signed_oct
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

  assign HEX3 = (B[9])? 8'b0010_0000:0;
endmodule