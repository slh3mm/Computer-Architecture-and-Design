library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity program_counter is
  port(
    Reset   : in std_logic;
    Clock   : in std_logic;
    PCin    : in std_logic;
    PCout   : in std_logic;
    cpu_bus : inout std_logic_vector(31 downto 0) := (others => 'Z')
    );
end program_counter;

architecture rtl of program_counter is
	signal Q : std_logic_vector(31 downto 0);
	signal D : std_logic_vector(31 downto 0);
	
begin
	pc_current_state : process(Clock, Reset)
	begin
		if (Reset = '1') then
			Q <= (others => '0');
		elsif (rising_edge(Clock)) then
			Q <= D;
		end if;		
	end process pc_current_state;
	
	pc_next_state : process(PCin, Q, cpu_bus)
	begin
		if (PCin = '1') then
			D <= cpu_bus;
		else
			D <= Q;
		end if;
	end process pc_next_state;
	
	pc_output : process(PCout,Q)
	begin
		if (PCout = '1') then
			cpu_bus <= Q;
		else 
			cpu_bus <= (others => 'Z');
		end if;
	end process pc_output;
	
end rtl;
