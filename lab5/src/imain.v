`ifdef __ICARUS__

// modules
`include "lab5/src/mux2.v"
`include "lab5/src/mux4.v"
`include "lab5/src/half_adder.v"
`include "lab5/src/full_adder.v"
`include "lab5/src/adder.v"
`include "lab5/src/arithmetic_module.v"
`include "lab5/src/logic_module.v"
`include "lab5/src/flag_circuit.v"
`include "lab5/src/alu.v"

// testbenchs
//`include "lab5/src/mux_tb.v"
`include "lab5/src/arithmetic_module_tb.v"
`include "lab5/src/logic_module_tb.v"
`include "lab5/src/alu_tb.v"
`include "lab5/src/flag_circuit_tb.v"

// gerate testbenchs
//`include "lab5/src/mux_gtb.v"

`endif //__ICARUS__