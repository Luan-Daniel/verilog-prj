module alu_tb
#(parameter N = 4);
  localparam MSB = (N-1);
  localparam LSB = (0);
  localparam MASK = (1<<N)-1;

  reg [N-1:0] a, b;
  reg carry_in;
  reg [2:0] select;
  wire [N-1:0] result;
  wire n_flag, c_flag, v_flag, z_flag;

  alu #(.N(N)) ALU_0 (
    .a(a), .b(b),
    .carry_in(carry_in),
    .select(select),
    .result(result),
    .n_flag(n_flag),
    .c_flag(c_flag),
    .v_flag(v_flag),
    .z_flag(z_flag)
  );

  initial begin
    `define expect_eq(expd_const, var, mask) if ((var&mask)!=(expd_const&mask)) $display("[!] Fail: expected %s==%-b; actually %-b;\n %s", `"var`", (expd_const&mask), (var&mask), `__FILE__); else $display("[OK] Success");

    a = 'b0110; // 6
    b = 'b0101; // 5

    // - arithmetic tests -
    select = 3'b000; #10 //a+b
    $display("Testing alu sel=0 (a+b)");
    `expect_eq('b1011, result, MASK);

    select = 3'b001; #10 //a-b
    $display("Testing alu sel=1 (a-b)");
    `expect_eq('b0001, result, MASK);

    select = 3'b010; #10 //a+1
    $display("Testing alu sel=2 (a+1)");
    `expect_eq('b0111, result, MASK);

    select = 3'b011; #10 //a-1
    $display("Testing alu sel=3 (a-1)");
    `expect_eq('b0101, result, MASK);

    // - logic tests -
    select = 3'b100; #10 //a+b
    $display("Testing alu sel=4 (a&b)");
    `expect_eq('b0100, result, MASK);

    select = 3'b101; #10 //a-b
    $display("Testing alu sel=5 (a|b)");
    `expect_eq('b0111, result, MASK);

    select = 3'b110; #10 //a+1
    $display("Testing alu sel=6 (a^b)");
    `expect_eq('b0011, result, MASK);

    select = 3'b111; #10 //a-1
    $display("Testing alu sel=7 (~a)");
    `expect_eq(~'b0110, result, MASK);
  end
endmodule
