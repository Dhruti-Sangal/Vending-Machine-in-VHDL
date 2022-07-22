library ieee;
use IEEE.std_logic_1164.all; --for describing digital logic values.
entity vending_machine is --defines interface
port (CLK : in std_logic; --Clock, active high
RSTn : in std_logic; -- Reset
CoinIn : in std_logic_vector (1 downto 0); --Which coin was inserted
Soda : out std_logic; --Is Soda dispensed ?
CoinOut : out std_logic_vector (1 downto 0); --Which coin is dispensed
states : out std_logic_vector(2 downto 0) := "000"
);
end entity;
architecture behavior of vending_machine is --defines function
type state_type is (idle, --start state/reset
put_money, --waiting to enter money
in_1,in_3,in_6,in_5, --represent the current sum of money after returning change
change_1, --should return change of 1$
soda_out --dispence soda can.
);
signal current_s,next_s: state_type; --current and next state declaration.
begin
process(CLK,RSTn)
begin
if(RSTn = '1') then
current_s <= idle; --defualt state is on RESET
elsif(clk'event and clk = '1') then
current_s <= next_s;
end if;
end process;
--FSM process:
process(current_s,CoinIn)
begin
-- cases which cover types of current state
case current_s is
when idle => --state reset or idle
states <= "000";
Soda <= '0';
CoinOut <= "00";
next_s <= put_money;
when put_money => --wait for money to be entered
states <= "001";
if(CoinIn = "00")then
Soda <= '0';
CoinOut <= "00";
next_s <= put_money;
elsif(CoinIn = "01")then --insert 1$
Soda <= '0';
CoinOut <= "00";
next_s <= in_1;
elsif(CoinIn = "10")then --insert 2$
Soda <= '0';
CoinOut <= "00";
next_s <= soda_out;
elsif(CoinIn = "11")then --insert 5$
Soda <= '0';
CoinOut <= "00";
next_s <= in_5;
end if;
when in_1 =>
states <= "010";
if(CoinIn = "00") then--stay on the same state
