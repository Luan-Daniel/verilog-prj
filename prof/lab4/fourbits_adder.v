module fourbits_adder
#(parameter N = 4)
(
  sum, 
  a, 
  b, 
  carry_out, 
  carry_in
);

output wire [N-1: 0] sum;
output carry_out;

input  wire [N-1: 0] a, b;
input carry_in;

wire w_carry_out_0, w_carry_out_1, w_carry_out_2; 

fulladd U00 (.sum(sum[0]), .a(a[0]), .b(b[0]), .carry_out(w_carry_out_0), .carry_in(carry_in));
fulladd U01 (.sum(sum[1]), .a(a[1]), .b(b[1]), .carry_out(w_carry_out_1), .carry_in(w_carry_out_0));
fulladd U10 (.sum(sum[2]), .a(a[2]), .b(b[2]), .carry_out(w_carry_out_2), .carry_in(w_carry_out_1));
fulladd U11 (.sum(sum[3]), .a(a[3]), .b(b[3]), .carry_out(carry_out), .carry_in(w_carry_out_2));

endmodule
