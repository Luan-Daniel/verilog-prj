module mux_gtb; // teste varias instancias do mux, cada um com parametros diferentes.

  parameter MAX_BUS_SIZE = 6;
  parameter MAX_SEL_SIZE = 4;
  generate
    genvar b, m;
    for (m=1; m<=MAX_SEL_SIZE; m=m+1) begin
      for (b=1; b<=MAX_BUS_SIZE; b=b+1) begin
        mux_tb #(
          .N(b),
          .S(m),
          .ID((b-1)*MAX_SEL_SIZE+m)) MUX_TB();
      end
    end
  endgenerate
endmodule