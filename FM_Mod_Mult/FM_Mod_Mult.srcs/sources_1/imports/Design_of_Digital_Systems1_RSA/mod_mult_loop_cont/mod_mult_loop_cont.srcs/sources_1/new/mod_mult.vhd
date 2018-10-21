----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2018 07:25:12 PM
-- Design Name: 
-- Module Name: mod_mult - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_mult is
generic(N : natural := 16);
    Port (
           en : in STD_LOGIC;
           clk: in std_logic;
           rst : in STD_LOGIC;
           rdy: in std_logic;
           X : in STD_LOGIC_VECTOR (N-1 downto 0);
           wr_en : out std_logic;
           xi : out STD_LOGIC;
           dv : out STD_LOGIC);
end mod_mult;

architecture Behavioral of mod_mult is
type state is (idle, add, finish);
signal pr_state, nx_state : state;

signal i, i_reg : natural range 0 to N;
begin
process(clk,rst)
begin
    if rst = '1' then
        i_reg <= 0;
    elsif(clk'event and clk = '1') then
        i_reg <= i;
    end if;
end process; 

process(clk,rst)
begin   
    if rst = '1' then
        pr_state <= idle;
    elsif (clk'event and clk = '1') then 
        pr_state <= nx_state;
    end if;
end process;

process(clk, rst, en,pr_state)
begin 
wr_en <= '0';
xi <= '0';
i <= 0;
dv <= '0';
 case pr_state is
    when idle => 
        if(en = '1') then
            nx_state <= add;
        else 
            nx_state <= idle;
        end if;
    when add =>
       
        wr_en <= '1';
        i <= i_reg + 1;
        if(i >= N) then 
         nx_state <= finish;
        elsif (i < N) then
            xi <= X(i);
            nx_state <= add;
        else 
            nx_state <= idle;
        end if;
   when finish =>
    wr_en <= '0';
    i <= 0;
    dv <= '1';
    if(rdy = '1') then
        nx_state <= idle;
    else 
        nx_state <= finish;
    end if;
  when others => 
    nx_state <= idle;
end case;
         
end process;
end Behavioral;
