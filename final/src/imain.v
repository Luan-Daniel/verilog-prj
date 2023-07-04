`ifdef __ICARUS__

// - modules -
// mux
`include "final/src/mux/mux2.v"
`include "final/src/mux/mux4.v"
// adder
`include "final/src/alu/adder/half_adder.v"
`include "final/src/alu/adder/full_adder.v"
`include "final/src/alu/adder/adder.v"
// alu
`include "final/src/alu/arithmetic_module.v"
`include "final/src/alu/logic_module.v"
`include "final/src/alu/flag_circuit.v"
`include "final/src/alu/alu.v"
// bc7seg
`include "final/src/bc/bc_hex.v"
`include "final/src/bc/bc_unsigned_hex.v"
`include "final/src/bc/bc_unsigned_oct.v"
`include "final/src/bc/bc_signed_hex.v"
`include "final/src/bc/bc_signed_oct.v"
`include "final/src/bc/bc.v"
// final
`include "final/src/final.v"

// - testbenchs -
`include "final/src/tb/alu_tb.v"
`include "final/src/tb/bc_tb.v"
`include "final/src/tb/final_tb.v"


`endif //__ICARUS__