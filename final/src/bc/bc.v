module bc
#(parameter N = 10)
(B_in, op, HEX3, HEX2, HEX1, HEX0);
  localparam MSB = N-1;

  input [MSB:0] B_in;
  input [1:0] op;
  output [7:0] HEX3, HEX2, HEX1, HEX0;

  wire [MSB:0] signed_B;
  assign signed_B[MSB-1:0] = (B_in[MSB])? -B_in[MSB-1:0]: B_in[MSB-1:0];
  assign signed_B[MSB] = B_in[MSB];

  wire [7:0]
    HEX3_00, HEX2_00, HEX1_00, HEX0_00,
    HEX3_01, HEX2_01, HEX1_01, HEX0_01,
    HEX3_10, HEX2_10, HEX1_10, HEX0_10,
    HEX3_11, HEX2_11, HEX1_11, HEX0_11;

  bc_unsigned_hex BCUH(
    .B(B_in),
    .HEX3(HEX3_00),
    .HEX2(HEX2_00),
    .HEX1(HEX1_00),
    .HEX0(HEX0_00)
  );

  bc_unsigned_oct BCUO(
    .B(B_in),
    .HEX3(HEX3_01),
    .HEX2(HEX2_01),
    .HEX1(HEX1_01),
    .HEX0(HEX0_01)
  );

  bc_signed_hex BCSH(
    .B(signed_B),
    .HEX3(HEX3_10),
    .HEX2(HEX2_10),
    .HEX1(HEX1_10),
    .HEX0(HEX0_10)
  );

  bc_signed_oct BCSO(
    .B(signed_B),
    .HEX3(HEX3_11),
    .HEX2(HEX2_11),
    .HEX1(HEX1_11),
    .HEX0(HEX0_11)
  );

  mux4 #(.N(32)) MUX_BC(
    .in_00({HEX3_00, HEX2_00, HEX1_00, HEX0_00}),
    .in_01({HEX3_01, HEX2_01, HEX1_01, HEX0_01}),
    .in_10({HEX3_10, HEX2_10, HEX1_10, HEX0_10}),
    .in_11({HEX3_11, HEX2_11, HEX1_11, HEX0_11}),
    .select(op),
    .result({HEX3, HEX2, HEX1, HEX0})
  );

endmodule
