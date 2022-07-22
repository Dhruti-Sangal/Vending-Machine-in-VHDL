LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY vending_machine_tb IS
END vending_machine_tb;
ARCHITECTURE behavior OF vending_machine_tb IS
signal CLK,RSTn,Soda : std_logic := '0';
signal CoinIn,CoinOut : std_logic_vector (1 downto 0):= "00";
signal states : std_logic_vector (2 downto 0):= "000"; --Signal Declaration
constant Clk_period : time := 10 ns; --Constant time for the machine
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: entity work.vending_machine PORT MAP ( --Port map is the part of the module where you
declare which local signals the module’s inputs and outputs shall be connected to.
CLK => CLK,

RSTn => RSTn,
CoinIn => CoinIn,
Soda => Soda,
CoinOut => CoinOut,
states => states

);
-- Clock process definitions
Clk_process :process
begin
Clk <= '0';
wait for Clk_period/2;
Clk <= '1';
wait for Clk_period/2;
end process;

stim_proc: process --Stimulation process
begin
wait for Clk_period*2;
RSTn <= '1'; wait for 6 ns;
RSTn <= '0'; wait for Clk_period*2;
--insert 2$
wait for Clk_period*5;
CoinIn <= "10"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*1; --Wait till the second input is to be entered
--insert 5$
wait for Clk_period*10;
CoinIn <= "11"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*1;
--insert 1$ and 2$
wait for Clk_period*5;
CoinIn <= "01"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*2;
CoinIn <= "10"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*1;
--insert 1$ and 1$
wait for Clk_period*5;
CoinIn <= "01"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*2;
CoinIn <= "01"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*1;
--insert 1$ and 5$
wait for Clk_period*5;
CoinIn <= "01"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*2;
CoinIn <= "11"; wait for Clk_period*1;
CoinIn <= "00";wait for Clk_period*1;

wait;
end process;
END;
