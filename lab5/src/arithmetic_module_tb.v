module arithmetic_module_tb
#(parameter N = 4);
  localparam MSB = (N-1);
  localparam MASK = (1<<N)-1;

  reg [MSB:0] a;
  reg [MSB:0] b;
  reg carry_in;
  reg [1:0] select;

  wire carry_out;
  wire [MSB:0] result;

  arithmetic_module #(.N(N)) MATH (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .select(select),
    .carry_out(carry_out),
    .result(result)
  );

  initial begin
    `define expect_eq(expd_const, var, mask) if ((var&mask)!=(expd_const&mask)) $display("[!] Fail: expected %s==%-b; actually %-b;\n %s", `"var`", (expd_const&mask), (var&mask), `__FILE__); else $display("[OK] Success");

    carry_in = 0;
    a = 2;
    b = 1;

    select = 2'b00; #10 // a+b
    $display("Testing arithmetic_module (a+b) operation... ");
    `expect_eq(3, result, MASK);
    `expect_eq(0, carry_out, 1);

    select = 2'b01; #10 // a-b
    $display("Testing arithmetic_module (a-b) operation... ");
    `expect_eq(1, result, MASK);
    `expect_eq(1, carry_out, 1);

    select = 2'b10; #10 //a+1
    $display("Testing arithmetic_module (a+1) operation... ");
    `expect_eq(3, result, MASK);
    `expect_eq(0, carry_out, 1);

    select = 2'b11; #10 //a-1
    $display("Testing arithmetic_module (a-1) operation... ");
    `expect_eq(1, result, MASK);
    `expect_eq(1, carry_out, 1);
  end
endmodule