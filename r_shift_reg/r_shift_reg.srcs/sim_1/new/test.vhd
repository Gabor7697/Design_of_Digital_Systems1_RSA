library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity r_shift_reg_tb is
end;

architecture bench of r_shift_reg_tb is

  component r_shift_reg
      generic( n : natural := 8);
      Port ( data : in STD_LOGIC_VECTOR (n+1 downto 0);
             d_out : out STD_LOGIC_VECTOR (n downto 0));
  end component;

  signal data: STD_LOGIC_VECTOR (9 downto 0);
  signal d_out: STD_LOGIC_VECTOR (8 downto 0);

begin

  -- Insert values for generic parameters !!
  uut: r_shift_reg generic map ( n     =>  8 )
                      port map ( data  => data,
                                 d_out => d_out );

  stimulus: process
  begin
  
   data <= "0000001000";

    wait;
  end process;


end;