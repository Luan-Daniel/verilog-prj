`timescale 10us/100ns
module mux2x1_tb;
 
reg r_A;
reg r_B;
reg r_SEL;

wire w_OUT; 

integer TIME_COUNT = 0;
  
mux2x1 DUT
(
	.a  (r_A), 
	.b  (r_B), 
	.sel(r_SEL),
	
	.op (w_OUT)
); 

// PROCESSO 1
initial
begin
  #5; 
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 0; 
  r_B   <= 1;
  r_SEL <= 0; 
  #5; 
  TIME_COUNT = TIME_COUNT + 5;
  r_SEL <= 1; 
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_A   <= 1; 
  r_B   <= 0;
  #5;
  TIME_COUNT = TIME_COUNT + 5;
  r_SEL <= 0;  
  #20;
  $stop; 
end

// PROCESSO 2
always @(r_A or r_B or r_SEL)
begin
  $display ("r_A %b", r_A);
  $display ("r_B %b", r_B);
  $display ("r_SEL %b", r_SEL);
  $display ("w_OUT %b", w_OUT);
  $display ("TIME_COUNT %d", TIME_COUNT);
end
  
  
endmodule
