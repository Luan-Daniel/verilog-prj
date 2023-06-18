module mux2x1 (a, b, sel, out);

input wire a;
input wire b;
input wire sel;

output reg out;

always @(a or b or sel) begin
	if (sel == 1b'1)
		op <= a;
	else
		op <= b;
end

endmodule
