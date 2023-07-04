module bc_hex
(B_in, HEX);
  input [3:0] B_in;
  output reg [7:0] HEX;

  always @(B_in) begin
    case (B_in)
      4'h0: HEX = ~8'b0011_1111;
      4'h1: HEX = ~8'b0000_0110;
      4'h2: HEX = ~8'b0101_1011;
      4'h3: HEX = ~8'b0100_1111;
      4'h4: HEX = ~8'b0110_0110;
      4'h5: HEX = ~8'b0110_1101;
      4'h6: HEX = ~8'b0111_1101;
      4'h7: HEX = ~8'b0010_0111;
      4'h8: HEX = ~8'b0111_1111;
      4'h9: HEX = ~8'b0110_1111;
      4'hA: HEX = ~8'b0111_0111;
      4'hB: HEX = ~8'b0111_1100;
      4'hC: HEX = ~8'b0011_1001;
      4'hD: HEX = ~8'b0101_1110;
      4'hE: HEX = ~8'b0111_1001;
      4'hF: HEX = ~8'b0111_0001;
      default: HEX = ~8'b1100_1001;
    endcase
  end

  /*wire A, B, C, D;
  assign {A, B, C, D} = B_in;

  wire BC = B&C;
  wire nAC = (~A)&C;
  wire nAnB = (~A)&(~B);
  wire nBD = (~B)&D;
  wire nBnD = (~B)&(~D);
  wire nBnC = (~B)&(~C);
  wire nCD = (~C)&D;
  wire nCnD = (~C)&(~D);

  assign HEX[7] = 0;
  assign HEX[6] = (~A)&B&(C|(~D)) | B&nCD | C&((~B)|(~D)) | A&((~B)|D);
  assign HEX[5] = nCnD | A^B | A&C;
  assign HEX[4] = (~D)&((~B)|C) | A&(C|B);
  assign HEX[3] = (~A)&nBnD | nBnC&(~D) | nAnB&C | nAC&(~D) | (C&D~B)&C&D | B&nCD | BC&(~D) | A&nBD | A&B&(~D) | A&(~C);
  assign HEX[2] = nBnC | nBD | nCD | A^B;
  assign HEX[1] = (~A)&nCnD | nAC&D | A&nCD | nAnB | nBnC | nBnD;
  assign HEX[0] = (~A)&B&D | A&nBnC | nBnD | nAC | BC | A&(~D);*/

endmodule