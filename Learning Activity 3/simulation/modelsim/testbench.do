vcom -2008 -work work {C:/Users/spenc/OneDrive/Documents/School/ECE 4435/Learning Activity 3/TB/testbench.vhd}

vsim work.testbench

add wave -position insertpoint \
sim:/testbench/Reset \
sim:/testbench/Clock \
sim:/testbench/Ain \
sim:/testbench/Cin \
sim:/testbench/Cout \
sim:/testbench/add_op \
sim:/testbench/sub_op \
sim:/testbench/neg_op \
sim:/testbench/and_op \
sim:/testbench/or_op \
sim:/testbench/not_op \
sim:/testbench/shr_op \
sim:/testbench/shra_op \
sim:/testbench/shl_op \
sim:/testbench/shc_op \
sim:/testbench/CeqB_op \
sim:/testbench/incr4_op \
sim:/testbench/cpu_bus \
sim:/testbench/b2v_ALU0/A_Q \
sim:/testbench/b2v_ALU0/B \
sim:/testbench/b2v_ALU0/C \
sim:/testbench/b2v_ALU0/C_Q \
sim:/testbench/b2v_ALU0/C_D 
