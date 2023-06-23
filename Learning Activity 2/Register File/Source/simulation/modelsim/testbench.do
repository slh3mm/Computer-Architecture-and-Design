vcom -2008 -work work {C:/Users/spenc/OneDrive/Documents/School/ECE 4435/Learning Activity 2/RF/Testbench/testbench.vhd}

vsim work.testbench

add wave -position insertpoint  \
sim:/testbench/Reset \
sim:/testbench/Clock \
sim:/testbench/register_select \
sim:/testbench/Rin \
sim:/testbench/Rout \
sim:/testbench/BAout \
sim:/testbench/cpu_bus \
sim:/testbench/cpu_bus_expected
