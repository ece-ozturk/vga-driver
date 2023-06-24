library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity h_and_v is
	PORT(reset: IN STD_LOGIC;
			slow_clock: IN STD_LOGIC;
			h_sync: OUT STD_LOGIC;
			v_sync: OUT STD_LOGIC;
			flag: OUT STD_LOGIC);
end h_and_v;


architecture Behavioral of h_and_v is

signal h_pos: INTEGER := 0;
signal v_pos: INTEGER := 0;

begin

process(slow_clock, reset) is

begin

if (reset = '1') then  --active high reset
	h_pos <= 0;
	v_pos <= 0;

elsif (rising_edge(slow_clock)) then --changes with rising edge of clock

	h_pos <= h_pos + 1;
	
	if h_pos =799 then --last pixel of the row
		h_pos <= 0;
		v_pos <= v_pos + 1; --go to the next row
	end if;
	
	if v_pos = 520 then --last pixel of the column and last pixel of the row
		v_pos <= 0; --go to the origin
	end if;
	
	if h_pos < 96 then --in pulse width
		h_sync <= '0';
	else --in display region
		h_sync <= '1';
	end if;
	
	if v_pos < 2 then --in pulse width
		v_sync <= '0';
	else --in display region
		v_sync <= '1';
	end if;
	if h_pos <784 and h_pos>143 then
	flag <='1';
	else 
	flag <= '0';
	end if;

end if;
end process;

end Behavioral;

