LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY testbench IS 
END testbench;

ARCHITECTURE behavioral OF testbench IS 

  component control_signals_logic is
    port(
      opcode : in std_logic_vector(4 downto 0);
      t0 : in std_logic;
      t1 : in std_logic;
      t2 : in std_logic;
      t3 : in std_logic;
      t4 : in std_logic;
      t5 : in std_logic;
      t6 : in std_logic;
      t7 : in std_logic;
      neq0      : in  std_logic;
      con       : in  std_logic;
      irin      : out std_logic;
      c1out     : out std_logic;
      c2out     : out std_logic;
      gra       : out std_logic;
      grb       : out std_logic;
      grc       : out std_logic;
      main      : out std_logic;
      mdbus     : out std_logic;
      mdrd      : out std_logic;
      mdout     : out std_logic;
      pcin      : out std_logic;
      pcout     : out std_logic;
      ain       : out std_logic;
      cin       : out std_logic;
      cout      : out std_logic;
      add_op    : out std_logic;
      sub_op    : out std_logic;
      neg_op    : out std_logic;
      and_op    : out std_logic;
      or_op     : out std_logic;
      not_op    : out std_logic;
      shr_op    : out std_logic;
      shra_op   : out std_logic;
      shl_op    : out std_logic;
      shc_op    : out std_logic;
      ceqb_op   : out std_logic;
      incr4_op  : out std_logic;
	  xor_op	: out std_logic;
      baout     : out std_logic;
      rin       : out std_logic;
      rout      : out std_logic;
      end_sig   : out std_logic;
      stop_sig  : out std_logic;
      read_control  : out std_logic;
      write_control : out std_logic;
      wait_sig  : out std_logic;
      goto6 	 : out std_logic;
      conin     : out std_logic;
      ld_shift  : out std_logic;
      decr      : out std_logic
      );
  END COMPONENT;

  signal opcode_tb : std_logic_vector(4 downto 0);
  signal t0_tb : std_logic;
  signal t1_tb : std_logic;
  signal t2_tb : std_logic;
  signal t3_tb : std_logic;
  signal t4_tb : std_logic;
  signal t5_tb : std_logic;
  signal t6_tb : std_logic;
  signal t7_tb : std_logic;
  signal neq0_tb : std_logic;
  signal con_tb : std_logic;
  signal irin_tb : std_logic;
  signal c1out_tb : std_logic;
  signal c2out_tb : std_logic;
  signal gra_tb : std_logic;
  signal grb_tb : std_logic;
  signal grc_tb : std_logic;
  signal main_tb : std_logic;
  signal mdbus_tb : std_logic;
  signal mdrd_tb : std_logic;
  signal mdout_tb : std_logic;
  signal pcin_tb : std_logic;
  signal pcout_tb : std_logic;
  signal ain_tb : std_logic;
  signal cin_tb : std_logic;
  signal cout_tb : std_logic;
  signal add_op_tb : std_logic;
  signal sub_op_tb : std_logic;
  signal neg_op_tb : std_logic;
  signal and_op_tb : std_logic;
  signal or_op_tb : std_logic;
  signal not_op_tb : std_logic;
  signal shr_op_tb : std_logic;
  signal shra_op_tb : std_logic;
  signal shl_op_tb : std_logic;
  signal shc_op_tb : std_logic;
  signal ceqb_op_tb : std_logic;
  signal incr4_op_tb : std_logic;
  signal xor_op_tb	: std_logic;
  signal baout_tb : std_logic;
  signal rin_tb : std_logic;
  signal rout_tb : std_logic;
  signal end_sig_tb : std_logic;
  signal stop_sig_tb : std_logic;
  signal read_control_tb : std_logic;
  signal write_control_tb : std_logic;
  signal wait_sig_tb : std_logic;
  signal goto6_tb : std_logic;
  signal conin_tb : std_logic;
  signal ld_shift_tb : std_logic;
  signal decr_tb : std_logic;

  signal irin_exptd : std_logic;
  signal c1out_exptd : std_logic;
  signal c2out_exptd : std_logic;
  signal gra_exptd : std_logic;
  signal grb_exptd : std_logic;
  signal grc_exptd : std_logic;
  signal main_exptd : std_logic;
  signal mdbus_exptd : std_logic;
  signal mdrd_exptd : std_logic;
  signal mdout_exptd : std_logic;
  signal pcin_exptd : std_logic;
  signal pcout_exptd : std_logic;
  signal ain_exptd : std_logic;
  signal cin_exptd : std_logic;
  signal cout_exptd : std_logic;
  signal add_op_exptd : std_logic;
  signal sub_op_exptd : std_logic;
  signal neg_op_exptd : std_logic;
  signal and_op_exptd : std_logic;
  signal or_op_exptd : std_logic;
  signal not_op_exptd : std_logic;
  signal shr_op_exptd : std_logic;
  signal shra_op_exptd : std_logic;
  signal shl_op_exptd : std_logic;
  signal shc_op_exptd : std_logic;
  signal ceqb_op_exptd : std_logic;
  signal incr4_op_exptd : std_logic;
  signal xor_op_exptd	: std_logic;
  signal baout_exptd : std_logic;
  signal rin_exptd : std_logic;
  signal rout_exptd : std_logic;
  signal end_sig_exptd : std_logic;
  signal stop_sig_exptd : std_logic;
  signal read_control_exptd : std_logic;
  signal write_control_exptd : std_logic;
  signal wait_sig_exptd : std_logic;
  signal goto6_exptd : std_logic;
  signal conin_exptd : std_logic;
  signal ld_shift_exptd : std_logic;
  signal decr_exptd : std_logic;

BEGIN 

  csl_0 : control_signals_logic
    PORT map (
      opcode => opcode_tb,
      t0 => t0_tb,
      t1 => t1_tb,
      t2 => t2_tb,
      t3 => t3_tb,
      t4 => t4_tb,
      t5 => t5_tb,
      t6 => t6_tb,
      t7 => t7_tb,
      neq0 => neq0_tb,
      con => con_tb,
      irin      => irin_tb,
      c1out     => c1out_tb,
      c2out     => c2out_tb,
      gra       => gra_tb,
      grb       => grb_tb,
      grc       => grc_tb,
      main      => main_tb,
      mdbus     => mdbus_tb,
      mdrd      => mdrd_tb,
      mdout     => mdout_tb,
      pcin      => pcin_tb,
      pcout     => pcout_tb,
      ain       => ain_tb,
      cin       => cin_tb,
      cout      => cout_tb,
      add_op    => add_op_tb,
      sub_op    => sub_op_tb,
      neg_op    => neg_op_tb,
      and_op    => and_op_tb,
      or_op     => or_op_tb,
      not_op    => not_op_tb,
      shr_op    => shr_op_tb,
      shra_op   => shra_op_tb,
      shl_op    => shl_op_tb,
      shc_op    => shc_op_tb,
      ceqb_op   => ceqb_op_tb,
      incr4_op  => incr4_op_tb,
	  xor_op	=> xor_op_tb,
      baout     => baout_tb,
      rin       => rin_tb,
      rout      => rout_tb,
      end_sig => end_sig_tb,
      stop_sig => stop_sig_tb,
      read_control => read_control_tb,
      write_control => write_control_tb,
      wait_sig => wait_sig_tb,
      goto6 => goto6_tb,
      conin     => conin_tb,
      ld_shift      => ld_shift_tb,
      decr => decr_tb
      );

  testbench_process : process
    variable NumberOfErrors : integer := 0;
  begin
    -- Initialize all inputs signals to inactive values
    opcode_tb <= "00000";
    t0_tb <= '0';
    t1_tb <= '0';
    t2_tb <= '0';
    t3_tb <= '0';
    t4_tb <= '0';
    t5_tb <= '0';
    t6_tb <= '0';
    t7_tb <= '0';
    neq0_tb <= '0';
    con_tb <= '0';

    irin_exptd <= '0';
    c1out_exptd <= '0';
    c2out_exptd <= '0';
    gra_exptd <= '0';
    grb_exptd <= '0';
    grc_exptd <= '0';
    main_exptd <= '0';
    mdbus_exptd <= '0';
    mdrd_exptd <= '0';
    mdout_exptd <= '0';
    pcin_exptd <= '0';
    pcout_exptd <= '0';
    ain_exptd <= '0';
    cin_exptd <= '0';
    cout_exptd <= '0';
    add_op_exptd <= '0';
    sub_op_exptd <= '0';
    neg_op_exptd <= '0';
    and_op_exptd <= '0';
    or_op_exptd <= '0';
    not_op_exptd <= '0';
    shr_op_exptd <= '0';
    shra_op_exptd <= '0';
    shl_op_exptd <= '0';
    shc_op_exptd <= '0';
    ceqb_op_exptd <= '0';
    incr4_op_exptd <= '0';
	xor_op_exptd <= '0';
    baout_exptd <= '0';
    rin_exptd <= '0';
    rout_exptd <= '0';
    end_sig_exptd <= '0';
    stop_sig_exptd <= '0';
    read_control_exptd <= '0';
    write_control_exptd <= '0';
    wait_sig_exptd <= '0';
    goto6_exptd <= '0';
    conin_exptd <= '0';
    ld_shift_exptd <= '0';
    decr_exptd <= '0';
    
    -- Begin by verifying fetch micro-instructions
    t0_tb <= '1';
    pcout_exptd <= '1';
    main_exptd <= '1';
    cin_exptd <= '1';
    incr4_op_exptd <= '1';
    wait for 100 ns;
    
    if (pcout_tb /= pcout_exptd) then
      assert false report "Failed test 1" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (main_tb /= main_exptd) then
      assert false report "Failed test 2" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 3" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (incr4_op_tb /= incr4_op_exptd) then
      assert false report "Failed test 4" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t0_tb <= '0';
    pcout_exptd <= '0';
    main_exptd <= '0';
    cin_exptd <= '0';
    incr4_op_exptd <= '0';

    t1_tb <= '1';
    wait_sig_exptd <= '1';
    pcin_exptd <= '1';
    mdrd_exptd <= '1';
    cout_exptd <= '1';    
    wait for 100 ns;
    
    if (wait_sig_tb /= wait_sig_exptd) then
      assert false report "Failed test 5" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (pcin_tb /= pcin_exptd) then
      assert false report "Failed test 6" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (mdrd_tb /= mdrd_exptd) then
      assert false report "Failed test 7" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 8" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t1_tb <= '0';
    wait_sig_exptd <= '0';
    pcin_exptd <= '0';
    mdrd_exptd <= '0';
    cout_exptd <= '0';

    t2_tb <= '1';
    mdout_exptd <= '1';
    irin_exptd <= '1';
    wait for 100 ns;
    
    if (mdout_tb /= mdout_exptd) then
      assert false report "Failed test 9" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (irin_tb /= irin_exptd) then
      assert false report "Failed test 10" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t2_tb <= '0';
    mdout_exptd <= '0';
    irin_exptd <= '0';

    -- Opcode = 0
    t3_tb <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 11" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;
    
    -- Opcode = 1
    opcode_tb <= "00001";
    t3_tb <= '1';
    baout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (baout_tb /= baout_exptd) then
      assert false report "Failed test 12" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 13" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 14" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    baout_exptd <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c2out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c2out_tb /= c2out_exptd) then
      assert false report "Failed test 15" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 16" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 17" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c2out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    main_exptd <= '1';
    cout_exptd <= '1';
    wait for 100 ns;

    if (main_tb /= main_exptd) then
      assert false report "Failed test 18" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 19" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    main_exptd <= '0';
    cout_exptd <= '0';

    t6_tb <= '1';
    read_control_exptd <= '1';
    wait_sig_exptd <= '1';
    mdrd_exptd <= '1';
    wait for 100 ns;

    if (read_control_tb /= read_control_exptd) then
      assert false report "Failed test 20" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (wait_sig_tb /= wait_sig_exptd) then
      assert false report "Failed test 21" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (mdrd_tb /= mdrd_exptd) then
      assert false report "Failed test 22" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    read_control_exptd <= '0';
    wait_sig_exptd <= '0';
    mdrd_exptd <= '0';

    t7_tb <= '1';
    mdout_exptd <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (mdout_tb /= mdout_exptd) then
      assert false report "Failed test 23" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 24" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 25" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 26" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    mdout_exptd <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 2
    opcode_tb <= "00010";
    t3_tb <= '1';
    pcout_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (pcout_tb /= pcout_exptd) then
      assert false report "Failed test 27" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 28" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    pcout_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c1out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 29" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 30" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 31" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c1out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    main_exptd <= '1';
    cout_exptd <= '1';
    wait for 100 ns;

    if (main_tb /= main_exptd) then
      assert false report "Failed test 32" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 33" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    main_exptd <= '0';
    cout_exptd <= '0';

    t6_tb <= '1';
    read_control_exptd <= '1';
    wait_sig_exptd <= '1';
    mdrd_exptd <= '1';
    wait for 100 ns;

    if (read_control_tb /= read_control_exptd) then
      assert false report "Failed test 34" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (wait_sig_tb /= wait_sig_exptd) then
      assert false report "Failed test 35" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (mdrd_tb /= mdrd_exptd) then
      assert false report "Failed test 36" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    read_control_exptd <= '0';
    wait_sig_exptd <= '0';
    mdrd_exptd <= '0';

    t7_tb <= '1';
    mdout_exptd <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (mdout_tb /= mdout_exptd) then
      assert false report "Failed test 37" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 38" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 39" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 40" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    mdout_exptd <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 3
    opcode_tb <= "00011";
    t3_tb <= '1';
    baout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (baout_tb /= baout_exptd) then
      assert false report "Failed test 41" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 42" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 43" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    baout_exptd <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c2out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c2out_tb /= c2out_exptd) then
      assert false report "Failed test 44" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 45" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 46" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c2out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    main_exptd <= '1';
    cout_exptd <= '1';
    wait for 100 ns;

    if (main_tb /= main_exptd) then
      assert false report "Failed test 47" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 48" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    main_exptd <= '0';
    cout_exptd <= '0';

    t6_tb <= '1';
    rout_exptd <= '1';
    gra_exptd <= '1';
    mdbus_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 49" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 50" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (mdbus_tb /= mdbus_exptd) then
      assert false report "Failed test 51" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    rout_exptd <= '0';
    gra_exptd <= '0';
    mdbus_exptd <= '0';

    t7_tb <= '1';
    write_control_exptd <= '1';
    wait_sig_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (write_control_tb /= write_control_exptd) then
      assert false report "Failed test 52" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (wait_sig_tb /= wait_sig_exptd) then
      assert false report "Failed test 53" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 54" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    write_control_exptd <= '0';
    wait_sig_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 4
    opcode_tb <= "00100";
    t3_tb <= '1';
    pcout_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (pcout_tb /= pcout_exptd) then
      assert false report "Failed test 55" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 56" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    pcout_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c1out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 57" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 58" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 59" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c1out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    main_exptd <= '1';
    cout_exptd <= '1';
    wait for 100 ns;

    if (main_tb /= main_exptd) then
      assert false report "Failed test 60" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 61" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    main_exptd <= '0';
    cout_exptd <= '0';

    t6_tb <= '1';
    rout_exptd <= '1';
    gra_exptd <= '1';
    mdbus_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 62" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 63" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (mdbus_tb /= mdbus_exptd) then
      assert false report "Failed test 64" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    rout_exptd <= '0';
    gra_exptd <= '0';
    mdbus_exptd <= '0';

    t7_tb <= '1';
    write_control_exptd <= '1';
    wait_sig_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (write_control_tb /= write_control_exptd) then
      assert false report "Failed test 65" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (wait_sig_tb /= wait_sig_exptd) then
      assert false report "Failed test 66" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 67" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    write_control_exptd <= '0';
    wait_sig_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 5
    opcode_tb <= "00101";
    t3_tb <= '1';
    baout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (baout_tb /= baout_exptd) then
      assert false report "Failed test 68" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 69" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 70" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    baout_exptd <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c2out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c2out_tb /= c2out_exptd) then
      assert false report "Failed test 71" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 72" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 73" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c2out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 74" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 75" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 76" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 6
    opcode_tb <= "00110";
    t3_tb <= '1';
    pcout_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (pcout_tb /= pcout_exptd) then
      assert false report "Failed test 77" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 78" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    pcout_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c1out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 79" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 80" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 81" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c1out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 82" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 83" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 84" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 8
    opcode_tb <= "01000";
    t3_tb <= '1';
    rout_exptd <= '1';
    grc_exptd <= '1';
    conin_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 85" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 86" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (conin_tb /= conin_exptd) then
      assert false report "Failed test 87" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    conin_exptd <= '0';

    -- The following signals are conditioned on the value of con.  So, first
    -- test them for con = '1'.
    t4_tb <= '1';
    pcin_exptd <= '1';
    rout_exptd <= '1';
    end_sig_exptd <= '1';
    con_tb <= '1';
    wait for 100 ns;

    if (pcin_tb /= pcin_exptd) then
      assert false report "Failed test 88" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 89" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 90" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Then test them for con = '0'.
    pcin_exptd <= '0';
    rout_exptd <= '0';
    con_tb <= '0';
    wait for 100 ns;

    if (pcin_tb /= pcin_exptd) then
      assert false report "Failed test 91" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 92" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 9
    opcode_tb <= "01001";
    t3_tb <= '1';
    pcout_exptd <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    wait for 100 ns;

    if (pcout_tb /= pcout_exptd) then
      assert false report "Failed test 93" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 94" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 95" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    pcout_exptd <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';

    t4_tb <= '1';
    rout_exptd <= '1';
    grc_exptd <= '1';
    conin_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 96" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 97" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (conin_tb /= conin_exptd) then
      assert false report "Failed test 98" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    conin_exptd <= '0';

    -- The following signals are conditioned on the value of con.  So, first
    -- test them for con = '1'.
    t5_tb <= '1';
    pcin_exptd <= '1';
    rout_exptd <= '1';
    end_sig_exptd <= '1';
    con_tb <= '1';
    wait for 100 ns;

    if (pcin_tb /= pcin_exptd) then
      assert false report "Failed test 99" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 100" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 101" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Then test them for con = '0'.
    pcin_exptd <= '0';
    rout_exptd <= '0';
    con_tb <= '0';
    wait for 100 ns;
    
    if (pcin_tb /= pcin_exptd) then
      assert false report "Failed test 102" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 103" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 12
    opcode_tb <= "01100";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 104" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 105" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 106" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    grc_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 107" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 108" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 109" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 110" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 111" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 112" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 113" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 114" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 13
    opcode_tb <= "01101";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 115" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 116" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 117" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c2out_exptd <= '1';
    cin_exptd <= '1';
    add_op_exptd <= '1';
    wait for 100 ns;

    if (c2out_tb /= c2out_exptd) then
      assert false report "Failed test 118" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 119" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (add_op_tb /= add_op_exptd) then
      assert false report "Failed test 120" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c2out_exptd <= '0';
    cin_exptd <= '0';
    add_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 121" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 122" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 123" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 124" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 14
    opcode_tb <= "01110";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 125" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 126" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 127" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    grc_exptd <= '1';
    cin_exptd <= '1';
    sub_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 128" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 129" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 130" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (sub_op_tb /= sub_op_exptd) then
      assert false report "Failed test 131" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    sub_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 132" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 133" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 134" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 135" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 15
    opcode_tb <= "01111";
    t3_tb <= '1';
    rout_exptd <= '1';
    grc_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 136" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 137" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';

    t4_tb <= '1';
    cin_exptd <= '1';
    neg_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 138" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 139" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 140" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (neg_op_tb /= neg_op_exptd) then
      assert false report "Failed test 141" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    neg_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 142" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 143" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 144" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 145" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 20
    opcode_tb <= "10100";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 146" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 147" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 148" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    grc_exptd <= '1';
    cin_exptd <= '1';
    and_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 149" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 150" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 151" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (and_op_tb /= and_op_exptd) then
      assert false report "Failed test 152" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    and_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 153" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 154" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 155" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 156" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;
	
	-- Opcode = 19
    opcode_tb <= "10011";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test xor 1" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test xor 2" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test xor 3" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    grc_exptd <= '1';
    cin_exptd <= '1';
    xor_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test xor 4" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test xor 5" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test xor 6" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (xor_op_tb /= xor_op_exptd) then
      assert false report "Failed test xor 7" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    xor_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test xor 8" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test xor 9" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test xor 10" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test xor 11" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 21
    opcode_tb <= "10101";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 157" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 158" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 159" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c2out_exptd <= '1';
    cin_exptd <= '1';
    and_op_exptd <= '1';
    wait for 100 ns;

    if (c2out_tb /= c2out_exptd) then
      assert false report "Failed test 160" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 161" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (and_op_tb /= and_op_exptd) then
      assert false report "Failed test 162" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c2out_exptd <= '0';
    cin_exptd <= '0';
    and_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 163" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 164" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 165" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 166" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 22
    opcode_tb <= "10110";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 167" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 168" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 169" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    grc_exptd <= '1';
    cin_exptd <= '1';
    or_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 170" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 171" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 172" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (or_op_tb /= or_op_exptd) then
      assert false report "Failed test 173" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    or_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 174" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 175" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 176" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 177" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 23
    opcode_tb <= "10111";
    t3_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    ain_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 178" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 179" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ain_tb /= ain_exptd) then
      assert false report "Failed test 180" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    ain_exptd <= '0';

    t4_tb <= '1';
    c2out_exptd <= '1';
    cin_exptd <= '1';
    or_op_exptd <= '1';
    wait for 100 ns;

    if (c2out_tb /= c2out_exptd) then
      assert false report "Failed test 181" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 182" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (or_op_tb /= or_op_exptd) then
      assert false report "Failed test 183" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    c2out_exptd <= '0';
    cin_exptd <= '0';
    or_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 184" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 185" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 186" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 187" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 24
    opcode_tb <= "11000";
    t3_tb <= '1';
    rout_exptd <= '1';
    grc_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 188" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 189" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';

    t4_tb <= '1';
    cin_exptd <= '1';
    not_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 190" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 191" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 192" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (not_op_tb /= not_op_exptd) then
      assert false report "Failed test 193" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    cin_exptd <= '0';
    not_op_exptd <= '0';

    t5_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 194" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 195" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 196" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 197" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 26
    opcode_tb <= "11010";
    t3_tb <= '1';
    c1out_exptd <= '1';
    ld_shift_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 198" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 199" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    c1out_exptd <= '0';
    ld_shift_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '0'.
    t4_tb <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 200" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 201" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 202" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '1'.
    rout_exptd <= '1';
    grc_exptd <= '1';
    ld_shift_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;
    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 203" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 204" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 205" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    ld_shift_exptd <= '0';
    neq0_tb <= '0';

    t5_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    cin_exptd <= '1';
    ceqb_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 206" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 207" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 208" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ceqb_op_tb /= ceqb_op_exptd) then
      assert false report "Failed test 209" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    cin_exptd <= '0';
    ceqb_op_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '1'.
    t6_tb <= '1';
    shr_op_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 210" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 211" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 212" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 213" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shr_op_tb /= shr_op_exptd) then
      assert false report "Failed test 214" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '0'.
    neq0_tb <= '0';
    cin_exptd <= '1';
    cout_exptd <= '1';
    decr_exptd <= '1';
    goto6_exptd <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 215" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 216" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 217" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 218" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shr_op_tb /= shr_op_exptd) then
      assert false report "Failed test 219" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    cin_exptd <= '0';
    cout_exptd <= '0';
    decr_exptd <= '0';
    goto6_exptd <= '0';
    shr_op_exptd <= '0';

    t7_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 220" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 221" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 222" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 223" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 27
    opcode_tb <= "11011";
    t3_tb <= '1';
    c1out_exptd <= '1';
    ld_shift_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 223" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 224" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    c1out_exptd <= '0';
    ld_shift_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '0'.
    t4_tb <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 225" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 226" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 227" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '1'.
    rout_exptd <= '1';
    grc_exptd <= '1';
    ld_shift_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;
    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 228" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 229" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 230" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    ld_shift_exptd <= '0';
    neq0_tb <= '0';

    t5_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    cin_exptd <= '1';
    ceqb_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 231" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 232" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 233" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ceqb_op_tb /= ceqb_op_exptd) then
      assert false report "Failed test 234" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    cin_exptd <= '0';
    ceqb_op_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '1'.
    t6_tb <= '1';
    shra_op_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 235" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 236" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 237" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 238" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shra_op_tb /= shra_op_exptd) then
      assert false report "Failed test 239" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '0'.
    neq0_tb <= '0';
    cin_exptd <= '1';
    cout_exptd <= '1';
    decr_exptd <= '1';
    goto6_exptd <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 240" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 241" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 242" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 243" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shra_op_tb /= shra_op_exptd) then
      assert false report "Failed test 244" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    cin_exptd <= '0';
    cout_exptd <= '0';
    decr_exptd <= '0';
    goto6_exptd <= '0';
    shra_op_exptd <= '0';

    t7_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 245" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 246" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 247" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 248" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 28
    opcode_tb <= "11100";
    t3_tb <= '1';
    c1out_exptd <= '1';
    ld_shift_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 249" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 250" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    c1out_exptd <= '0';
    ld_shift_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '0'.
    t4_tb <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 251" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 252" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 253" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '1'.
    rout_exptd <= '1';
    grc_exptd <= '1';
    ld_shift_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;
    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 254" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 255" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 256" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    ld_shift_exptd <= '0';
    neq0_tb <= '0';

    t5_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    cin_exptd <= '1';
    ceqb_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 257" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 258" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 259" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ceqb_op_tb /= ceqb_op_exptd) then
      assert false report "Failed test 260" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    cin_exptd <= '0';
    ceqb_op_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '1'.
    t6_tb <= '1';
    shl_op_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 261" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 262" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 263" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 264" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shl_op_tb /= shl_op_exptd) then
      assert false report "Failed test 265" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '0'.
    neq0_tb <= '0';
    cin_exptd <= '1';
    cout_exptd <= '1';
    decr_exptd <= '1';
    goto6_exptd <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 266" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 267" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 268" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 269" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shl_op_tb /= shl_op_exptd) then
      assert false report "Failed test 270" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    cin_exptd <= '0';
    cout_exptd <= '0';
    decr_exptd <= '0';
    goto6_exptd <= '0';
    shl_op_exptd <= '0';

    t7_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 271" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 272" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 273" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 274" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 29
    opcode_tb <= "11101";
    t3_tb <= '1';
    c1out_exptd <= '1';
    ld_shift_exptd <= '1';
    wait for 100 ns;

    if (c1out_tb /= c1out_exptd) then
      assert false report "Failed test 275" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 276" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    c1out_exptd <= '0';
    ld_shift_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '0'.
    t4_tb <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 277" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 278" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 279" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '1'.
    rout_exptd <= '1';
    grc_exptd <= '1';
    ld_shift_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;
    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 280" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grc_tb /= grc_exptd) then
      assert false report "Failed test 281" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ld_shift_tb /= ld_shift_exptd) then
      assert false report "Failed test 282" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t4_tb <= '0';
    rout_exptd <= '0';
    grc_exptd <= '0';
    ld_shift_exptd <= '0';
    neq0_tb <= '0';

    t5_tb <= '1';
    rout_exptd <= '1';
    grb_exptd <= '1';
    cin_exptd <= '1';
    ceqb_op_exptd <= '1';
    wait for 100 ns;

    if (rout_tb /= rout_exptd) then
      assert false report "Failed test 283" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (grb_tb /= grb_exptd) then
      assert false report "Failed test 284" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 285" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (ceqb_op_tb /= ceqb_op_exptd) then
      assert false report "Failed test 286" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t5_tb <= '0';
    rout_exptd <= '0';
    grb_exptd <= '0';
    cin_exptd <= '0';
    ceqb_op_exptd <= '0';

    -- The following signals are conditioned on the value of neq0.  So, first
    -- test them for neq0 = '1'.
    t6_tb <= '1';
    shc_op_exptd <= '1';
    neq0_tb <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 287" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 288" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 289" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 290" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shc_op_tb /= shc_op_exptd) then
      assert false report "Failed test 291" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    -- Now test them for neq0 = '0'.
    neq0_tb <= '0';
    cin_exptd <= '1';
    cout_exptd <= '1';
    decr_exptd <= '1';
    goto6_exptd <= '1';
    wait for 100 ns;

    if (cin_tb /= cin_exptd) then
      assert false report "Failed test 292" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 293" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (decr_tb /= decr_exptd) then
      assert false report "Failed test 294" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (goto6_tb /= goto6_exptd) then
      assert false report "Failed test 295" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (shc_op_tb /= shc_op_exptd) then
      assert false report "Failed test 296" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t6_tb <= '0';
    cin_exptd <= '0';
    cout_exptd <= '0';
    decr_exptd <= '0';
    goto6_exptd <= '0';
    shc_op_exptd <= '0';

    t7_tb <= '1';
    rin_exptd <= '1';
    gra_exptd <= '1';
    cout_exptd <= '1';
    end_sig_exptd <= '1';
    wait for 100 ns;

    if (rin_tb /= rin_exptd) then
      assert false report "Failed test 297" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (gra_tb /= gra_exptd) then
      assert false report "Failed test 298" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (cout_tb /= cout_exptd) then
      assert false report "Failed test 299" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    if (end_sig_tb /= end_sig_exptd) then
      assert false report "Failed test 300" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t7_tb <= '0';
    rin_exptd <= '0';
    gra_exptd <= '0';
    cout_exptd <= '0';
    end_sig_exptd <= '0';
    wait for 100 ns;

    -- Opcode = 31
    opcode_tb <= "11111";
    t3_tb <= '1';
    stop_sig_exptd <= '1';
    wait for 100 ns;

    if (stop_sig_tb /= stop_sig_exptd) then
      assert false report "Failed test 301" severity note;
      NumberOfErrors := NumberOfErrors + 1;
    end if;

    t3_tb <= '0';
    stop_sig_exptd <= '0';
    wait for 100 ns;

    assert false report "Number of errors = " & to_string(NumberOfErrors) severity note;
    
    wait;
  end process testbench_process;

END behavioral;