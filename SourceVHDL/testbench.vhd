LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE gate_level OF testbench IS 

  component full_adder_4 IS 
    PORT
      (
        cin :  IN  STD_LOGIC;
        a :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        b :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        cout :  OUT  STD_LOGIC;
        sum :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
  END component;

  signal a_tb :  STD_LOGIC_VECTOR(3 downto 0);
  signal b_tb :  STD_LOGIC_VECTOR(3 downto 0);
  signal cin_tb :  STD_LOGIC;
  signal cout_tb :  STD_LOGIC;
  signal sum_tb :  STD_LOGIC_VECTOR(3 downto 0);
  signal sum_expected :  STD_LOGIC_VECTOR(4 downto 0);

BEGIN 

  fa_4 : full_adder_4
    PORT MAP(
      a => a_tb,
      b => b_tb,
      cin => cin_tb,
      sum => sum_tb,
      cout => cout_tb
      );

  testbench_process : process
    variable a : integer := 0;
    variable b : integer := 0;
  begin
    cin_tb <= '0';
    for a in 0 to 15 loop
      a_tb <= std_logic_vector(to_unsigned(a,4));
      for b in 0 to 15 loop
        b_tb <= std_logic_vector(to_unsigned(b,4));
        wait for 5 ns;
        
        -- Compare actual and expected outputs.
        sum_expected <= std_logic_vector(to_unsigned((a+b),5));
        wait for 5 ns;
        
        assert ((cout_tb & sum_tb) = sum_expected)
          report "Incorrect sum: a = " & to_string(a) & " b = " & to_string(b)
          severity note;
        assert ((cout_tb & sum_tb) /= sum_expected)
          report "Correct sum: a = " & to_string(a) & " b = " & to_string(b)
          severity note;
        
      end loop;
    end loop;

    wait;
    
  end process testbench_process;

END gate_level;
