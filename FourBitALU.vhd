library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitALU is
    Port ( INPUT_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           INPUT_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           INPUT_CARRY : in  STD_LOGIC;
           INPUT_SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           OUTPUT_RESULT : out  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT_CARRY : out  STD_LOGIC);
end FourBitALU;

architecture Behavioral of FourBitALU is
component FourBitLogicCircuit is
    Port ( A, B : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
component FourBitArithmeticCircuit is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
           SELECTOR : in  STD_LOGIC_VECTOR (1 downto 0);
           carry : in  STD_LOGIC;
           outputs : out  STD_LOGIC_VECTOR (3 downto 0);
			  Carry_out : out  STD_LOGIC);
end component;

signal Logic_output, Arithmetic_output : STD_LOGIC_VECTOR (3 downto 0);

begin

FBLC : FourBitLogicCircuit port map(INPUT_1, INPUT_2, INPUT_SEL(1 downto 0), Logic_output);
FBAC : FourBitArithmeticCircuit port map(INPUT_1, INPUT_2, INPUT_SEL(1 downto 0), INPUT_CARRY, Arithmetic_output, OUTPUT_CARRY);

WITH INPUT_SEL(2) SELECT
OUTPUT_RESULT <= Logic_output WHEN '0',
					  Arithmetic_output WHEN OTHERS;

end Behavioral;

