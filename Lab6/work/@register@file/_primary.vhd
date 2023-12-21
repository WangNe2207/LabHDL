library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        i_clk           : in     vl_logic;
        init_value      : in     vl_logic;
        i_WriteEn       : in     vl_logic;
        i_WriteAddress  : in     vl_logic_vector(4 downto 0);
        i_WriteData     : in     vl_logic_vector(31 downto 0);
        i_ReadAddress   : in     vl_logic_vector(4 downto 0);
        i_ReadAddress2  : in     vl_logic_vector(4 downto 0);
        o_ReadData      : out    vl_logic_vector(31 downto 0);
        o_ReadData2     : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
