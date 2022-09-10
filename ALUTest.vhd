LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY test IS
END test;
ARCHITECTURE behavior OF test IS  
    COMPONENT FourBitALU
    PORT(
         INPUT_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           INPUT_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           INPUT_CARRY : in  STD_LOGIC;
           INPUT_SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           OUTPUT_RESULT : out  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT_CARRY : out  STD_LOGIC
        );
    END COMPONENT;
   --Inputs
   signal INPUT_1 : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
   signal INPUT_2 : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
   signal INPUT_CARRY : STD_LOGIC := '0';
   signal INPUT_SEL : STD_LOGIC_VECTOR (2 downto 0):= (others => '0');
 	--Outputs
   signal OUTPUT_RESULT :  STD_LOGIC_VECTOR (3 downto 0);
   signal OUTPUT_CARRY :   STD_LOGIC;
BEGIN
    uut: FourBitALU PORT MAP (
          INPUT_1 => INPUT_1,
          INPUT_2 => INPUT_2,
          INPUT_CARRY => INPUT_CARRY,
          INPUT_SEL => INPUT_SEL,
          OUTPUT_RESULT => OUTPUT_RESULT,
          OUTPUT_CARRY => OUTPUT_CARRY
        );
   -- Stimulus process
   stim_proc: process
   begin		
	   wait for 100 ns;	
      -- logic circuit
		INPUT_1 <= "0001";
	   INPUT_2 <= "0010";		
	   INPUT_CARRY <= '0';
	   INPUT_SEL <= "000";	--AND "0000"
      wait for 100 ns;			
	   INPUT_SEL <= "010";	--OR "0011"
      wait for 100 ns;
		INPUT_SEL <= "100";	--XOR "0011"
      wait for 100 ns;
		INPUT_SEL <= "110";	--COMPLEMENT "1110"
      wait for 100 ns;		
		--artihmetic circuit
	   INPUT_CARRY <= '0';
	   INPUT_SEL <= "001";	--ADD "0011"
      wait for 100 ns;			
	   INPUT_CARRY <= '1';
	   INPUT_SEL <= "001";	--ADD WITH CARRY "0100"
      wait for 100 ns;		
	   INPUT_CARRY <= '0';
	   INPUT_SEL <= "011";	--SUBTRACT WITH BORROW "1110"
      wait for 100 ns;							
		INPUT_CARRY <= '0';	
	   INPUT_SEL <= "101";	--TRANSFER A "0001"
      wait for 100 ns;		
	   INPUT_CARRY <= '1';	--INCREMENT A "0010"
	   INPUT_SEL <= "101";
      wait for 100 ns;			
	   INPUT_CARRY <= '0';
	   INPUT_SEL <= "111";	--DECREMENT A "0010"
      wait for 100 ns;		
	   INPUT_CARRY <= '1';
	   INPUT_SEL <= "111";	--TRANSFER A "0001"
      wait;
   end process;
END;
