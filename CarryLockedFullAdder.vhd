----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:37 03/29/2022 
-- Design Name: 
-- Module Name:    CarryLockedFullAdder - Behavioral 
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

entity CarryLockedFullAdder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end CarryLockedFullAdder;

architecture Behavioral of CarryLockedFullAdder is
signal G, P : STD_LOGIC_VECTOR (3 downto 0);
signal C : STD_LOGIC_VECTOR (2 downto 0);

begin
G(0)<= A(0) AND B(0);
G(1)<= A(1) AND B(1);
G(2)<= A(2) AND B(2);
G(3)<= A(3) AND B(3);

P(0)<= A(0) XOR B(0);
P(1)<= A(1) XOR B(1);
P(2)<= A(2) XOR B(2);
P(3)<= A(3) XOR B(3);

c(0) <= G(0) OR (P(0) AND Cin);
c(1) <= G(1) OR (G(0) AND P(1)) OR (P(0) AND P(1) AND Cin);
c(2) <= G(2) OR (G(1) AND P(2)) OR (G(0) AND P(1) AND P(2)) OR (P(0) AND P(1) AND P(2) AND Cin);
Cout <= G(3) OR (G(2) AND P(3)) OR (G(1) AND P(2) AND P(3)) OR (G(0) AND P(1) AND P(2) AND P(3)) OR (P(0) AND P(1) AND P(2) AND P(3) AND Cin);

S(0) <= P(0) XOR Cin;
S(1) <= P(1) XOR C(0);
S(2) <= P(2) XOR C(1);
S(3) <= P(3) XOR C(2);

end Behavioral;
