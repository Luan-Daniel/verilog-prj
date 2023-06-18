`timescale 10us/100ns
module half_adder_tb;

reg r_A;
reg r_B;

wire w_S;
wire w_C;

integer TIME_COUNT = 0;

half_adder DUT
(
	.a_i	(r_A),
	.b_i	(r_B),

	.s_i	(w_S),
	.c_i	(w_C)
);

// PROCESSO 1
initial
begin
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0;
  r_B   <= 0;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0;
  r_B   <= 1;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1;
  r_B   <= 0;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1;
  r_B   <= 1;
  #20;
  $stop;
end

// PROCESSO 2
always @(r_A or r_B)
begin
  $display ("r_A %b", r_A);
  $display ("r_B %b", r_B);
  $display ("w_S %b", w_S);
	$display ("w_C %b", w_C);
  $display ("TIME_COUNT %d", TIME_COUNT);
end

endmodule
