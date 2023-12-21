library verilog;
use verilog.vl_types.all;
entity ALU_32b is
    generic(
        COMPLEMENT_A    : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        \AND\           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        EX_OR           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        \OR\            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        DECREMENT_A     : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        ADD             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        SUBTRACT        : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        INCREMENT_A     : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        i_clk           : in     vl_logic;
        i_reset         : in     vl_logic;
        i_A             : in     vl_logic_vector(31 downto 0);
        i_in0           : in     vl_logic_vector(31 downto 0);
        i_in1           : in     vl_logic_vector(31 downto 0);
        i_select        : in     vl_logic_vector(2 downto 0);
        o_out           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of COMPLEMENT_A : constant is 1;
    attribute mti_svvh_generic_type of \AND\ : constant is 1;
    attribute mti_svvh_generic_type of EX_OR : constant is 1;
    attribute mti_svvh_generic_type of \OR\ : constant is 1;
    attribute mti_svvh_generic_type of DECREMENT_A : constant is 1;
    attribute mti_svvh_generic_type of ADD : constant is 1;
    attribute mti_svvh_generic_type of SUBTRACT : constant is 1;
    attribute mti_svvh_generic_type of INCREMENT_A : constant is 1;
end ALU_32b;
