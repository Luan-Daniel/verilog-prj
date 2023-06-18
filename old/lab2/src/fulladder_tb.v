`include "..\\prj\\fulladder.v"

`timescale 10us/100ns
module fulladder_tb;

reg r_A;
reg r_B;
reg r_C;

wire w_S;
wire w_C;

integer TIME_COUNT = 0;

fulladder DUT
(
	.a_i	(r_A),
	.b_i	(r_B),
	.cin_i(r_C),

	.sum_o(w_S),
	.car_o(w_C)
);

// PROCESSO 1
initial
begin
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0;
  r_B   <= 0;
	r_C   <= 0;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1;
  r_B   <= 0;
	r_C   <= 0;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0;
  r_B   <= 1;
	r_C   <= 0;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1;
  r_B   <= 1;
	r_C   <= 0;
	#5;
	TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1;
  r_B   <= 1;
	r_C   <= 1;
  #5;
	TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1;
  r_B   <= 0;
	r_C   <= 1;
  #5;
	TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0;
  r_B   <= 0;
	r_C   <= 1;
  #5;
	TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0;
  r_B   <= 1;
	r_C   <= 1;
  $stop;
end

// PROCESSO 2
always @(r_A or r_B or r_C)
begin
  $display ("r_A %b", r_A);
  $display ("r_B %b", r_B);
	$display ("r_C %b", r_C);
  $display ("w_S %b", w_S);
	$display ("w_C %b", w_C);
  $display ("TIME_COUNT %d", TIME_COUNT);
end

endmodule
