library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitLogicCircuit is
    Port ( A, B : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0));
end FourBitLogicCircuit;

architecture Behavioral of FourBitLogicCircuit is

Component OneStageLogicCircuit is
    Port ( Ai, Bi, S0, S1 : in  STD_LOGIC;
           Ei : out  STD_LOGIC);
end Component;

begin

LogicCircuit_1 : OneStageLogicCircuit port map(Ai => A(0), Bi => B(0), S0 => SEL(0), S1 => SEL(1), Ei => D(0) );
LogicCircuit_2 : OneStageLogicCircuit port map(Ai => A(1), Bi => B(1), S0 => SEL(0), S1 => SEL(1), Ei => D(1) );
LogicCircuit_3 : OneStageLogicCircuit port map(Ai => A(2), Bi => B(2), S0 => SEL(0), S1 => SEL(1), Ei => D(2) );
LogicCircuit_4 : OneStageLogicCircuit port map(Ai => A(3), Bi => B(3), S0 => SEL(0), S1 => SEL(1), Ei => D(3) );

end Behavioral;

