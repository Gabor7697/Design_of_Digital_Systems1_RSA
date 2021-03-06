library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLS is
    generic(word_length: natural := 258
            );
            
    Port ( a : in STD_LOGIC_VECTOR (word_length -1  downto 0);
           b : in STD_LOGIC_VECTOR (word_length -1   downto 0);
           cin : in STD_LOGIC;
           --sum : out STD_LOGIC_VECTOR (word_length -1   downto 0);
           --cout : out STD_LOGIC;
           result : out std_logic_vector(word_length -1 downto 0)
            
           );
end CLS;

architecture Behavioral of CLS is
    signal carry: std_logic_vector(word_length / 6   downto 0);
    signal sum : std_logic_vector(word_length - 1 downto 0);
    signal cout: std_logic;
    component four_bit_CLA is
        Port ( a : in STD_LOGIC_VECTOR (5 downto 0);
               b: in STD_LOGIC_VECTOR (5 downto 0);
               cin: in std_logic;
               sum : out STD_LOGIC_VECTOR (5 downto 0);
               cout : out STD_LOGIC
              );
     end component;
begin
    carry(0) <= cin;
    
  gen_adder:  for i in 1 to word_length/6  generate
      CLS_sub:  four_bit_CLA PORT MAP(
           a =>  a(6*i -1    downto 6*i-6) ,
           b =>  b(6*i -1  downto 6*i-6) ,
           cin =>  carry(i-1) ,
            sum => sum(6*i-1 downto 6*i-6) ,
            cout => carry(i) 
            );
    end  generate;
     --cout <= carry(word_length / 4);   
     result <=  sum;      
end Behavioral;
