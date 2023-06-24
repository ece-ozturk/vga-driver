library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

use IEEE.NUMERIC_STD.ALL;


entity colour_counter is
	PORT (board_clock: IN STD_LOGIC;
			slow_clock25: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			red : OUT STD_LOGIC_VECTOR(2 downto 0);
			green: OUT STD_LOGIC_VECTOR(2 downto 0);
			blue : OUT STD_LOGIC_VECTOR(1 downto 0);
			flag : IN STD_LOGIC);
end colour_counter;

architecture behavioral of colour_counter is

signal mid_q: integer range 0 to 255;
signal q: STD_LOGIC_VECTOR(7 downto 0);


begin

COUNTER: process (board_clock, reset)

begin
	if (reset = '1') then 
		mid_q <= 0;
	elsif (flag = '0') then
		mid_q <= 0;
		
	elsif (rising_edge(board_clock) and flag = '1') then
	
		if (slow_clock25 = '1') then
			if (mid_q = 255) then
				mid_q <= 0;
			else
				mid_q <= mid_q + 1;
			end if;
		end if;
	end if;
	
end process;
	
q <= std_logic_vector( to_unsigned(mid_q, 8) );
red <= q(7 downto 5);
green <= q(4 downto 2);
blue <= q(1 downto 0);


end behavioral;