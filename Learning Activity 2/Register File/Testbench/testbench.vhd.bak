		LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavioral OF testbench IS

	COMPONENT program_counter
		PORT(
			Reset : IN STD_LOGIC;
			Clock : IN STD_LOGIC;
			PCin : IN STD_LOGIC;
			PCout : IN STD_LOGIC;
			cpu_bus : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0)	
		);
	END COMPONENT;
	
	signal Reset : STD_LOGIC;
	signal Clock : STD_LOGIC;
	signal PCin  : STD_LOGIC;
	signal PCout : STD_LOGIC;
	signal cpu_bus : STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal cpu_bus_expected : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	b2v_PC_0 : program_counter
		PORT MAP(
			Reset => Reset,
			Clock => Clock,
			PCin => PCin,
			PCout => PCout,
			cpu_bus => cpu_bus);
	
	testbench_process : process
	begin
		PCin <= '0';
		PCout <= '0';
		cpu_bus <= (others => 'Z');
		Clock <= '0';
		cpu_bus_expected <= (others => '0');
		
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 40 ns;
		
--		PCout <= '1';
--		wait for 10 ns;
--		
--		assert (cpu_bus = cpu_bus_expected) report "PC reset failed." severity note;
--		assert (cpu_bus /= cpu_bus_expected) report "PC reset succeeded." severity note;
--		
--		PCout <= '0';
--		wait for 40 ns;
--		
		cpu_bus <= "01010101010101010101010101010101";
		PCin <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		cpu_bus_expected <= "01010101010101010101010101010101";
		wait for 50 ns;
		Clock <= not Clock;
		PCin <= '0';
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		
		cpu_bus <= (others => 'Z');
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		PCout <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		
--		assert (cpu_bus = cpu_bus_expected) report "PC load failed.";
--		assert (cpu_bus /= cpu_bus_expected) report "PC load succeeded.";
		
		wait for 50 ns;
		Clock <= not Clock;
		PCout <= '0';
		cpu_bus <= "10101010101010101010101010101010";
		
		wait;
		
	end process testbench_process;
	
END behavioral;
