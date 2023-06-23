vsim work.basicrisccputestbench

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/reset \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/start \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/clock \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_PC/Q \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_IR/Q \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_RegisterFile/RF(4) \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_RegisterFile/RF(3) \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_RegisterFile/RF(2) \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_RegisterFile/RF(1) \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/r \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/w \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_CPUMemoryInterface/memstrobe \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_CPUMemoryInterface/ma_contents \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_CPUMemoryInterface/Addr_Bus \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_CPUMemoryInterface/Data_Bus \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_CPUMemoryInterface/md_contents \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_CPUMemoryInterface/cpu_bus \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/wait_sig \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/done \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t0 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t1 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t2 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t3 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t4 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t5 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t6 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/t7 \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/b2v_Sequencer/t_counter \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_ControlUnit/b2v_Sequencer/current_state \
sim:/basicrisccputestbench/b2v_ram3/ram_contents(1) \
sim:/basicrisccputestbench/b2v_ram2/ram_contents(1) \
sim:/basicrisccputestbench/b2v_ram1/ram_contents(1) \
sim:/basicrisccputestbench/b2v_ram0/ram_contents(1)

run 25 us
