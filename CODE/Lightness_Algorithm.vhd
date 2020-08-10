library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lightness_Algorithm is
    Port ( Reset : in  STD_LOGIC;
			  WE_Lightness : out  STD_LOGIC;
			  RE_Red : out  STD_LOGIC;
			  RE_Green : out  STD_LOGIC;
			  RE_Blue : out  STD_LOGIC;
			  Ax_Red  : out std_logic_vector(8 downto 0);
			  Ay_Red  : out std_logic_vector(9 downto 0);
			  Ax_Green :out std_logic_vector(8 downto 0);
			  Ay_Green   : out std_logic_vector(9 downto 0);
			  Ax_Blue  :out std_logic_vector(8 downto 0);
			  Ay_Blue   : out std_logic_vector(9 downto 0);
           Ax_Lightness : out  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Lightness : out  STD_LOGIC_VECTOR (9 downto 0);
           DI_red : in  STD_LOGIC_VECTOR (15 downto 0);
           DI_green : in  STD_LOGIC_VECTOR (15 downto 0);
           DI_blue : in  STD_LOGIC_VECTOR (15 downto 0);
           DO_Lightness : out  STD_LOGIC_VECTOR (15 downto 0));
end Lightness_Algorithm;

architecture Behavioral of Lightness_Algorithm is

begin


end Behavioral;