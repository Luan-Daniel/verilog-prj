module fulladd (sum, a, b, carry_out, carry_in);

output wire sum;
output carry_out;

input  wire a, b;
input carry_in;

wire w_sum;
wire w_carry_out_0, w_carry_out_1;

halfadd U00 (.a(a), .b(b), .sum(w_sum), .carry(w_carry_out_0));
halfadd U01 (.a(w_sum), .b(carry_in), .sum(sum), .carry(w_carry_out_1));
or(carry_out, w_carry_out_0, w_carry_out_1);

endmodule
