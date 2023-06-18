`timescale 1ns/100ps

// 50Mhz -> 20ns
module cinto_seguranca_tb;
  
reg clk_tb;
reg rst_tb;
always #1 clk_tb = !clk_tb;
initial clk_tb = 0;


cinto_seguranca U00 (
	.clk_i (clk_tb),
	.rst_i (rst_tb),
	.p_i   (),
	.ns_i  (),
	.k_i   (),
	.t_i   (),
	.w_o   ()
);

initial begin
  rst_tb = 1;
  #200;
  rst_tb = 0;
end

  
endmodule
