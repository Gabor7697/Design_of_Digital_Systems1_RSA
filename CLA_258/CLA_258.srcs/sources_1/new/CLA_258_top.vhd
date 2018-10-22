library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA is
    generic(word_length: natural := 256
            );
            
    Port ( a : in STD_LOGIC_VECTOR (word_length -1  downto 0);
           b : in STD_LOGIC_VECTOR (word_length -1   downto 0);
           cin : in STD_LOGIC;
           --sum : out STD_LOGIC_VECTOR (word_length -1   downto 0);
           --cout : out STD_LOGIC;
           result : out std_logic_vector(word_length -1 downto 0)
            
           );
end CLA;

architecture Behavioral of CLA is
    signal carry: std_logic_vector(word_length / 4   downto 0);
    signal sum : std_logic_vector(word_length - 1 downto 0);
   -- signal cout: std_logic;
    component CLA_258 is
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b: in STD_LOGIC_VECTOR (3 downto 0);
               cin: in std_logic;
               sum : out STD_LOGIC_VECTOR (3 downto 0);
               cout : out STD_LOGIC
              );
     end component;
begin
    carry(0) <= cin;
    
  gen_adder:  for i in 1 to word_length/4  generate
      CLA_adder:  CLA_258 PORT MAP(
           a =>  a(4*i -1    downto 4*i-4) ,
           b =>  b(4*i -1  downto 4*i-4) ,
           cin =>  carry(i-1) ,
            sum => sum(4*i-1 downto 4*i-4) ,
            cout => carry(i) 
            );
    end  generate;
    -- cout <= carry(word_length/4);   
     result <= sum;      
end Behavioral;
