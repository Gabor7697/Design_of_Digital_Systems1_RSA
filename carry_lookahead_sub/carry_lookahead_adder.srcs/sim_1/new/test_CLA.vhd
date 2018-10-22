library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity CLA_tb is
end;

architecture bench of CLA_tb is

  component CLS
      generic(word_length: natural := 18
              );
      Port ( a : in STD_LOGIC_VECTOR (word_length -1  downto 0);
             b : in STD_LOGIC_VECTOR (word_length -1   downto 0);
             cin : in STD_LOGIC;
             result : out std_logic_vector(word_length - 1 downto 0)
             );
  end component;

  signal a: STD_LOGIC_VECTOR (18-1 downto 0);
  signal b: STD_LOGIC_VECTOR (18-1 downto 0);
  signal cin: STD_LOGIC;
  signal result: std_logic_vector(18 -1 downto 0) ;

begin

  -- Insert values for generic parameters !!
  uut: CLS generic map ( word_length => 18 )
              port map ( a           => a,
                         b           => b,
                         cin         => cin,
                         result      => result );

  stimulus: process
  begin
  
   a <= "011001010100000110";
   b <= "001011100111001011";
 cin <= '1';
    wait;
  end process;


end;