----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2018 06:32:45 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
generic( N : natural := 257);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           sel : in std_logic;
           Y : out STD_LOGIC_VECTOR (N-1 downto 0));
        
end mux;

architecture Behavioral of mux is

begin

with sel select
    Y <= A when '0',
        (others => '0') when  '1',
        (others => '0') when others;
end Behavioral;
