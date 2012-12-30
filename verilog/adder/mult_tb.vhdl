-- This VHDL was converted from Verilog using the
-- Icarus Verilog VHDL Code Generator 0.9.4  (v0_9_4)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

-- Generated from Verilog module mult_tb (mult_tb.v:1)
entity mult_tb is
end entity; 

-- Generated from Verilog module mult_tb (mult_tb.v:1)
architecture FromVerilog of mult_tb is
  signal a : unsigned(7 downto 0) := X"03";  -- Declared at mult_tb.v:6
  signal b : unsigned(7 downto 0) := X"04";  -- Declared at mult_tb.v:7
  signal clk : std_logic := '0';  -- Declared at mult_tb.v:4
  signal done : std_logic;  -- Declared at mult_tb.v:10
  signal r : unsigned(15 downto 0);  -- Declared at mult_tb.v:9
  signal start : std_logic := '1';  -- Declared at mult_tb.v:3
  
  component mult is
    port (
      a : in unsigned(7 downto 0);
      b : in unsigned(7 downto 0);
      clk : in std_logic;
      done : out std_logic;
      r : out unsigned(15 downto 0);
      start : in std_logic
    );
  end component;
begin
  
  -- Generated from instantiation at mult_tb.v:12
  uut: mult
    port map (
      a => a,
      b => b,
      clk => clk,
      done => done,
      r => r,
      start => start
    );
  -- Removed one empty process
  
  -- Removed one empty process
  
  -- Removed one empty process
  
  -- Removed one empty process
  
  
  -- Generated from always process in mult_tb (mult_tb.v:14)
  process is
    variable Verilog_Display_Line : Line;  -- For generating $display output
  begin
    if ((unsigned'("0") & done) = "00") then
      Write(Verilog_Display_Line, String'("output undone: "));
      Write(Verilog_Display_Line, To_Integer(r));
      WriteLine(std.textio.Output, Verilog_Display_Line);
    end if;
    if ((unsigned'("00") & done) = "001") then
      Write(Verilog_Display_Line, String'("output done: "));
      Write(Verilog_Display_Line, To_Integer(r));
      WriteLine(std.textio.Output, Verilog_Display_Line);
      assert false report "SIMULATION FINISHED" severity failure;
    end if;
    wait for 10 ms;
    clk <= (not clk);
    wait for 0 ns;
  end process;
  
  -- Generated from initial process in mult_tb (mult_tb.v:26)
  process is
  begin
    null;  -- Unsupported system task $dumpfile omitted here (mult_tb.v:27)
    null;  -- Unsupported system task $dumpvars omitted here (mult_tb.v:28)
    wait;
  end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

-- Generated from Verilog module mult (mult.v:1)
entity mult is
  port (
    a : in unsigned(7 downto 0);
    b : in unsigned(7 downto 0);
    clk : in std_logic;
    done : out std_logic;
    r : out unsigned(15 downto 0);
    start : in std_logic
  );
end entity; 

-- Generated from Verilog module mult (mult.v:1)
architecture FromVerilog of mult is
  signal done_Reg : std_logic;
  signal r_Reg : unsigned(15 downto 0);
  signal bbuf : unsigned(7 downto 0) := X"00";  -- Declared at mult.v:11
  signal startbuff : std_logic := '1';  -- Declared at mult.v:9
begin
  done <= done_Reg;
  r <= r_Reg;
  
  -- Generated from initial process in mult (mult.v:8)
  process is
  begin
    done_Reg <= '0';
    wait;
  end process;
  -- Removed one empty process
  
  -- Removed one empty process
  
  
  -- Generated from initial process in mult (mult.v:13)
  process is
  begin
    r_Reg <= X"0000";
    wait;
  end process;
  
  -- Generated from always process in mult (mult.v:15)
  process is
  begin
    wait until (rising_edge(clk));
    if (((unsigned'("00") & startbuff) = "001") and ((unsigned'("00") & start) = "001")) then
      bbuf <= b;
      wait for 0 ns;
      startbuff <= '0';
      wait for 0 ns;
    end if;
    if (((unsigned'("0") & startbuff) = "00") and ((unsigned'("0") & done_Reg) = "00")) then
      bbuf <= Resize((Resize(bbuf, 32) - X"00000001"), 8);
      wait for 0 ns;
      r_Reg <= (r_Reg + Resize(a, 16));
      wait for 0 ns;
    end if;
    if (Resize(bbuf, 9) = "000000000") then
      done_Reg <= '1';
    end if;
  end process;
end architecture;

