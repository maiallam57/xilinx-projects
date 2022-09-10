--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:30:59 05/03/2022
-- Design Name:   
-- Module Name:   D:/CD 2024/Computer Architecture/xilinx projects/FourBitALU/test.vhd
-- Project Name:  FourBitALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitArithmeticCircuit
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitArithmeticCircuit
    PORT(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         SELECTOR : IN  std_logic_vector(1 downto 0);
         carry : IN  std_logic;
         outputs : OUT  std_logic_vector(3 downto 0);
         Carry_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
   signal SELECTOR : std_logic_vector(1 downto 0) := (others => '0');
   signal carry : std_logic := '0';

 	--Outputs
   signal outputs : std_logic_vector(3 downto 0);
   signal Carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitArithmeticCircuit PORT MAP (
          Ain => Ain,
          Bin => Bin,
          SELECTOR => SELECTOR,
          carry => carry,
          outputs => outputs,
          Carry_out => Carry_out
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
