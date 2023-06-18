`timescale 10ns/100ps // ESCALA DE TEMPO

module block_nblock_tb;

reg clk_tb;

reg we;
reg [1:0] a;
reg [7:0] d_i;
reg [7:0] d_o_bloq;
reg [7:0] d_o_nbloq;

reg [7:0] mem_bloq [0:3]; // MEMÓRIA 0
reg [7:0] mem_nbloq [0:3]; // MEMÓRIA 1

parameter period = 50;

// PROCESSO - SET O CLOCK
initial clk_tb = 0;
always #(period) clk_tb = ~clk_tb;

// PROCESSO - LOAD DOS DADOS PARA AS MEMÓRIAS
initial
begin
 $readmemb("C:/Users/user/Documents/0.UFSC/2023/7555_Linguagem_Descricao_Hardware/Labs/lab6/src/rom.mem", mem_bloq);
 $readmemb("C:/Users/user/Documents/0.UFSC/2023/7555_Linguagem_Descricao_Hardware/Labs/lab6/src/rom.mem", mem_nbloq);
end

// PROCESSO - ESPELHA O DIAGRAMA DE FORMA DE ONDA
initial 
begin
 we = 0;
 a = 2'b01;
 d_i = 'h11;
 @(negedge clk_tb);
 we = 1;
 a = 2'b11;
 d_i = 'h22;
 @(negedge clk_tb);
 we = 0;
 a = 2'b00;
 d_i = 'h33;
 @(negedge clk_tb);
 we = 0;
 a = 2'b11;
 d_i = 'h44;
 #5;
end

// PROCESSO - OCORRE  SEMPRE QUE NA BORDA DE SUBIDA DO CLOCK_TB 
// BLOQUEANTE e NÃO-BLOQUEANTE
always@ (posedge clk_tb) begin
  if (we == 1) begin
    mem_bloq[a] = d_i;   // BLOQUEANTE - OCORRE SEMPRE QUE WE É 1
    mem_nbloq[a] <= d_i;  // NÃO-BLOQUEANTE - OCORRE SEMPRE QUE WE É 1
 end
	
	d_o_bloq = mem_bloq[a];	  // BLOQUEANTE - OBRIGATORIAMENTE ESSA LINHA SEMPRE OCORRE - INDEPENDENTE DO IF
	d_o_nbloq <= mem_nbloq[a];	 // NÃO-BLOQUEANTE - OBRIGATORIAMENTE ESSA LINHA SEMPRE OCORRE - INDEPENDENTE DO IF
end

endmodule
