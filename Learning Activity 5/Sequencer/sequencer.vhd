LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity sequencer is
  port(
    Reset    : in std_logic;
    Clock    : in std_logic;
    Start    : in std_logic;
    Done     : in std_logic;
    End_sig  : in std_logic;
    Goto6    : in std_logic;
    Read_control  : in std_logic;
    Write_control : in std_logic;
    Wait_sig : in std_logic;
    Stop_sig : in std_logic;
    t0 : out std_logic;
    t1 : out std_logic;
    t2 : out std_logic;
    t3 : out std_logic;
    t4 : out std_logic;
    t5 : out std_logic;
    t6 : out std_logic;
    t7 : out std_logic;
    r_sequencer : out std_logic;
    w_sequencer : out std_logic
    );
end sequencer;

architecture rtl of sequencer is

  signal run_sig, run_sig_next : std_logic;
  type states is (Initial, Stop, Run, Read_Q, Write_Q);
  signal current_state, next_state : states;
  signal t_counter, t_counter_next : unsigned(2 downto 0);
  
begin

  -- This process models a JK flip flop, where J = Start and K = Stop_sig. The
  -- purpose is to capture the rising edge of Start that starts the CPU and rising
  -- edge of Stop_sig that stops the CPU.
  run_signal_process : process(Reset,Clock)
  begin
	if (Reset = '1') then
		run_sig <= '0';
	elsif (rising_edge(Clock)) then
		run_sig <= run_sig_next;
	end if;
  end process run_signal_process;

  -- Concurrent signal assignment to implement next-state logic for Run_sig.
  -- JK flip flop: q+ = Jq' + K'q, J = Start, K = Stop_sig
	run_sig_next <= (Start and not(run_sig)) or (not(Stop_sig) and run_sig);

  -- The following processes implement the fetch-execute FSM for the control unit.
  current_state_fetch_execute : process(Reset, Clock)
  begin
		if (Reset = '1') then
			current_state <= Initial;
		elsif (rising_edge(Clock)) then
			current_state <= next_state;
		end if;
  end process current_state_fetch_execute;

  next_state_fetch_execute : process(current_state, Run_sig, Done, Read_control, Write_control)
  begin
    case current_state is
      when Initial =>
			if (run_sig = '1') then
				next_state <= Run;
			else
				next_state <= Initial;
			end if;
      when Run =>
			if (run_sig = '0') then
				next_state <= Stop;
			elsif (Read_control = '1') then
				next_state <= Read_Q;
			elsif (Write_control = '1') then
				next_state <= Write_Q;
			else 
				next_state <= Run;
			end if;
      when Read_Q | Write_Q=>
			if (Done = '1') then
				next_state <= Run;
			else
				next_state <= current_state;
			end if;
      when Stop =>
			next_state <= Stop;
    end case;
  end process next_state_fetch_execute;

  fetch_execute_output : process(current_state)
  begin
    case current_state is
      when Initial =>
			r_sequencer <= '0';
			w_sequencer <= '0';
      when Run =>
			r_sequencer <= '0';
			w_sequencer <= '0';
      when Read_Q =>
			r_sequencer <= '1';
			w_sequencer <= '0';
      when Write_Q =>
			r_sequencer <= '0';
			w_sequencer <= '1';
      when Stop =>
			r_sequencer <= '0';
			w_sequencer <= '0';
    end case;
  end process fetch_execute_output;

  -- Finally, the following code implements the counter that generates the T0-T7 sequence timing
  -- signals.
  current_state_t_counter : process(Reset, Clock)
  begin
		if (Reset = '1') then
			t_counter <="000" ;
		elsif (rising_edge(Clock)) then
			t_counter <= t_counter_next;
		end if;
  end process current_state_t_counter;

  next_state_t_counter : process (t_counter, Run_sig, Read_control, Write_control, Done,
                                 End_sig, Goto6, Wait_sig)
  begin
		if (Run_sig = '0') then
			t_counter_next <= t_counter;
		elsif (Run_sig = '1' and (Read_control = '1' or Write_control = '1')) then
			if (Done = '1') then
				if (End_sig = '1') then
					t_counter_next <= "000";
				else
					t_counter_next <= t_counter + "001";
				end if;
			else
				t_counter_next <= t_counter;
			end if;
		else
			if (Wait_sig = '1') then
				t_counter_next <= t_counter;
			else
				if (Goto6 = '1') then
					t_counter_next <= "110";
				else
					if (End_sig = '1') then
						t_counter_next <= "000";
					else
						t_counter_next <= t_counter + "001";
					end if;
				end if;
			end if;
		end if;
  end process next_state_t_counter;

  -- output logic for T0-T7 implement as concurrent signal assignments.
  t0 <= not t_counter(2) and not t_counter(1) and not t_counter(0);
  t1 <= not t_counter(2) and not t_counter(1) and     t_counter(0);
  t2 <= not t_counter(2) and     t_counter(1) and not t_counter(0);
  t3 <= not t_counter(2) and     t_counter(1) and     t_counter(0);
  t4 <=     t_counter(2) and not t_counter(1) and not t_counter(0);
  t5 <=     t_counter(2) and not t_counter(1) and     t_counter(0);
  t6 <=     t_counter(2) and     t_counter(1) and not t_counter(0);
  t7 <=     t_counter(2) and     t_counter(1) and     t_counter(0);
  
end rtl;

