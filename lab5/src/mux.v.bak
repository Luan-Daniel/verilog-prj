module mux
#(parameter N = 4, S = 2)
(buses, select, result);
  input [(2**S)-1:0][N-1:0] buses;
  input [S-1:0] select;
  output [N-1:0] result;

  assign result = buses[select];

endmodule