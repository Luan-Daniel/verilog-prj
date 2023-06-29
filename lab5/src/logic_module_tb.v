module logic_module_tb
#(parameter N = 4);
  localparam MSB = (N-1);
  localparam LSB = (0);
  localparam MASK = (1<<N)-1;

  reg [MSB:LSB] a, b;
  reg [1:0] select;
  wire [MSB:LSB] result;

  logic_module #(.N(N)) LGC (
    .a(a),
    .b(b),
    .select(select),
    .result(result)
  );

  initial begin
    `define expect_eq(expd_const, var, mask) if ((var&mask)!=(expd_const&mask)) $display("[!] Fail: expected %s==%-b; actually %-b;\n %s", `"var`", (expd_const&mask), (var&mask), `__FILE__); else $display("[OK] Success");

    a = 5; b = 6;

    select = 2'b00; #10 // a&b
    $display("Testing logic_module (a&b) operation... ");
    `expect_eq('b100, result, MASK);

    select = 2'b01; #10 // a|b
    $display("Testing logic_module (a|b) operation... ");
    `expect_eq('b111, result, MASK);

    select = 2'b10; #10 //a^b
    $display("Testing logic_module (a^b) operation... ");
    `expect_eq('b011, result, MASK);

    select = 2'b11; #10 //~a
    $display("Testing logic_module (~a) operation... ");
    `expect_eq(~'b101, result, MASK);
  end
endmodule