vcom -2008 -work work {C:\Users\spenc\OneDrive\Documents\School\ECE 4435\Learning Activity 1 IR TB\testbench.vhd}

vsim work.testbench

add wave -position insertpoint  \
sim:/testbench/Reset \
sim:/testbench/Clock \
sim:/testbench/irin \
sim:/testbench/c1out \
sim:/testbench/c2out \
sim:/testbench/gra \
sim:/testbench/grb \
sim:/testbench/grc \
sim:/testbench/opcode \
sim:/testbench/register_select \
sim:/testbench/c3_2_downto_0 \
sim:/testbench/cpu_bus