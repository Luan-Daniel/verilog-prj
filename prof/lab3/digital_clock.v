module digital_clock(
	input wire  clk_i, 
	input wire  rst_i,
	output wire [7:0] second_o
);

localparam N = 26;

reg [N-1:0] slow_clk = 0;
reg [7:0]   countsec = 0;
  
wire enable;

always @(posedge clk_i) begin
	if (rst_i == 1'b1)
		slow_clk <= 8'b0;
	else begin
		if (slow_clk == 26'd49999999) slow_clk <= 8'b0;
		else slow_clk <= slow_clk + 8'b1;
	end
end

always @ (posedge clk_i) begin
	if (rst_i == 1'b1) begin
		countsec <= 8'b0;
	end
	else begin
		if (enable == 1'b1)
			if (countsec == 8'b0011_1011) countsec <= 8'b0; // 59 segundos
			else  countsec <= countsec + 8'b1;
	end 
end

assign enable = (slow_clk == 26'd49999999); //  1 segundo

assign second_o = countsec;

endmodule
