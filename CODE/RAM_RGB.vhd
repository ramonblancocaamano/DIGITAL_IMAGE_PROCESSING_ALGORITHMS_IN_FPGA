
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RGB_RAM is
    Port ( 
			  Reset : in  STD_LOGIC;
			  Ax_Red : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Red : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Red : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Red : in  STD_LOGIC;
           Ax_Green : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Green : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Green : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Green : in  STD_LOGIC;
           Ax_Blue : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Blue : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Blue : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Blue : in  STD_LOGIC;
           DO_Red : out  STD_LOGIC_VECTOR (15 downto 0);
           DO_Green : out  STD_LOGIC_VECTOR (15 downto 0);
           DO_Blue : out  STD_LOGIC_VECTOR (15 downto 0));
end RGB_RAM;

architecture Behavioral of RGB_RAM is

COMPONENT RAM_640x480
PORT (   
		    Reset : in  STD_LOGIC;
		    WE  : in std_logic;
			 Ax   : in std_logic_vector(8 downto 0);
			 Ay   : in std_logic_vector(9 downto 0);
          DI  : in std_logic_vector(15 downto 0);
          DO  : out std_logic_vector(15 downto 0));
END COMPONENT;
begin

Inst_Red_RAM: RAM_640x480 PORT MAP(
			 Reset => Reset,
			 WE  => WE_Red,
			 Ax  => Ax_Red,
			 Ay  => Ay_Red,
          DI  => DI_Red,
          DO  => DO_Red
			 );
Inst_Green_RAM: RAM_640x480 PORT MAP(
			 Reset => Reset,
			 WE  => WE_Green,
			 Ax  => Ax_Green,
			 Ay  => Ay_Green,
          DI  => DI_Green,
          DO  => DO_Green
			 );			 
			 
Inst_Blue_RAM: RAM_640x480 PORT MAP(
			 Reset => Reset,
			 WE  => WE_Blue,
			 Ax  => Ax_Blue,
			 Ay  => Ay_Blue,
          DI  => DI_Blue,
          DO  => DO_Blue
			 );
end Behavioral;

