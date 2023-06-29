module mux_tb
#(parameter N = 4, S = 2, ID = 0);
  localparam MASK = (1<<N)-1;

  reg [(2**S)-1:0][N-1:0] buses;
  reg [S-1:0] select;
  wire [N-1:0] result;

  mux #(.N(N),.S(S)) MUX_1(
    .buses(buses),
    .select(select),
    .result(result)
  );

  initial begin
    `define expect_eq(expd_const, var, mask) if ((var&mask)!=(expd_const&mask)) $display("[!] Fail: expected %s==%-b; actually %-b;\n %s", `"var`", (expd_const&mask), (var&mask), `__FILE__); else $display("[OK] Success");

    // give each wire a unique value
    for (integer i = 0; i < (2**S); i = i + 1) begin
      buses[i] = i;
    end

    // tests and display results
    for (integer i = 0; i < (2**S); i = i + 1) begin
      select = i; #5;
      `expect_eq(buses[i], result, MASK);
    end
  end
endmodule

