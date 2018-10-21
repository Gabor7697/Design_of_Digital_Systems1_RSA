library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity test is
end;

architecture bench of test is

  component mod_mult
  generic(N : natural := 16);
      Port (
             en : in STD_LOGIC;
             clk: in std_logic;
             rst : in STD_LOGIC;
             X : in STD_LOGIC_VECTOR (N-1 downto 0);
             wr_en : out std_logic;
             xi : out STD_LOGIC;
             dv : out STD_LOGIC);
  end component;
 type state is (idle, add, finish);
  signal en: STD_LOGIC;
  signal clk: std_logic;
  signal rst: STD_LOGIC;
  signal X: STD_LOGIC_VECTOR (15 downto 0);
  signal wr_en: std_logic;
  signal xi: STD_LOGIC;
  signal dv: STD_LOGIC;
  signal pr_state, nx_state : state;
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: mod_mult generic map ( N     => 16 )
                   port map ( en    => en,
                              clk   => clk,
                              rst   => rst,
                              X     => X,
                              wr_en => wr_en,
                              xi    => xi,
                              dv    => dv );

  stimulus: process
  begin
  
    -- Put initialisation code here
      en <= '1';
    X <= "0101001011100101";
    rst <= '0';
    wait for 5 ns;
    rst <= '0';
    wait for 5 ns;
    --en <= '1';

  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
