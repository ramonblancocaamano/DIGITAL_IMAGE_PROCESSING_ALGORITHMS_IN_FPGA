
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Main_Module IS
PORT(		 WE_Red  : in std_logic;
			 WE_Green  : in std_logic;
          WE_Blue  : in std_logic;
          Clk  : in std_logic;
			 Reset  : in std_logic;
			 Ax_Red   : in std_logic_vector(8 downto 0);
			 Ay_Red   : in std_logic_vector(9 downto 0);
			 Ax_Green   : in std_logic_vector(8 downto 0);
			 Ay_Green  : in std_logic_vector(9 downto 0);
			 Ax_Blue  : in std_logic_vector(8 downto 0);
			 Ay_Blue   : in std_logic_vector(9 downto 0);
          DI_Red  : in std_logic_vector(15 downto 0);
			 DI_Green  : in std_logic_vector(15 downto 0);
			 DI_Blue  : in std_logic_vector(15 downto 0);
          DO_Hud  : out std_logic_vector(15 downto 0);
          DO_Saturation  : out std_logic_vector(15 downto 0);
          DO_Lightness  : out std_logic_vector(15 downto 0));
END Main_Module;

ARCHITECTURE Behavioral OF Main_Module IS

COMPONENT RGB_RAM
PORT ( 	  Reset : in  STD_LOGIC;
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
END COMPONENT;
COMPONENT HSL_RAM
PORT ( 	  Reset : in std_logic;
			  Ax_Hud : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Hud : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Hud : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Hud : in  STD_LOGIC;
           Ax_Saturation : in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Saturation : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Saturation : in  STD_LOGIC_VECTOR (15 downto 0);
           We_Saturation : in  STD_LOGIC;
           Ax_Lightness: in  STD_LOGIC_VECTOR (8 downto 0);
           Ay_Lightness : in  STD_LOGIC_VECTOR (9 downto 0);
           DI_Lightness : in  STD_LOGIC_VECTOR (15 downto 0);
           WE_Lightness : in  STD_LOGIC;
           DO_Hud : out  STD_LOGIC_VECTOR (15 downto 0);
           DO_Saturation : out  STD_LOGIC_VECTOR (15 downto 0);
           DO_Lightness : out  STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;
COMPONENT Hud_Algorithm
PORT (    Reset : in std_logic;
			 WE_Hud  : out std_logic;
			 RE_Red : out  STD_LOGIC;
			 RE_Green : out  STD_LOGIC;
			 RE_Blue : out  STD_LOGIC;
			 Ax_Red  : out std_logic_vector(8 downto 0);
			 Ay_Red  : out std_logic_vector(9 downto 0);
			 Ax_Green : out std_logic_vector(8 downto 0);
			 Ay_Green   : out std_logic_vector(9 downto 0);
			 Ax_Blue : out std_logic_vector(8 downto 0);
			 Ay_Blue   : out std_logic_vector(9 downto 0);
			 Ax_Hud   : out std_logic_vector(8 downto 0);
			 Ay_Hud   : out std_logic_vector(9 downto 0);
          DI_red  : in std_logic_vector(15 downto 0);
			 DI_green  : in std_logic_vector(15 downto 0);
			 DI_blue  : in std_logic_vector(15 downto 0);
          DO_Hud  : out std_logic_vector(15 downto 0));
END COMPONENT;
COMPONENT Saturation_Algorithm
PORT (	 Reset : in std_logic;
			 WE_Saturation  : out std_logic;
          RE_Red : out  STD_LOGIC;
			 RE_Green : out  STD_LOGIC;
			 RE_Blue : out  STD_LOGIC;
			 Ax_Red  : out std_logic_vector(8 downto 0);
			 Ay_Red  : out std_logic_vector(9 downto 0);
			 Ax_Green : out std_logic_vector(8 downto 0);
			 Ay_Green   : out std_logic_vector(9 downto 0);
			 Ax_Blue : out std_logic_vector(8 downto 0);
			 Ay_Blue   : out std_logic_vector(9 downto 0);
			 Ax_Saturation   : out std_logic_vector(8 downto 0);
			 Ay_Saturation   : out std_logic_vector(9 downto 0);
          DI_red  : in std_logic_vector(15 downto 0);
			 DI_green  : in std_logic_vector(15 downto 0);
			 DI_blue  : in std_logic_vector(15 downto 0);
          DO_Saturation  : out std_logic_vector(15 downto 0));
END COMPONENT;
COMPONENT Lightness_Algorithm
PORT (	 Reset : in std_logic;
			 WE_Lightness  : out std_logic;
			 RE_Red : out  STD_LOGIC;
			 RE_Green : out  STD_LOGIC;
			 RE_Blue : out  STD_LOGIC;
			 Ax_Red  : out std_logic_vector(8 downto 0);
			 Ay_Red  : out std_logic_vector(9 downto 0);
			 Ax_Green : out std_logic_vector(8 downto 0);
			 Ay_Green   : out std_logic_vector(9 downto 0);
			 Ax_Blue  : out std_logic_vector(8 downto 0);
			 Ay_Blue   : out std_logic_vector(9 downto 0);
			 Ax_Lightness   : out std_logic_vector(8 downto 0);
			 Ay_Lightness   : out std_logic_vector(9 downto 0);
          DI_red  : in std_logic_vector(15 downto 0);
			 DI_green  : in std_logic_vector(15 downto 0);
			 DI_blue  : in std_logic_vector(15 downto 0);
          DO_Lightness  : out std_logic_vector(15 downto 0));
END COMPONENT;
COMPONENT frequency_divider
	PORT(
		clk50MHz : IN std_logic;
		Reset : IN std_logic;          
		clk2MHz : OUT std_logic;
		clk1MHz : OUT std_logic;
		clk1kHz : OUT std_logic
		);
	END COMPONENT;
COMPONENT Register_16bits
    PORT( 
			Din : in  STD_LOGIC_VECTOR (15 downto 0);
         Dout : out  STD_LOGIC_VECTOR (15 downto 0);
         EN : in  STD_LOGIC;
         Clk : in  STD_LOGIC;
			Reset: in STD_LOGIC);
END COMPONENT;


--signal Wire_Ax_Red : std_logic_vector(8 downto 0);
--signal Wire_Ay_Red : std_logic_vector(9 downto 0);
--signal Wire_Ax_Green : std_logic_vector(8 downto 0);
--signal Wire_Ay_Green : std_logic_vector(9 downto 0);
--signal Wire_Ax_Blue : std_logic_vector(8 downto 0);
--signal Wire_Ay_Blue : std_logic_vector(9 downto 0);
signal Wire_Ax_Hud : std_logic_vector(8 downto 0);
signal Wire_Ay_Hud : std_logic_vector(9 downto 0);
signal Wire_Ax_Saturation : std_logic_vector(8 downto 0);
signal Wire_Ay_Saturation : std_logic_vector(9 downto 0);
signal Wire_Ax_Lightness : std_logic_vector(8 downto 0);
signal Wire_Ay_Lightness : std_logic_vector(9 downto 0);
signal Wire_Red : std_logic_vector(15 downto 0);
signal Wire_Green : std_logic_vector(15 downto 0);
signal Wire_Blue : std_logic_vector(15 downto 0);
signal Wire_Red1 : std_logic_vector(15 downto 0);
signal Wire_Green1 : std_logic_vector(15 downto 0);
signal Wire_Blue1 : std_logic_vector(15 downto 0);
signal Wire_Hud : std_logic_vector(15 downto 0);
signal Wire_Saturation : std_logic_vector(15 downto 0);
signal Wire_Lightness : std_logic_vector(15 downto 0);
signal Wire_WE_Hud : std_logic;
signal Wire_WE_Saturation : std_logic;
signal Wire_WE_Lightness : std_logic;
signal Wire_RE_Red : std_logic;
signal Wire_RE_Green : std_logic;
signal Wire_RE_Blue : std_logic;

BEGIN


Inst_Red_Register: Register_16bits PORT MAP(
			 Din => Wire_Red,
          Dout => Wire_Red1,
          EN => Wire_RE_Red,
          clk => Clk,
			 Reset => Reset );
Inst_Green_Register: Register_16bits PORT MAP(
			 Din => Wire_Green,
          Dout => Wire_Green1,
          EN => Wire_RE_Green,
          clk => Clk,
			 Reset => Reset );			 
Inst_Blue_Register: Register_16bits PORT MAP(
			 Din => Wire_Blue,
          Dout => Wire_Blue1,
          EN => Wire_RE_Blue,
          Clk => Clk,
			 Reset => Reset );
Inst_HSL_RAM : HSL_RAM PORT MAP(
			  Reset => Reset,
			  Ax_Hud => Wire_Ax_Hud,
           Ay_Hud => Wire_Ay_Hud,
           DI_Hud => Wire_Hud,
           WE_Hud => Wire_WE_Hud,
           Ax_Saturation => Wire_Ax_Saturation,
           Ay_Saturation => Wire_Ay_Saturation,
           DI_Saturation => Wire_Saturation,
           WE_Saturation => Wire_WE_Saturation, 
           Ax_Lightness => Wire_Ax_Lightness,
           Ay_Lightness => Wire_Ay_Lightness,
           DI_Lightness => Wire_Lightness,
           WE_Lightness => Wire_WE_Lightness, 
           DO_Hud => DO_Hud,
           DO_Saturation => DO_Saturation, 
           DO_Lightness => DO_Lightness);			 
Inst_RGB_RAM : RGB_RAM PORT MAP(
			  Reset => Reset,
			  Ax_Red => Ax_Red, 
           Ay_Red => Ay_Red,
           DI_Red => DI_Red,
           WE_Red => WE_Red,
           Ax_Green => Ax_Green,
           Ay_Green => Ay_Green,
           DI_Green => DI_Green,
           WE_Green => WE_Green,
           Ax_Blue => Ax_Blue,
           Ay_Blue => Ay_Blue,
           DI_Blue => DI_Blue,
           WE_Blue => WE_Blue,
           DO_Red => Wire_Red,
           DO_Green => Wire_Green,
           DO_Blue => Wire_Blue);
Inst_Hud_Algorithm: Hud_Algorithm PORT MAP(
			 Reset => Reset,
			 WE_Hud  => Wire_WE_Hud,
			 RE_Red => Wire_RE_Red,
			 RE_Green => Wire_RE_Green,
			 RE_Blue => Wire_RE_Blue,
			 Ax_Red  => open,
			 Ay_Red   => open,
			 Ax_Green  => open,
			 Ay_Green   => open,
			 Ax_Blue  => open,
			 Ay_Blue   => open,
			 Ax_Hud   => Wire_Ax_Hud,
			 Ay_Hud   => Wire_Ay_Hud,
          DI_Red  => Wire_Red1,
			 DI_Green  => Wire_Green1,
			 DI_Blue  => Wire_Blue1,
          DO_Hud  => Wire_Hud
			 );
Inst_Saturation_Algorithm: Saturation_Algorithm PORT MAP(
			 Reset => Reset,
			 WE_Saturation  => Wire_WE_Saturation,
			 RE_Red => Wire_RE_Red,
			 RE_Green => Wire_RE_Green,
			 RE_Blue => Wire_RE_Blue,
			 Ax_Red  => open,
			 Ay_Red   => open,
			 Ax_Green  => open,
			 Ay_Green   => open,
			 Ax_Blue  => open,
			 Ay_Blue   => open,
			 Ax_Saturation   => Wire_Ax_Saturation,
			 Ay_Saturation   => Wire_Ay_Saturation,
          DI_Red  => Wire_Red1,
			 DI_Green  => Wire_Green1,
			 DI_Blue  => Wire_Blue1,
          DO_Saturation  => Wire_Saturation
			 );
Inst_Lightness_Algorithm: Lightness_Algorithm PORT MAP(
			 Reset => Reset,
			 WE_Lightness  => Wire_WE_Lightness,
			 RE_Red => Wire_RE_Red,
			 RE_Green => Wire_RE_Green,
			 RE_Blue => Wire_RE_Blue,
			 Ax_Red  => open,
			 Ay_Red   => open,
			 Ax_Green  => open,
			 Ay_Green   => open,
			 Ax_Blue  => open,
			 Ay_Blue   => open,
			 Ax_Lightness   => Wire_Ax_Lightness,
			 Ay_Lightness   => Wire_Ay_Lightness,
          DI_Red  => Wire_Red1,
			 DI_Green  => Wire_Green1,
			 DI_Blue  => Wire_Blue1,
          DO_Lightness  => Wire_Lightness
			 );
Inst_frequency_divider: frequency_divider PORT MAP(
		clk50MHz => clk,
		Reset => Reset,
		clk2MHz => open,
		clk1MHz => open,
		clk1kHz => open
	);	
			 
end Behavioral;

