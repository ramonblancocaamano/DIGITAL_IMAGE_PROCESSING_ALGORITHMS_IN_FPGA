------------------------------------------------------------------
--  divider50.vhd -- 
-- This circuit generates a clock signal with a frequency 50 times slower
-- than the input clock frequency
-- except the first time, that will be 49 times slower
------------------------------------------------------------------
-- Luis Jacobo Alvarez Ruiz de Ojeda
-- Dpto. Tecnologia Electronica
-- University of Vigo
-- 24, March, 2006 
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divider50 is
    Port ( clkin : in std_logic;
           clkout : out std_logic;
           Reset : in std_logic);
end divider50;

architecture Behavioral of divider50 is

signal count: integer range 0 to 24:=0;
signal clkout_aux: std_logic:='0';

begin

clkout <= clkout_aux;

process (Reset,clkin)
begin
	if Reset = '1' then 	clkout_aux <='0';
								count <= 0;
 	elsif
		clkin='1' and clkin'event then
			if count = 24 then clkout_aux <= not clkout_aux;
									 count <= 0;
			else count <= count+1;
			end if;
	end if;
end process;
end Behavioral;
