library verilog;
use verilog.vl_types.all;
entity Datapath_CU is
    port(
        i_data          : in     vl_logic_vector(31 downto 0);
        init_value      : in     vl_logic;
        i_clk           : in     vl_logic;
        o_data          : out    vl_logic_vector(31 downto 0);
        o_data1         : out    vl_logic_vector(31 downto 0);
        o_data2         : out    vl_logic_vector(31 downto 0)
    );
end Datapath_CU;
