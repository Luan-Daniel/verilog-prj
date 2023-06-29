library verilog;
use verilog.vl_types.all;
entity half_adder is
    generic(
        N               : integer := 4
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        s               : out    vl_logic_vector;
        c               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end half_adder;
