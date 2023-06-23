LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity opcode_decoder is
	port(
		opcode : in std_logic_vector(4 downto 0);
		nop_instr : out std_logic;
		ld_instr : out std_logic;
		ldr_instr : out std_logic;
		st_instr : out std_logic;
		str_instr : out std_logic;
		la_instr : out std_logic;
		lar_instr : out std_logic;
		br_instr : out std_logic;
		brl_instr : out std_logic;
		add_instr : out std_logic;
		addi_instr : out std_logic;
		sub_instr : out std_logic;
		neg_instr : out std_logic;
		and_instr : out std_logic;
		andi_instr : out std_logic;
		or_instr : out std_logic;
		ori_instr : out std_logic;
		not_instr : out std_logic;
		shr_instr : out std_logic;
		shra_instr : out std_logic;
		shl_instr : out std_logic;
		shc_instr : out std_logic;
		stop_instr : out std_logic	
	);
end opcode_decoder;

architecture rtl of opcode_decoder is
begin
	-- nop = 0
	nop_instr <= (not opcode(4)) and (not opcode(3)) and (not opcode(2)) and (not opcode(1)) and (not opcode(0));

	-- ld = 1
	ld_instr <= (not opcode(4)) and (not opcode(3)) and (not opcode(2)) and (not opcode(1)) and (opcode(0));
	
	-- ldr = 2
	ldr_instr <= (not opcode(4)) and (not opcode(3)) and (not opcode(2)) and (opcode(1)) and (not opcode(0));
	
	-- st = 3
	st_instr <= (not opcode(4)) and (not opcode(3)) and (not opcode(2)) and (opcode(1)) and (opcode(0));
	
	-- str = 4
	str_instr <= (not opcode(4)) and (not opcode(3)) and (opcode(2)) and (not opcode(1)) and (not opcode(0));
	
	-- la = 5
	la_instr <= (not opcode(4)) and (not opcode(3)) and (opcode(2)) and (not opcode(1)) and (opcode(0));
	
	-- lar = 6
	lar_instr <= (not opcode(4)) and (not opcode(3)) and (opcode(2)) and (opcode(1)) and (not opcode(0));
	
	-- br = 8
	br_instr <= (not opcode(4)) and (opcode(3)) and (not opcode(2)) and (not opcode(1)) and (not opcode(0));
	
	-- brl = 9
	brl_instr <= (not opcode(4)) and (opcode(3)) and (not opcode(2)) and (not opcode(1)) and (opcode(0));
	
	-- add = 12
	add_instr <= (not opcode(4)) and (opcode(3)) and (opcode(2)) and (not opcode(1)) and (not opcode(0));
	
	-- addi = 13
	addi_instr <= (not opcode(4)) and (opcode(3)) and (opcode(2)) and (not opcode(1)) and (opcode(0));
	
	-- sub = 14
	sub_instr <= (not opcode(4)) and (opcode(3)) and (opcode(2)) and (opcode(1)) and (not opcode(0));
	
	-- neg = 15
	neg_instr <= (not opcode(4)) and (opcode(3)) and (opcode(2)) and (opcode(1)) and (opcode(0));
	
	-- and = 20
	and_instr <= (opcode(4)) and (not opcode(3)) and (opcode(2)) and (not opcode(1)) and (not opcode(0));
	
	-- andi = 21
	andi_instr <= (opcode(4)) and (not opcode(3)) and (opcode(2)) and (not opcode(1)) and (opcode(0));
	
	-- or = 22
	or_instr <= (opcode(4)) and (not opcode(3)) and (opcode(2)) and (opcode(1)) and (not opcode(0));
	
	-- ori = 23
	ori_instr <= (opcode(4)) and (not opcode(3)) and (opcode(2)) and (opcode(1)) and (opcode(0));
	
	-- not = 24
	not_instr <= (opcode(4)) and (opcode(3)) and (not opcode(2)) and (not opcode(1)) and (not opcode(0));
	
	-- shr = 26
	shr_instr <= (opcode(4)) and (opcode(3)) and (not opcode(2)) and (opcode(1)) and (not opcode(0));
	
	-- shra = 27
	shra_instr <= (opcode(4)) and (opcode(3)) and (not opcode(2)) and (opcode(1)) and (opcode(0));
	
	-- shl = 28
	shl_instr <= (opcode(4)) and (opcode(3)) and (opcode(2)) and (not opcode(1)) and (not opcode(0));
	
	-- shc = 29
	shc_instr <= (opcode(4)) and (opcode(3)) and (opcode(2)) and (not opcode(1)) and (opcode(0));
	
	-- stop = 31
	stop_instr <= (opcode(4)) and (opcode(3)) and (opcode(2)) and (opcode(1)) and (opcode(0));
	
end rtl;