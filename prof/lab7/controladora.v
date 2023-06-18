module controladora 
#( 
  parameter WIDTH = 8,
  parameter STATE = 2   
)
(
  clk,
  reset,
  data_valid,
  data,
  data_read,
  local_buffer
);

input                    clk;
input                    reset;
input                    data_valid;
input      [WIDTH-1 : 0] data;
output reg               data_read;
output reg [WIDTH-1 : 0] local_buffer;

// Constants and variables
localparam integer  WAITING = 0,
	                  STATE1  = 1,
	                  STATE2  = 2,
	                  STATE3  = 3;   
	
reg [STATE-1 : 0] read_state;
		
	// state variables - sequential
always @(posedge clk or posedge reset)
  if (reset == 1)
    begin // async reset logic
      read_state <= WAITING;
      local_buffer <= 8'h0;
    end
  else
  case (read_state)
     WAITING: if (data_valid)	read_state <= STATE1;
   	 STATE1 : begin
	        read_state <= STATE2;
	        local_buffer <= data;
	            end
     STATE2 : read_state <= STATE3;
     STATE3 : if (!data_valid) read_state <= WAITING;
  endcase
  
  // output decode - combinational
always @(read_state)
  case (read_state)
    STATE1 : data_read = 1'b1;
    STATE2 : data_read = 1'b1;
  default  : data_read = 1'b0;
endcase


endmodule

