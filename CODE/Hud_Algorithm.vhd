library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Hud_Algorithm is
    Port ( 
	        Reset : in  STD_LOGIC;
			  DI_red : in  STD_LOGIC_VECTOR (15 downto 0);
           DI_green : in  STD_LOGIC_VECTOR (15 downto 0);
           DI_blue : in  STD_LOGIC_VECTOR (15 downto 0);
			  WE_Hud : out  STD_LOGIC;
			  RE_Red : out  STD_LOGIC;
			  RE_Green : out  STD_LOGIC;
			  RE_Blue : out  STD_LOGIC;
			  Ax_Red  : out std_logic_vector(8 downto 0);
			  Ay_Red  : out std_logic_vector(9 downto 0);
			  Ax_Green : out std_logic_vector(8 downto 0);
			  Ay_Green : out std_logic_vector(9 downto 0);
			  Ax_Blue : out std_logic_vector(8 downto 0);
			  Ay_Blue : out std_logic_vector(9 downto 0);
           Ax_Hud : out  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Hud : out  STD_LOGIC_VECTOR (9 downto 0);
           DO_Hud : out  STD_LOGIC_VECTOR (15 downto 0));
end Hud_Algorithm;

architecture Behavioral of Hud_Algorithm is

begin

process(Reset, DI_red, DI_green, DI_blue)

begin 
  
for i in 0 to 4 loop
	for j in 0 to 4 loop   
	
	end loop;    
end loop;

end process;

end Behavioral;

