library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_divider is
	port (board_clock: IN STD_LOGIC;
			slow_clock25: OUT STD_LOGIC);
end freq_divider;

architecture Behavioral of freq_divider is

begin

	process (board_clock) is
		variable count: natural;
	begin
		if rising_edge(board_clock) then
			slow_clock25 <= '0';
			count := count +1;
			if count = 4 then 
			slow_clock25 <= '1';
			count := 0;
			end if;
		end if;
	end process;

end Behavioral;


