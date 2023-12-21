library verilog;
use verilog.vl_types.all;
entity add is
    port(
        a               : in     vl_logic_vector(2 downto 0);
        b               : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        x               : out    vl_logic;
        y               : out    vl_logic
    );
end add;
