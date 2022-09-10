----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:52:55 03/06/2022 
-- Design Name: 
-- Module Name:    AND2Input - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND2Input is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : out  STD_LOGIC);
end AND2Input;

architecture Behavioral of AND2Input is

begin

z <= x and y;

end Behavioral;

