library verilog;
use verilog.vl_types.all;
entity DTCU_convert is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end DTCU_convert;
