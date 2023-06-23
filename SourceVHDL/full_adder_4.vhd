-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Wed Dec 21 07:32:42 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY full_adder_4 IS 
  PORT
    (
      cin :  IN  STD_LOGIC;
      a :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      b :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      cout :  OUT  STD_LOGIC;
      sum :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
END full_adder_4;

ARCHITECTURE bdf_type OF full_adder_4 IS 

  COMPONENT full_adder_gate_level
    PORT(
      a : IN STD_LOGIC;
      b : IN STD_LOGIC;
      cin : IN STD_LOGIC;
      sum : OUT STD_LOGIC;
      cout : OUT STD_LOGIC
      );
  END COMPONENT;

  SIGNAL	cout_0 :  STD_LOGIC;
  SIGNAL	cout_1 :  STD_LOGIC;
  SIGNAL	cout_2 :  STD_LOGIC;

BEGIN 

  b2v_fa_0 : full_adder_gate_level
    PORT MAP(a => a(0),
             b => b(0),
             cin => cin,
             sum => sum(0),
             cout => cout_0);

  b2v_fa_1 : full_adder_gate_level
    PORT MAP(a => a(1),
             b => b(1),
             cin => cout_0,
             sum => sum(1),
             cout => cout_1);

  b2v_fa_2 : full_adder_gate_level
    PORT MAP(a => a(2),
             b => b(2),
             cin => cout_1,
             sum => sum(2),
             cout => cout_2);

  b2v_fa_3 : full_adder_gate_level
    PORT MAP(a => a(3),
             b => b(3),
             cin => cout_2,
             sum => sum(3),
             cout => cout);

END bdf_type;
