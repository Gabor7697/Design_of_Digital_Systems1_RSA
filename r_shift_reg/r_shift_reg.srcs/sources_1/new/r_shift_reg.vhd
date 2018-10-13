library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity r_shift_reg is
    generic( n : natural := 256);
    Port ( data : in STD_LOGIC_VECTOR (n+1 downto 0);
           d_out : out STD_LOGIC_VECTOR (n downto 0));
end r_shift_reg;

architecture Behavioral of r_shift_reg is

begin

d_out <= data(n+1 downto 1);

end Behavioral;
