--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:04:25 03/29/2022
-- Design Name:   
-- Module Name:   D:/CD 2024/Computer Architecture/xilinx projects/CarryLockedAhead/CarryLockedFullAdderTest.vhd
-- Project Name:  CarryLockedAhead
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarryLockedFullAdder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CarryLockedFullAdderTest IS
END CarryLockedFullAdderTest;
 
ARCHITECTURE behavior OF CarryLockedFullAdderTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarryLockedFullAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryLockedFullAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );   
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		A <= "0000";
		B <= "0001";
		Cin <= '0';
      wait for 100 ns;	
		Cin <= '1';
		wait for 100 ns;
		
		A <= "1111";
		B <= "0001";
		Cin <= '0';
      wait for 100 ns;

		Cin <= '1';
      wait for 100 ns;
		
		A <= "0010";
		B <= "0010";
		Cin <= '0';
      wait for 100 ns;
      wait;
   end process;
END;
