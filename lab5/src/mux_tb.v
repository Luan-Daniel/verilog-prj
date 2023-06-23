module mux_tb
#(parameter BUS_SIZE = 4, SEL_SIZE = 2, ID = 0);
  reg [(2**SEL_SIZE)-1:0][BUS_SIZE-1:0] buses;
  reg [SEL_SIZE-1:0] select;
  wire [BUS_SIZE-1:0] result;

  mux #(
  .BUS_SIZE(BUS_SIZE),
  .SEL_SIZE(SEL_SIZE))
    MUX_1(
    .buses(buses),
    .select(select),
    .result(result)
  );

  initial begin
    for (integer i = 0; i < (2**SEL_SIZE); i = i + 1) begin
      buses[i] = i;
    end

    for (integer i = 0; i < (2**SEL_SIZE); i = i + 1) begin
      select = i;
      #5;
      $display(">%d| select=%d; expected_result=%d; result=%d;", ID, select, buses[i], result);
      if (result !== buses[i]) $display("!%d| [Test failed for select=%d]", ID, select);
    end
  end
endmodule

