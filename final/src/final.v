
// - C_reg options -
// bits: 98_76_54_3_210
//
// HEX_mode: [9:8]
//   00: (unsigned hexadecimal)
//   01: (unsigned octal)
//   10: (signed hexadecimal)
//   11: (signed octal)
// HEX_show: [7:6]
//   00: (alu result)
//   01: {A_reg}
//   10: {B_reg}
//   11: {C_reg}
// LED_show: [5:4]
//   00: (alu result)
//   00: {A_reg}
//   00: {B_reg}
//   00: {HEX_mode, ALU_op, ALU_flags}
// Carry_in: [3]
//    0: (set ALU Carry_in input to 0)
//    1: (set ALU Carry_in input to 1)
// ALU_op: [2:0]
//       (set ALU operation, see final/src/alu/alu.v)

module final
#(parameter N=10)
(SWITCH, B0, B1, B2, LED, HEX0, HEX1, HEX2, HEX3);
  localparam MSB = N-1;

  input [9:0] SWITCH;
  input B0, B1, B2;
  output [9:0] LED;
  output [7:0] HEX0, HEX1, HEX2, HEX3;

  // - input registers -
  reg [MSB:0] A_reg, B_reg;
  reg [9:0] C_reg;

  always @(B0, B1, B2) begin // saves SWITCH state to registers
    if (B0 & !(B1|B2)) A_reg = SWITCH;
    else if (B1 & !(B0|B2)) B_reg = SWITCH;
    else if (B2 & !(B0|B1)) C_reg = SWITCH;
  end

  // - alu -
  wire [3:0] FC_wire;
  wire [MSB:0] RES_wire;

  alu #(.N(N)) ALU_0(
    .a(A_reg),
    .b(B_reg),
    .carry_in(C_reg[3]),
    .select(C_reg[2:0]),
    .result(RES_wire),
    .n_flag(FC_wire[0]),
    .c_flag(FC_wire[1]),
    .v_flag(FC_wire[2]),
    .z_flag(FC_wire[3])
  );

  // - LED -
  mux4 #(.N(10)) MUX_LED(
    .in_00(RES_wire),
    .in_01(A_reg),
    .in_10(B_reg),
    .in_11({C_reg[9:8], C_reg[3:0], FC_wire}),
    .select(C_reg[5:4]),
    .result(LED)
  );

  // - 7seg display option select -
  wire [9:0] bc_wire;
  mux4 #(.N(10)) MUX_DISPLAY(
    .in_00(RES_wire),
    .in_01(A_reg),
    .in_10(B_reg),
    .in_11(C_reg),
    .select(C_reg[7:6]),
    .result(bc_wire)
  );

  // - 7seg display decoder -
  bc #(.N(10)) BC_0(
    .B_in(bc_wire),
    .op(C_reg[9:8]),
    .HEX3(HEX3),
    .HEX2(HEX2),
    .HEX1(HEX1),
    .HEX0(HEX0)
  );


endmodule //final