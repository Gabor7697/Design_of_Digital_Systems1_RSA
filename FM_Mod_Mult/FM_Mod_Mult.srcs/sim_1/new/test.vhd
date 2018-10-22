
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FM_Mod_Mult_tb is
end;

architecture bench of FM_Mod_Mult_tb is

  component FM_Mod_Mult
      generic( word_length : natural := 16);
      Port ( N_i : in STD_LOGIC_VECTOR (word_length -1  downto 0);
             X : in STD_LOGIC_VECTOR (word_length -1  downto 0);
             Y : in STD_LOGIC_VECTOR (word_length -1  downto 0);
             NY : in STD_LOGIC_VECTOR (word_length   downto 0);
             enable : in STD_LOGIC;
             ready : out STD_LOGIC;
             result : out STD_LOGIC_VECTOR (word_length -1  downto 0);
             clk : in STD_LOGIC;
             rst : in STD_LOGIC);
  end component;

  signal N_i: STD_LOGIC_VECTOR (16 -1 downto 0);
  signal X: STD_LOGIC_VECTOR (16-1 downto 0);
  signal Y: STD_LOGIC_VECTOR (16 -1 downto 0);
  signal NY: STD_LOGIC_VECTOR (16 downto 0);
  signal enable: STD_LOGIC;
  signal ready: STD_LOGIC;
  signal result: STD_LOGIC_VECTOR (16 -1 downto 0);
  signal clk: STD_LOGIC;
  signal rst: STD_LOGIC;
  
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: FM_Mod_Mult generic map ( word_length => 16 )
                      port map ( N_i           => N_i,
                                 X           => X,
                                 Y           => Y,
                                 NY          => NY,
                                 enable      => enable,
                                 ready       => ready,
                                 result      => result,
                                 clk         => clk,
                                 rst         => rst );

  stimulus: process
  begin
  rst <= '1';
   wait for 5 ns;
   rst <= '0';
    --X <=   "1011100111001011";
    --Y <=   "1011010100000001";
    X <=  "0000000000000110";
    Y <=  "0000000000000110";
    N_i <= "0000000000100011";
    NY <= "00000000000101001";
    rst <= '0';
    enable <= '1';
    wait for 50 ms;
    wait;
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

  