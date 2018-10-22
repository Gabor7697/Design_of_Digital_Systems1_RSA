library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity test is
end;

architecture bench of test is

  component CLA
      generic(word_length: natural := 16
              );
      Port ( a : in STD_LOGIC_VECTOR (word_length -1  downto 0);
             b : in STD_LOGIC_VECTOR (word_length -1   downto 0);
             cin : in STD_LOGIC;
             result : out std_logic_vector(word_length -1 downto 0)
             );
  end component;

  signal a: STD_LOGIC_VECTOR (15 downto 0);
  signal b: STD_LOGIC_VECTOR (15 downto 0);
  signal cin: STD_LOGIC;
  signal result: std_logic_vector(15 downto 0) ;

begin

  -- Insert values for generic parameters !!
  uut: CLA generic map ( word_length => 16 )
              port map ( a           => a,
                         b           => b,
                         cin         => cin,
                         result      => result );

  stimulus: process
  begin
  
      
   a <= "0001010100000110";
   b <= "1011100111001011";
  cin <= '0';
    wait;

    wait;
  end process;


end;
