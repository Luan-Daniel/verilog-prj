module adder #(parameter BUS_SIZE=4) (
	input  [BUS_SIZE-1:0] a_i,
	input  [BUS_SIZE-1:0] b_i,
	input                 c_i,
	output [BUS_SIZE-1:0] s_o,
	output                c_o
)
	wire [BUS_SIZE:0] full_sum;
	assign full_sum = a_i + b_i + c_i;

	assign s_o = full_sum[BUS_SIZE-1:0];
	assign c_o = full_sum[BUS_SIZE];
endmodule // adder
