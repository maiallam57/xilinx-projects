
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( P : in  STD_LOGIC;
           Q : in  STD_LOGIC;
           T : in  STD_LOGIC;
           S : out  STD_LOGIC;
           R : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

begin

S <= P XOR Q XOR T;
R <= (P AND Q) OR (P AND T) OR (Q AND T);

end Behavioral;

