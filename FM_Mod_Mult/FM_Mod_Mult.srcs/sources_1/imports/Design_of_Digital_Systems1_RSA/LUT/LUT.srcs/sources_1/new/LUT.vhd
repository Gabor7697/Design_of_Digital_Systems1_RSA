library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LUT is
generic(n : natural := 16);
    Port ( x_i : in STD_LOGIC;
           y_0 : in STD_LOGIC;
           c_0 : in STD_LOGIC;
           s_0 : in STD_LOGIC;
           MY : in STD_LOGIC_VECTOR (n downto 0);
           M : in STD_LOGIC_VECTOR (n-1 downto 0);
           Y : in STD_LOGIC_VECTOR (n-1 downto 0);
           result : out STD_LOGIC_VECTOR (n downto 0));
end LUT;

architecture Behavioral of LUT is
signal address : std_logic_vector(3 downto 0);
begin

address <=  x_i & y_0 & c_0 & s_0;

process(address)
begin
    case address is 
        when ("0001") =>
            result <= '0' & M;
        when ("0010") =>
            result <= '0' & M;
        when ("0101") =>
            result <= '0' & M;
        when ("0110") =>
            result <= '0' & M;
        when ("1000") => 
            result <= '0' & Y;
        when ("1011") =>
            result <= '0' & Y;
        when ("1101") => 
            result <= '0' & Y;
        when ("1110") => 
            result <= '0' & Y;
        when ("1001") =>
            result <= MY;
        when ("1010") =>
            result <= MY;
        when ("1100") => 
            result <= MY;
        when ("1111") => 
            result <= MY;
        when others => 
            result <= (others => '0');
   end case;
end process;
end Behavioral;
