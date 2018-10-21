
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CSA is
    generic( n : natural := 16);
    Port ( A : in STD_LOGIC_VECTOR (n downto 0);
           B : in STD_LOGIC_VECTOR (n downto 0);
           C : in STD_LOGIC_VECTOR (n downto 0);
           S : out STD_LOGIC_VECTOR (n+1 downto 0);
           C_out : out STD_LOGIC_VECTOR (n+1 downto 0));
end CSA;

architecture Behavioral of CSA is

begin

S <= '0' & ((A xor B) xor C);
C_out <= ((A and B) or (A and C) or (B and C)) & '0';

end Behavioral;
