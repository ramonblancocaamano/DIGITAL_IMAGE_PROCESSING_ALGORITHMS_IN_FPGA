library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM_640x480 is 
port (	 Reset : in  std_logic;
			 WE  : in std_logic;
			 Ax   : in std_logic_vector(8 downto 0);
			 Ay   : in std_logic_vector(9 downto 0);
          DI  : in std_logic_vector(15 downto 0);
          DO  : out std_logic_vector(15 downto 0));
end RAM_640x480;

architecture Behavioral of RAM_640x480 is
	type ram_type is array (9 downto 0, 8 downto 0) of std_logic_vector (15 downto 0);	
   signal RAM : ram_type;
begin
process (DI,Ay,Ax)
    begin
--	 RAM(conv_integer(X"00"),conv_integer(X"00")) <= X"00FF";
--	 RAM(conv_integer(X"00"),conv_integer(X"01")) <= X"00FF";
--	 RAM(conv_integer(X"01"),conv_integer(X"00")) <= X"00FF";
--	 RAM(conv_integer(X"01"),conv_integer(X"01")) <= X"00FF";
            if (WE = '1') then
                RAM(conv_integer(Ay),conv_integer(Ax)) <= DI;
            end if;
	 DO <= RAM(conv_integer(Ay),conv_integer(Ax));		
    end process;
    

end Behavioral;
