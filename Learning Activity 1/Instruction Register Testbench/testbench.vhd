LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavioral OF testbench IS

	COMPONENT instruction_register
		PORT(
			Reset    : in std_logic;
			Clock    : in std_logic;
			IRin     : in std_logic;
			c1out    : in std_logic;
			c2out    : in std_logic;
			Gra      : in std_logic;
			Grb      : in std_logic;
			Grc      : in std_logic;
			opcode : out std_logic_vector(4 downto 0);
			register_select : out std_logic_vector(4 downto 0);
			c3_2_downto_0 : out std_logic_vector(2 downto 0);
			cpu_bus  : inout std_logic_vector(31 downto 0) := (others => 'Z')	
		);
	END COMPONENT;
	
	signal Reset    : std_logic;
	signal Clock    : std_logic;
   signal irin     : std_logic;
   signal c1out    : std_logic;
   signal c2out    : std_logic;
   signal gra      : std_logic;
   signal grb      : std_logic;
   signal grc      : std_logic;
   signal opcode   : std_logic_vector(4 downto 0);
   signal register_select : std_logic_vector(4 downto 0);
   signal c3_2_downto_0 : std_logic_vector(2 downto 0);
   signal cpu_bus  : std_logic_vector(31 downto 0) := (others => 'Z');

BEGIN
	b2v_IR_0 : instruction_register
		PORT MAP(
			Reset => Reset,
			Clock => Clock,
			IRin => irin,
			c1out => c1out,
			c2out => c2out,
			Gra => gra,
			Grb => grb,
			Grc => grc,
			opcode => opcode,
			register_select => register_select,
			c3_2_downto_0 => c3_2_downto_0,
			cpu_bus => cpu_bus);
	
	testbench_process : process
	begin
		cpu_bus <= (others => 'Z');
		IRin <= '0';
		Reset <= '0';
		Gra <= '0';
		Grb <= '0';
		Grc <= '0';
		Clock <= '0';
		c1out <= '0';
		c2out <= '0';
		
		Reset <= '1';
		wait for 10 ns;
		Reset <= '0';
		wait for 40 ns;
		IRin <= '1';
		cpu_bus <= x"AD210007";
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		IRin <= '0';
		Gra <= '1';
		cpu_bus <= (others => 'Z');
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		Gra <= '0';
		Grb <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		Grb <= '0';
		Grc <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		Grc <= '0';
		c1out <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		c1out <= '0';
		c2out <= '1';
		wait for 50 ns;
		Clock <= not Clock;
		wait for 50 ns;
		Clock <= not Clock;
		c2out <= '0';
		wait for 50 ns;
		Clock <= not Clock;
		
		wait;
		
	end process testbench_process;
	
END behavioral;
