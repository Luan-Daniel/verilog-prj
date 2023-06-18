`timescale 1ns/1ps

module alu_tb;

reg clk_tb;
reg [3:0] a_tb ;
reg [3:0] b_tb;
reg rst_tb;
reg ena_tb;


wire [3:0] acc_sum_tb;

always begin
    #5 clk_tb = !clk_tb;
end

initial
begin
  clk_tb = 1'b0;
  ena_tb = 1'b0;
  a_tb = 4'b0000;
  b_tb = 4'b0000;
  #2;
  rst_tb = 1'b1;
  #5;
  rst_tb = 1'b0;
  a_tb = 4'b0001;
  b_tb = 4'b0000;
  #5;
  ena_tb = 1'b1;
  #1;
  a_tb = 4'b0000;
  b_tb = 4'b0001;
  ena_tb = 1'b0;
  #5;
  a_tb = 4'b0001;
  b_tb = 4'b0001;
  #5;
  ena_tb = 1'b1;
  #1;
  a_tb = 4'b1111;
  b_tb = 4'b0001;
  ena_tb = 1'b0;
  #5;
  ena_tb = 1'b1;
  #1;

end

wire w_carry;
wire [3:0] w_sum;

fourbits_adder U0(
  .sum(w_sum), 
  .a(a_tb), 
  .b(b_tb), 
  .carry_out(w_carry), 
  .carry_in(w_carry)
);

// NÃO IMPLEMENTAR NO LAB 6 AINDA
/*
acc U1(
  .i_clk(clk_tb), 
  .i_ena(ena_tb), 
  .i_rst(rst_tb),
  .i_data(w_sum),
  .o_data(acc_sum_tb)
);
*/

endmodule
