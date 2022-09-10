library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitArithmeticCircuit is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
           SELECTOR : in  STD_LOGIC_VECTOR (1 downto 0);
           carry : in  STD_LOGIC;
           outputs : out  STD_LOGIC_VECTOR (3 downto 0);
			  Carry_out : out  STD_LOGIC);
end FourBitArithmeticCircuit;

architecture Behavioral of FourBitArithmeticCircuit is

component OneStageArithmeticCircuit is
    Port ( M, N, V : in  STD_LOGIC;
           SL : in  STD_LOGIC_VECTOR (1 downto 0);
           OUT_1, OUT_2 : out  STD_LOGIC);
end component;

signal int_carry : STD_LOGIC_VECTOR (2 downto 0);
begin

AC_1 : OneStageArithmeticCircuit port map(Ain(0), Bin(0), carry, 			SELECTOR, outputs(0), int_carry(0));
AC_2 : OneStageArithmeticCircuit port map(Ain(1), Bin(1), int_carry(0), SELECTOR, outputs(1), int_carry(1));
AC_3 : OneStageArithmeticCircuit port map(Ain(2), Bin(2), int_carry(1), SELECTOR, outputs(2), int_carry(2));
AC_4 : OneStageArithmeticCircuit port map(Ain(3), Bin(3), int_carry(2), SELECTOR, outputs(3), Carry_out);

end Behavioral;

