library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity CLA_tb is
end;

architecture bench of CLA_tb is

  component CLA
      generic(word_length: natural := 32
              );
      Port ( a : in STD_LOGIC_VECTOR (word_length -1  downto 0);
             b : in STD_LOGIC_VECTOR (word_length -1   downto 0);
             cin : in STD_LOGIC;
             result : out std_logic_vector(word_length - 1 downto 0)
             );
  end component;

  signal a: STD_LOGIC_VECTOR (32-1 downto 0);
  signal b: STD_LOGIC_VECTOR (32-1 downto 0);
  signal cin: STD_LOGIC;
  signal result: std_logic_vector(32 -1 downto 0) ;

begin

  -- Insert values for generic parameters !!
  uut: CLA generic map ( word_length => 32 )
              port map ( a           => a,
                         b           => b,
                         cin         => cin,
                         result      => result );

  stimulus: process
  begin
  
   a <= "11111111111111111111111111111111";
   b <= "00000000000000001111111111111111";
 cin <= '1';
    wait;
  end process;


end;