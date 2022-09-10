
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OneStageArithmeticCircuit is
    Port ( M, N, V : in  STD_LOGIC;
           SL : in  STD_LOGIC_VECTOR (1 downto 0);
           OUT_1, OUT_2 : out  STD_LOGIC);
end OneStageArithmeticCircuit;

architecture Behavioral of OneStageArithmeticCircuit is

Component Mux4_1 is
    Port ( X, Y, Z, W : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           F : out  STD_LOGIC);
end Component;

Component FullAdder is
    Port ( P, Q, T : in  STD_LOGIC;
           S, R : out  STD_LOGIC);
end Component;

SIGNAL OUTPUT: STD_LOGIC;

begin

mux1 : Mux4_1 port map( X => V, Y => NOT V, Z => '0', W => '1', SEL(0) => SL(0), SEL(1) => SL(1), F => OUTPUT );

FA1: FullAdder port map(P => N, Q => OUTPUT, T => M, S => OUT_1, R => OUT_2 );

end Behavioral;

