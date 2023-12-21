library verilog;
use verilog.vl_types.all;
entity SinglePortRam is
    port(
        i_clk           : in     vl_logic;
        i_cs            : in     vl_logic;
        i_wr_e          : in     vl_logic;
        i_oe            : in     vl_logic;
        i_address       : in     vl_logic_vector(6 downto 0);
        io_data         : inout  vl_logic_vector(7 downto 0)
    );
end SinglePortRam;
