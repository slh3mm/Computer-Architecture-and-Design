LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY testbench IS
end testbench;

ARCHITECTURE behavioral OF testbench IS

	COMPONENT alu
		PORT(
			Reset    : in std_logic;
			Clock    : in std_logic;
			Ain      : in std_logic;
			Cin      : in std_logic;
			Cout     : in std_logic;
			ADD_op   : in std_logic;
			SUB_op   : in std_logic;
			Neg_op   : in std_logic;
			AND_op   : in std_logic;
			OR_op    : in std_logic;
			NOT_op   : in std_logic;
			SHR_op   : in std_logic;
			SHRA_op  : in std_logic;
			SHL_op   : in std_logic;
			SHC_op   : in std_logic;
			CeqB_op  : in std_logic;
			INCR4_op : in std_logic;
			cpu_bus  : inout std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal Reset    : std_logic;
	signal Clock    : std_logic;
	signal Ain      : std_logic;
	signal Cin      : std_logic;
	signal Cout     : std_logic;
	signal add_op   : std_logic;
	signal sub_op   : std_logic;
	signal neg_op   : std_logic;
	signal and_op   : std_logic;
	signal or_op    : std_logic;
	signal not_op   : std_logic;
	signal shr_op   : std_logic;
	signal shra_op  : std_logic;
	signal shl_op   : std_logic;
	signal shc_op   : std_logic;
	signal CeqB_op  : std_logic;
	signal incr4_op : std_logic;
	signal cpu_bus  : std_logic_vector(31 downto 0);
	signal cpu_bus_expected  : std_logic_vector(31 downto 0);
	
BEGIN

	b2v_ALU0 : alu
		PORT MAP(
		Reset => Reset,
		Clock => Clock,
		Ain => Ain,
		Cin => Cin,
		Cout => Cout,
		ADD_op => add_op,
		CeqB_op => CeqB_op,
		NOT_op => not_op,
		Neg_op => neg_op,
		SHR_op => shr_op,
		SHC_op => shc_op,
		SHRA_op => shra_op,
		OR_op => or_op,
		AND_op => and_op,
		SHL_op => shl_op,
		SUB_op => sub_op,
		INCR4_op => incr4_op,
		cpu_bus => cpu_bus
		);
		
	testbench_process : process
	begin
		--Initialize Components
		Ain <= '0';
		Cin <= '0';
		Cout <= '0';
		add_op <= '0';
		sub_op <= '0';
		neg_op <= '0';
		and_op <= '0';
		or_op <= '0';
		not_op <= '0';
		shr_op <= '0';
		shra_op <= '0';
		shl_op <= '0';
		shc_op <= '0';
		CeqB_op <= '0';
		incr4_op <= '0';
		cpu_bus <= (others => 'Z');
		Clock <= '0';
		
		--Test Reset
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 40 ns;
		--ADD OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 1 (expected value is 3)
			cpu_bus <= (0 => '1', others => '0');
			cpu_bus_expected <= (0 => '1', 1 => '1', others => '0');
			
			--Add A and B
			add_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			add_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--SUB OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 1 (expected value is 1)
			cpu_bus <= (0 => '1', others => '0');
			cpu_bus_expected <= (0 => '1', others => '0');
			
			--Sub A and B
			sub_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			sub_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--Neg OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 1 (expected value is -1)
			cpu_bus <= (0 => '1', others => '0');
			cpu_bus_expected <= (others => '1');
			
			--Neg B
			neg_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			neg_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;

		--AND OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 3 (expected value is 2)
			cpu_bus <= (0 => '1', 1 => '1', others => '0');
			cpu_bus_expected <= (1 => '1', others => '0');
			
			--AND A and B
			and_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			and_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--OR OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 1 (expected value is 3)
			cpu_bus <= (0 => '1', others => '0');
			cpu_bus_expected <= (0 => '1', others => '0');
			
			--OR A and B
			or_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			or_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--NOT OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to compliment of 2 (expected value is 2)
			cpu_bus <= (1 => '0', others => '1');
			cpu_bus_expected <= (1 => '1', others => '0');
			
			--NOT B
			not_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			not_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--SHR OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 4 (expected value is 2)
			cpu_bus <= (2 => '1', others => '0');
			cpu_bus_expected <= (1 => '1', others => '0');
			
			--SHR B
			shr_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			shr_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--SHRA OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to -2 (expected value is -1)
			cpu_bus <= (0 => '0', others => '1');
			cpu_bus_expected <= (others => '1');
			
			--SHRA B
			shra_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			shra_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--SHL OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 2 (expected value is 4)
			cpu_bus <= (1 => '1', others => '0');
			cpu_bus_expected <= (2 => '1', others => '0');
			
			--SHL B
			shl_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			shl_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--SHC OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 4294967297 (expected value is 3)
			cpu_bus <= (0 => '1', 31 => '1', others => '0');
			cpu_bus_expected <= (0 => '1', 1 => '1', others => '0');
			
			--SHC B
			shc_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			shc_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			
		--CeqB OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 2 (expected value is 2)
			cpu_bus <= (1 => '1', others => '0');
			cpu_bus_expected <= (1 => '1', others => '0');
			
			--C = B
			CeqB_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			CeqB_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
		
		--INCR4 OPERATION TEST
		
			--Set A and B to 2
			cpu_bus <= (1 => '1', others => '0');
			Ain <= '1';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			Ain <= '0';
			
			--Set B to 0 (expected value is 4)
			cpu_bus <= (others => '0');
			cpu_bus_expected <= (2 => '1', others => '0');
			
			--C = B + 4
			incr4_op <= '1';
			
			--Load value into C register and verify that the register works
			Cin <= '1';
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
			incr4_op <= '0';
			
			--Load value onto bus
			Cin <= '0';
			Cout <= '1';
			cpu_bus <= (others => 'Z');
			Cout <= '0';
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
		
		
		wait;
		
	end process testbench_process;
		
END behavioral;
	