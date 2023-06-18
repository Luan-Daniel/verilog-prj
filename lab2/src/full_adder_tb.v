module tb_my_module;
  reg [1:0] input;
  wire output;

  my_module dut (
    .input(input),
    .output(output)
  );

  initial begin
    $monitor("input=%b, output=%b", input, output);
    $display("Truth table:");
    $display("input | output");
    $display("------|-------");
    for (int i = 0; i < 4; i = i + 1) begin
      input = i;
      #1;
      $display("%b     | %b", input, output);
    end
  end
endmodule
