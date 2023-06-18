module cinto_seguranca (
	input clk_i,
	input rst_i,
	input p_i,
	input ns_i,
	input k_i,
	input t_i,
	output w_o
);


wire [7:0] second_w;

digital_clock 
U0(
	.clk_i   (clk_i), 
	.rst_i   (rst_i),
	.second_o(second_w)
);

reg set_timer;
always @(second_w)
begin
	if (second_w == 8'b0000_0101) set_timer <= 1;
	else set_timer <= 0;
end

//assign t_i = set_timer;
assign w_o = (( p_i & !ns_i & k_i) | set_timer);


endmodule
