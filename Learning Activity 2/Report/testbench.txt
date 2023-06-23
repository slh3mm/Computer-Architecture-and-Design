LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavioral OF testbench IS
	COMPONENT register_file
		PORT(
			Reset		: in std_logic;
			Clock    : in std_logic;
			register_select    : in std_logic_vector(4 downto 0);
			Rin      : in std_logic;
			Rout     : in std_logic;
			BAout    : in std_logic;
			cpu_bus  : inout std_logic_vector(31 downto 0) := (others => 'Z')
		);
	END COMPONENT;
	
	signal Reset : STD_LOGIC;
	signal Clock : STD_LOGIC;
	signal register_select : STD_LOGIC_VECTOR(4 downto 0);
	signal Rin : STD_LOGIC;
	signal Rout : STD_LOGIC;
	signal BAout : STD_LOGIC;
	signal cpu_bus : STD_LOGIC_VECTOR(31 downto 0) := (others => 'Z');
	signal cpu_bus_expected : STD_LOGIC_VECTOR(31 downto 0) := (others => 'Z');
	
BEGIN
	b2v_RF_0 : register_file
		PORT MAP(
			Reset => Reset,
			Clock => Clock,
			register_select => register_select,
			Rin => Rin,
			Rout => Rout,
			BAout => BAout,
			cpu_bus => cpu_bus);
	
	testbench_process : process
		variable register_index : integer := 0;
	begin
		Rin <= '0';
		Rout <= '0';
		BAout <= '0';
		register_select <= (others => '0');
		cpu_bus <= (others => 'Z');
		cpu_bus_expected <= (others => '0');
		Clock <= '0';
		
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 40 ns;
		
		Rin <= '1';
		for register_index in 31 downto 1 loop
			register_select <= std_logic_vector(to_unsigned(register_index,5));
			cpu_bus(31 downto 5) <= (others => '0');
			cpu_bus(4 downto 0) <= std_logic_vector(to_unsigned(register_index,5));
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
		end loop;
		register_select <= std_logic_vector(to_unsigned(0,5));
		cpu_bus(31 downto 0) <= (others => '1');
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
			
		Rin <= '0';
		Rout <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		cpu_bus <= (others => 'Z');
		for register_index in 31 downto 0 loop
			register_select <= std_logic_vector(to_unsigned(register_index,5));
			wait for 50 ns;
			Clock <= not Clock;
			cpu_bus_expected(31 downto 5) <= (others => '0');
			cpu_bus_expected(4 downto 0) <= std_logic_vector(to_unsigned(register_index,5));
			wait for 50 ns;
			Clock <= not Clock;
		end loop;
		
		Rout <= '0';
		BAout <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		cpu_bus <= (others => 'Z');
		for register_index in 31 downto 0 loop
			register_select <= std_logic_vector(to_unsigned(register_index,5));
			wait for 50 ns;
			Clock <= not Clock;
			wait for 50 ns;
			Clock <= not Clock;
		end loop;
		
		wait;
		
	end process testbench_process;
	
END behavioral;
