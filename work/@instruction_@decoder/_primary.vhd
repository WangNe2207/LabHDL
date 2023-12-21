library verilog;
use verilog.vl_types.all;
entity Instruction_Decoder is
    generic(
        function_field_width: integer := 6;
        opcode_field_width: integer := 6;
        CU_width        : integer := 8
    );
    port(
        func            : in     vl_logic_vector;
        opcode          : in     vl_logic_vector;
        Control_Unit    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of function_field_width : constant is 1;
    attribute mti_svvh_generic_type of opcode_field_width : constant is 1;
    attribute mti_svvh_generic_type of CU_width : constant is 1;
end Instruction_Decoder;
