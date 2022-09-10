library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4_1 is
    Port ( X, Y, Z, W : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           F : out  STD_LOGIC);
end Mux4_1;

architecture Behavioral of Mux4_1 is

begin

WITH SEL SELECT
F <= X WHEN "00",
	  Y WHEN "01",
	  Z WHEN "10",
	  W WHEN OTHERS;
	  
end Behavioral;

