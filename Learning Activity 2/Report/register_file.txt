library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_file is
  port (
    Reset    : in std_logic;
    Clock     : in std_logic;
    register_select	: in std_logic_vector(4 downto 0);
    Rin      : in std_logic;
    Rout     : in std_logic;
    BAout    : in std_logic;
    cpu_bus  : inout std_logic_vector(31 downto 0) := (others => 'Z')
    );
end register_file;

architecture rtl of register_file is

	type register_array is array(31 downto 0) of std_logic_vector(31 downto 0);
	signal RF : register_array;
	signal D : std_logic_vector(31 downto 0);

begin

	RF_input : process(Clock, Reset, Rin)
	begin
		if (Reset = '1') then
			RF <= (others => (others => '0'));
		elsif (rising_edge(Clock)) then
			if (Rin = '1') then
				RF(to_integer(unsigned(register_select))) <= cpu_bus;
			end if;
		end if;
	end process RF_input;
	
	RF_output : process(Rout, RF, register_select)
	begin
		if (Rout = '1') then
			cpu_bus <= RF(to_integer(unsigned(register_select)));
		else
			cpu_bus <= (others => 'Z');
		end if;
	end process RF_output;
	
	BA_output : process(BAout, RF, register_select)
	begin
		if (BAout = '1') then
			if (register_select = "00000")then
				cpu_bus <= (others => '0');
			else
				cpu_bus <= RF(to_integer(unsigned(register_select))); 
			end if;
		else
			cpu_bus <= (others => 'Z');
		end if;
			
	end process BA_output;

end rtl;
