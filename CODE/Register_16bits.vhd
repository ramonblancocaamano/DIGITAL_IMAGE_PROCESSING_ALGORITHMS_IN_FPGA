library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_16bits is
    Port ( Din : in  STD_LOGIC_VECTOR (15 downto 0);
           Dout : out  STD_LOGIC_VECTOR (15 downto 0);
           EN : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset: in STD_LOGIC);
end Register_16bits;

architecture Behavioral of Register_16bits is
signal Dout_aux : STD_LOGIC_VECTOR(15 DOWNTO 0);
begin

process (Clk,Reset, EN, Din)
begin
   if Reset='1' then   
      Dout_aux <= "0000000000000000";
	end if;
   if Clk'event and Clk='1' and EN='1' then  
		Dout_aux <= Din;
   end if;
	Dout <= Dout_aux;
end process;
end Behavioral;

