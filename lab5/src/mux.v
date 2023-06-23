module mux
#(parameter BUS_SIZE = 4, SEL_SIZE = 2)
(buses, select, result);
  input [(2**SEL_SIZE)-1:0][BUS_SIZE-1:0] buses;
  input [SEL_SIZE-1:0] select;
  output [BUS_SIZE-1:0] result;

  assign result = buses[select];

endmodule