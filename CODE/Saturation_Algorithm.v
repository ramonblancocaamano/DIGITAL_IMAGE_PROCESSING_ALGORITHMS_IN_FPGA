library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Saturation_Algorithm is
    Port ( WE_Hud : out  STD_LOGIC;
           Ax_RGB : out  STD_LOGIC_VECTOR (8 downto 0);
           Ay_RGB : out  STD_LOGIC_VECTOR (9 downto 0);
           Ax_Hud : out  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Hud : out  STD_LOGIC_VECTOR (9 downto 0);
           DI_red : in  STD_LOGIC_VECTOR (15 downto 0);
           DI_green : in  STD_LOGIC_VECTOR (15 downto 0);
           DI_blue : in  STD_LOGIC_VECTOR (15 downto 0);
           DO_Hud : out  STD_LOGIC_VECTOR (15 downto 0));
end Saturation_Algorithm;

architecture Behavioral of Saturation_Algorithm is

begin


end Behavioral;
