library verilog;
use verilog.vl_types.all;
entity UpDown is
    port(
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        count           : out    vl_logic_vector(4 downto 0)
    );
end UpDown;
