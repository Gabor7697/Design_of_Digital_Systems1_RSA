library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_Std.all;

entity r_shift_reg_tb is
end;

architecture bench of r_shift_reg_tb is

  component r_shift_reg
      generic( n : natural := 8);
      Port ( data : in STD_LOGIC_VECTOR (n+1 downto 0);
             rst : in std_logic;
             clk : in std_logic;
             wr_e : in std_logic;
             d_out : out STD_LOGIC_VECTOR (n downto 0);
             lsb_out : out std_logic);
  end component;

  signal data: STD_LOGIC_VECTOR (9 downto 0);
  signal rst: std_logic;
  signal clk: std_logic;
  signal wr_e: std_logic;
  signal d_out: STD_LOGIC_VECTOR (8 downto 0);
  signal lsb_out: std_logic;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: r_shift_reg generic map ( n       =>  8 )
                      port map ( data    => data,
                                 rst     => rst,
                                 clk     => clk,
                                 wr_e    => wr_e,
                                 d_out   => d_out,
                                 lsb_out => lsb_out );

  stimulus: process
  begin
    rst <= '0';
   wr_e <= '1';
   data <= "0000001000"; 
  wait for 40 ns;
  data <=  "0000000110";
  wait for 60 ns;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;