library IEEE;
use IEEE.std_logic_1164.all;

Entity con_logic is
  port(
    Reset   : in std_logic;
    Clock    : in std_logic;
    CONin   : in std_logic;
    CON     : out std_logic;
    c3_2_downto_0 :  in  STD_LOGIC_VECTOR(2 DOWNTO 0);
    cpu_bus : inout std_logic_vector(31 downto 0) := (others => 'Z')
    );
End con_logic;

Architecture rtl of con_logic is

  signal Q : std_logic;
  signal D : std_logic;
  signal eq_zero : std_logic;
  signal branch_never : std_logic;
  signal branch_always : std_logic;
  signal branch_eq_zero : std_logic;
  signal branch_neq_zero : std_logic;
  signal branch_ge_zero : std_logic;
  signal branch_lt_zero : std_logic;

begin

  CON <= Q;
  
  con_current_state : process(Clock, Reset)
  begin
    if (Reset = '1') then
      Q <= '0';
    elsif (rising_edge(Clock)) then
      Q <= D;
    end if;
  end process con_current_state;

  con_next_state : process(CONin, Q, branch_always, branch_eq_zero,
                           branch_neq_zero, branch_ge_zero, branch_lt_zero)
  begin
    if (CONin = '1') then
      D <= branch_always or branch_eq_zero or branch_neq_zero or
           branch_ge_zero or branch_lt_zero;
    else
      D <= Q;
    end if;
  end process con_next_state;

  -- eq_zero = 1 if cpu_bus = zero
  eq_zero <= not (cpu_bus(31) or cpu_bus(30) or cpu_bus(29) or cpu_bus(28) or
                  cpu_bus(27) or cpu_bus(26) or cpu_bus(25) or cpu_bus(24) or
                  cpu_bus(23) or cpu_bus(22) or cpu_bus(21) or cpu_bus(20) or
                  cpu_bus(19) or cpu_bus(18) or cpu_bus(17) or cpu_bus(16) or
                  cpu_bus(15) or cpu_bus(14) or cpu_bus(13) or cpu_bus(12) or
                  cpu_bus(11) or cpu_bus(10) or cpu_bus(9) or cpu_bus(8) or
                  cpu_bus(7) or cpu_bus(6) or cpu_bus(5) or cpu_bus(4) or
                  cpu_bus(3) or cpu_bus(2) or cpu_bus(1) or cpu_bus(0));

  branch_never <= (not c3_2_downto_0(2)) and (not c3_2_downto_0(1)) and (not c3_2_downto_0(0));
  branch_always <= (not c3_2_downto_0(2)) and (not c3_2_downto_0(1)) and ( c3_2_downto_0(0));
  branch_eq_zero <= (not c3_2_downto_0(2)) and ( c3_2_downto_0(1)) and (not c3_2_downto_0(0))
                    and eq_zero;
  branch_neq_zero <= (not c3_2_downto_0(2)) and ( c3_2_downto_0(1)) and ( c3_2_downto_0(0)) and
                     (not eq_zero);
  branch_ge_zero <= ( c3_2_downto_0(2)) and (not c3_2_downto_0(1)) and (not c3_2_downto_0(0)) and
                    (not cpu_bus(31));
  branch_lt_zero <= ( c3_2_downto_0(2)) and (not c3_2_downto_0(1)) and ( c3_2_downto_0(0)) and
                    ( cpu_bus(31));

end rtl;
