vsim work.basicrisccputestbench

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_IR/register_Q

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_PC/register_Q

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_RegisterFile/register_Q

run 200000 ns
