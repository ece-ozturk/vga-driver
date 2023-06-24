library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_driver is
	port(board_clock: IN STD_LOGIC;
	reset: IN STD_LOGIC;
	HSYNC: OUT STD_LOGIC;
	VSYNC: OUT STD_LOGIC;
	RED0: OUT STD_LOGIC;
	RED1: OUT STD_LOGIC;
	RED2: OUT STD_LOGIC;
	GREEN0: OUT STD_LOGIC;
	GREEN1: OUT STD_LOGIC;
	GREEN2: OUT STD_LOGIC;
	BLUE0: OUT STD_LOGIC;
	BLUE1: OUT STD_LOGIC
	);
end vga_driver;


architecture Structural of vga_driver is

component freq_divider
	port (board_clock: IN STD_LOGIC;
			slow_clock25: OUT STD_LOGIC);
end component;

component colour_counter
	port (board_clock: IN STD_LOGIC;
			slow_clock25: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			red : OUT STD_LOGIC_VECTOR(2 downto 0);
			green: OUT STD_LOGIC_VECTOR(2 downto 0);
			blue : OUT STD_LOGIC_VECTOR(1 downto 0);
			flag: IN STD_LOGIC);
end component;

component h_and_v
	port(reset: IN STD_LOGIC;
			slow_clock: IN STD_LOGIC;
			h_sync: OUT STD_LOGIC;
			v_sync: OUT STD_LOGIC;
			flag: OUT STD_LOGIC);
end component;

signal mid_clock, r0, r1, r2, g0, g1, g2, b0, b1, mid_h, mid_v, mid_f: STD_LOGIC;

begin

freq_divider1: freq_divider PORT MAP(board_clock, mid_clock);
colour_counter1: colour_counter PORT MAP(board_clock, mid_clock, reset, red(0)=> r0, red(1)=> r1, red(2)=>r2, green(0)=> g0, green(1)=> g1, green(2)=>g2, blue(0)=> b0, blue(1)=> b1, flag => mid_f);
h_and_v1: h_and_v PORT MAP(reset, mid_clock, mid_h, mid_v, mid_f);

RED0 <= r0;
RED1 <= r1;
RED2 <= r2;
GREEN0 <= g0;
GREEN1 <= g1;
GREEN2 <= g2;
BLUE0 <= b0;
BLUE1 <= b1;
HSYNC <= mid_h;
VSYNC <= mid_v;


end Structural;

