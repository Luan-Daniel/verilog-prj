`timescale 1ns/100ps

module final_tb
#(parameter N = 10);
  localparam MSB = (N-1);
  localparam LSB = (0);
  localparam MASK = (1<<N)-1;
  localparam HEX_MASK = 8'b1111_1111;

  reg [9:0] SWITCH;
  reg B0, B1, B2;
  wire [9:0] LED;
  wire [7:0] HEX0, HEX1, HEX2, HEX3;

  final #(.N(N)) UUT(
    .SWITCH(SWITCH),
    .B0(B0),
    .B1(B1),
    .B2(B2),
    .LED(LED),
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3)
  );

  // - initialize inputs -
  initial begin
    `define expect_eq(expd_const, var, mask) if ((var&mask)!=(expd_const&mask)) $display("[!] Fail: expected %s==%-b; actually %-b;\n %s", `"var`", (expd_const&mask), (var&mask), `__FILE__); else $display("[OK] Success");

    // preset
    SWITCH = 'b0;
    B0 = 1'b0;
    B1 = 1'b0;
    B2 = 1'b0; #10

    // A_reg=5;
    SWITCH = 10'b00_0000_0101;
    B0 = 1'b1; #5
    B0 = 1'b0;

    // B_reg=1;
    SWITCH = 10'b00_0000_0001;
    B1 = 1'b1; #5
    B1 = 1'b0;

    // HEX_mode: 00: (unsigned hexadecimal)
    // HEX_show: 00; (alu result)
    // LED_show: 00; (alu result)
    // Carry_in: 0;
    // ALU_op: 000; (sum)
    SWITCH = 10'b00_00_00_0_000;
    B2 = 1'b1; #5
    B2 = 1'b0; #10
    `expect_eq(10'b00_0000_0110, LED, MASK);
    `expect_eq(8'b0111_1101, HEX0, HEX_MASK);
  end

endmodule //final_tb