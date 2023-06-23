library IEEE;
use IEEE.std_logic_1164.all;

entity instruction_register is
  port (
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
end instruction_register;

architecture rtl of instruction_register is

	signal Q : std_logic_vector(31 downto 0);
	signal D : std_logic_vector(31 downto 0);
begin

	ir_current_state : process(Clock, Reset)
	begin
		if (Reset = '1') then
			Q <= (others => '0');
		elsif (rising_edge(Clock)) then
			Q <= D;
		end if;
	end process ir_current_state;	

	ir_next_state : process(IRin, Q, cpu_bus)
	begin
		if(IRin = '1') then
			D <= cpu_bus;
		else
			D <= Q;
		end if;
	end process ir_next_state;
	
	ir_output : process(c1out, c2out,Q)
	begin
		if (c1out = '1') then
			cpu_bus(21 downto 0) <= Q(21 downto 0);
			cpu_bus(31 downto 22) <= (others => Q(21));
		elsif (c2out = '1') then
			cpu_bus(16 downto 0) <= Q(16 downto 0);
			cpu_bus(31 downto 17) <= (others => Q(16));
		else
			cpu_bus <= (others => 'Z');
		end if;
	end process ir_output;

	register_select_process : process(Q,Gra,Grb,Grc)
	begin
		if (Gra = '1') then
			register_select <= Q(26 downto 22);
		elsif (Grb = '1') then
			register_select <= Q(21 downto 17);
		elsif (Grc = '1') then
			register_select <= Q(16 downto 12);
		else
			register_select <= (others => '0');
		end if;
	end process register_select_process;

	c3_2_downto_0(2 downto 0) <= Q(2 downto 0);
	
	opcode <= Q(31 downto 27);

end rtl;
