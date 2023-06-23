library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
  port(
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
	 XOR_op   : in std_logic;
    cpu_bus  : inout std_logic_vector(31 downto 0):= (others => 'Z'));
end alu;

architecture rtl of alu is

	signal A_Q : unsigned(31 downto 0);
	signal A_D : unsigned(31 downto 0);
	signal B   : unsigned(31 downto 0);
	signal C   : unsigned(31 downto 0);
	signal C_Q : unsigned(31 downto 0);
	signal C_D : unsigned(31 downto 0);


begin

	a_current_state : process(Clock, Reset)
	begin
		if (Reset = '1') then
			A_Q <= (others => '0');
		elsif (rising_edge(Clock)) then
			A_Q <= A_D;
		end if;
	end process a_current_state;

	a_next_state : process(Ain, cpu_bus, A_Q)
	begin
		if(Ain = '1') then
			A_D <= unsigned(cpu_bus);
		else
			A_D <= A_Q;
		end if;
	end process a_next_state;

	b_input : B <= unsigned(cpu_bus);

	alu_logic : process(A_Q, B, ADD_op, CeqB_op, Not_op, OR_op, Neg_op, AND_op, SUB_op, SHR_op, SHRA_op, SHL_op, SHC_op, INCR4_op, XOR_op)
	begin
	if (ADD_op = '1') then
		C <= A_Q + B;
	elsif (SUB_op = '1') then
		C <= A_Q - B;
	elsif (Neg_op = '1') then
		C <= unsigned(std_logic_vector(-signed(B)));
	elsif (AND_op = '1') then
		C <= A_Q AND B;
	elsif (OR_op = '1') then
		C <= A_Q OR B;
	elsif (Not_op = '1') then
		C <= NOT B;
	elsif (SHR_op = '1') then
		C <= shift_right(unsigned(B), 1);
	elsif (SHRA_op = '1') then
		C <= unsigned(shift_right(signed(B), 1));
	elsif (SHL_op = '1') then
		C <= shift_left(unsigned(B), 1);
	elsif (SHC_op = '1') then
		C <= shift_left(unsigned(B), 1);
		C(0) <= B(31);
	elsif (CeqB_op = '1') then
		C <= B;
	elsif (INCR4_op = '1') then
		C <= B + 4;
	elsif (XOR_op = '1') then
		C <= A_Q XOR B;
	else
		C <= (others => '0');
	end if;
	end process alu_logic;

	c_current_state : process(Clock, Reset)
	begin
		if (Reset = '1') then
			C_Q <= (others => '0');
		elsif (rising_edge(Clock)) then
			C_Q <= C_D;
		end if;
	end process c_current_state;

	c_next_state : process(C, Cin, C_Q)
	begin
		if(Cin = '1') then
			C_D <= C;
		else
			C_D <= C_Q;
		end if;
	end process c_next_state;

	c_output : process(Cout, C_Q)
	begin
		if (Cout = '1') then
			cpu_bus <= std_logic_vector(C_Q);
		else
			cpu_bus <= (others => 'Z');
		end if;
	end process c_output;

end rtl;
