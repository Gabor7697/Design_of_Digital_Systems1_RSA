library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity r_shift_reg is
    generic( n : natural := 16);
    Port ( data : in STD_LOGIC_VECTOR (n + 1 downto 0);
           rst : in std_logic;
           clk : in std_logic;
           wr_e : in std_logic;
           d_out : out STD_LOGIC_VECTOR (n downto 0);
           lsb_out : out std_logic);
end r_shift_reg;

architecture Behavioral of r_shift_reg is

begin

process(rst,clk,wr_e)
begin   
    if(rst = '1') then
        d_out <= (others => '0');
    elsif ((clk'event and clk = '1') and wr_e = '1') then    
        d_out <= data(n+1 downto 1);
        lsb_out <= data(1);
    end if;
end process;

end Behavioral;
