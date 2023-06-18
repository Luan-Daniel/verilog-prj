library verilog;
use verilog.vl_types.all;
entity fulladder is
    port(
        a_i             : in     vl_logic;
        b_i             : in     vl_logic;
        cin_i           : in     vl_logic;
        sum_o           : out    vl_logic;
        car_o           : out    vl_logic
    );
end fulladder;
