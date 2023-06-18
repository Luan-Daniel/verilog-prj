module processos_tb;

reg r_a, r_b, clk_tb;
wire w_sa, w_sb;

always begin
    #5 clk_tb = !clk_tb;
end

processor U0 (
	.entrada_a	(r_a), 
	.entrada_b	(r_b), 
	.saida_a	(w_sa), 
	.saida_b	(w_sb), 
	.clk_i		(clk_tb)
);


initial
begin
 clk_tb = 0;
end

initial
begin
	r_a = 0;
	r_b = 0;
	#5;
	r_a = 1;
	r_b = 0;
	#5;
	r_a = 0;
	r_b = 1;
	#5;
	r_a = 1;
	r_b = 1;
	#20;
	$stop;
end

always @(r_a or r_b or clk_tb)
begin
  $display ("r_a %b", r_a);
  $display ("r_b %b", r_b);
  $display ("w_sa %b", w_sa);
  $display ("w_sb %b", w_sb);
  $display ("clk %b", clk_tb);
end


endmodule

