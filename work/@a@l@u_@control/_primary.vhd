library verilog;
use verilog.vl_types.all;
entity ALU_Control is
    generic(
        ALUop_Width     : integer := 2;
        ALU_select_width: integer := 3
    );
    port(
        i_ALUop         : in     vl_logic_vector;
        o_ALUcont       : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ALUop_Width : constant is 1;
    attribute mti_svvh_generic_type of ALU_select_width : constant is 1;
end ALU_Control;
