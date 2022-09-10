library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OneStageLogicCircuit is
    Port ( Ai, Bi, S0, S1 : in  STD_LOGIC;
           Ei : out  STD_LOGIC);
end OneStageLogicCircuit;

architecture Behavioral of OneStageLogicCircuit is

Component Mux4_1 is
    Port ( X, Y, Z, W : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           F : out  STD_LOGIC);
end Component;

begin

MUX4To1: Mux4_1 port map(X => (Ai AND Bi), Y => (Ai OR Bi), Z => (Ai xor Bi), W => (NOT Ai), SEL(0) => S0, SEL(1) => S1, F => Ei);

end Behavioral;

