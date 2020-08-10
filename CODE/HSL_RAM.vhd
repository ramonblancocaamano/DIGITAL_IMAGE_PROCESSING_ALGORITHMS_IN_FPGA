library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HSL_RAM is
    Port ( 
			  Reset : in  STD_LOGIC;
			  Ax_Hud : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Hud : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Hud : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Hud : in  STD_LOGIC;
           Ax_Saturation : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Saturation : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Saturation : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Saturation : in  STD_LOGIC;
           Ax_Lightness: in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Lightness : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Lightness : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Lightness : in  STD_LOGIC;
           DO_Hud : out  STD_LOGIC_VECTOR (15 downto 0);
           DO_Saturation : out  STD_LOGIC_VECTOR (15 downto 0);
           DO_Lightness : out  STD_LOGIC_VECTOR (15 downto 0));
end HSL_RAM;

architecture Behavioral of HSL_RAM is

COMPONENT RAM_640x480
PORT (	 Reset : in  STD_LOGIC;
		    WE  : in std_logic;
			 Ax   : in std_logic_vector(8 downto 0);
			 Ay   : in std_logic_vector(9 downto 0);
          DI  : in std_logic_vector(15 downto 0);
          DO  : out std_logic_vector(15 downto 0));
END COMPONENT;
begin

Inst_Hud_RAM: RAM_640x480 PORT MAP(
			 Reset => Reset,
			 WE  => WE_Hud,
			 Ax  => Ax_Hud,
			 Ay  => Ay_Hud,
          DI  => DI_Hud,
          DO  => DO_Hud
			 );
Inst_Saturation_RAM: RAM_640x480 PORT MAP(
			 Reset => Reset,
			 WE  => WE_Saturation,
			 Ax  => Ax_Saturation,
			 Ay  => Ay_Saturation,
          DI  => DI_Saturation,
          DO  => DO_Saturation
			 );			 
			 
Inst_Lightness_RAM: RAM_640x480 PORT MAP(
			 Reset => Reset,
			 WE  => WE_Lightness,
			 Ax  => Ax_Lightness,
			 Ay  => Ay_Lightness,
          DI  => DI_Lightness,
          DO  => DO_Lightness
			 );
end Behavioral;