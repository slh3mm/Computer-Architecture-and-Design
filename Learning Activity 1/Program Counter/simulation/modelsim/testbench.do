vcom -2008 -work work {C:\Users\spenc\OneDrive\Documents\School\ECE 4435\Learning Activity 1 TB\testbench.vhd}

vsim work.testbench

add wave -position insertpoint  \
sim:/testbench/Reset \
sim:/testbench/Clock \
sim:/testbench/pcin \
sim:/testbench/pcout \
sim:/testbench/cpu_bus \
sim:/testbench/cpu_bus_expected