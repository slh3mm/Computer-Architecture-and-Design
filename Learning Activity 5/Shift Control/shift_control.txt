library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity shift_control is
  port(
    Reset   : in std_logic;
    clock   : in std_logic;
    ld_shift: in std_logic;
    Decr    : in std_logic;
    Neq0    : out std_logic;
    cpu_bus : inout std_logic_vector(31 downto 0) := (others => 'Z')
    );
End shift_control;

Architecture rtl of shift_control is

  signal Q : unsigned(4 downto 0);
  signal D : unsigned(4 downto 0);

begin

  n_counter_current_state : process(clock, Reset)
  begin
    if (Reset = '1') then
      Q <= (others => '0');
    elsif (rising_edge(clock)) then
      Q <= D;
    end if;
  end process n_counter_current_state;

  n_counter_next_state : process(ld_shift,Decr,cpu_bus,Q)
  begin

    -- load down counter with shift count, n
    if ((ld_shift = '1') and (Decr = '0')) then
      D <= unsigned(cpu_bus(4 downto 0));

    -- decrement down counter while n not equal to zero
    elsif ((ld_shift = '0') and (Decr = '1')) then
      D <= (Q - 1);

    else
      D <= Q;
    end if;

    -- output
    Neq0 <= not (std_logic(Q(4)) or std_logic(Q(3)) or std_logic(Q(2)) or std_logic(Q(1)) or std_logic(Q(0)));
    -- conditional signal assignment
    -- Neq0 <= '1' when n_counter = "00000" else '0';

  end process n_counter_next_state;
  
end rtl;

