library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        A_i             : in     vl_logic;
        B_i             : in     vl_logic;
        S_i             : in     vl_logic;
        X_o             : out    vl_logic
    );
end mux2x1;
