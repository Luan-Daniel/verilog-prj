module FourBits_Adder(a_i, b_i, cin_i, sum_o, cout_o);
parameter NBIT = 4;

input       [NBIT-1 : 0] a_i;
input       [NBIT-1 : 0] b_i;
input 						 cin_i;
output wire [NBIT-1 : 0] sum_o;
output wire 				 cout_o;

wire [NBIT:0]temp;

assign temp = a_i + b_i + cin_i;
	
assign sum_o = temp[NBIT-1 : 0];
	
assign cout_o = temp[NBIT];
	
endmodule
