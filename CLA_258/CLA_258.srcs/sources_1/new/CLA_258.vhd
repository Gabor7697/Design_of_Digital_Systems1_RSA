library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLA_258 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b: in STD_LOGIC_VECTOR (3 downto 0);
           cin: in std_logic;
           sum : out STD_LOGIC_VECTOR (3 downto 0);
          cout : out STD_LOGIC
           );
end CLA_258;

architecture behavioral of CLA_258 is
    signal G, P: std_logic_vector(3 downto 0);
    signal c : std_logic_vector(3 downto 0);
begin
    G <= a AND b;
    P <= a XOR b;
    
    c(0) <= cin;
    c(1) <= G(0) OR
            (P(0) AND cin);
    c(2) <= G(1) OR 
            (P(1) AND G(0)) OR
            (P(1) AND P(0) AND cin);
    c(3) <= G(2) OR
            (P(2) AND G(1)) OR
            (P(2) AND P(1) AND G(0)) OR
            (P(2) AND  P(1) AND P(0) AND cin);
    cout <= G(3) OR 
            (P(3) AND G(2)) OR 
            (P(3) AND P(2) AND G(1)) OR
            (P(3) AND P(2) AND P(1) AND G(0)) OR 
            (P(3) AND P(2) AND P(1) AND P(0) AND cin);
            
    
    sum <= P XOR c;
     

end Behavioral;