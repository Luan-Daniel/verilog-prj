`timescale 10ns/100ps

module edge_tb;
  
localparam period = 5;
reg clk_tb;
reg reset_tb;
reg level_tb;
wire Mealy_tick_tb;
wire Moore_tick_tb;

initial clk_tb = 0;
always #(period) clk_tb = ~clk_tb;

initial 
begin
  reset_tb = 1; 
  level_tb = 0;
  @(posedge clk_tb);
  reset_tb = 0; 
  @(posedge clk_tb);  
  level_tb = 1;
  @(posedge clk_tb);
  level_tb = 0; 
  @(posedge clk_tb);  
  level_tb = 1;
  @(posedge clk_tb);  
  level_tb = 0;

end

edgeDetector U00(
    .clk       (clk_tb), 
	  .reset     (reset_tb), 
    .level     (level_tb), 
    .Mealy_tick(Mealy_tick_tb), 
	  .Moore_tick(Moore_tick_tb)
);
  
always begin
  #100;
  $dumpfile("dump_file.vcd");
  $dumpvars(1, U00);
  $display("State Mealy = ",U00.stateMealy_reg,"| Mealy Tick = ", Mealy_tick_tb);
  $display("State Moore = ",U00.stateMoore_reg,"| Mealy Tick = ", Moore_tick_tb);    
  #2000;
  $dumpoff;
  $stop;
    
end
  
  
endmodule
