library verilog;
use verilog.vl_types.all;
entity DataMemory is
    port(
        init_value      : in     vl_logic;
        i_Address       : in     vl_logic_vector(31 downto 0);
        i_WriteData     : in     vl_logic_vector(31 downto 0);
        i_WriteEn       : in     vl_logic;
        i_ReadEn        : in     vl_logic;
        o_ReadData      : out    vl_logic_vector(31 downto 0)
    );
end DataMemory;
