transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/spenc/OneDrive/Documents/School/ECE 4435/Learning Activity 4/opcode_decoder.vhd}
vcom -2008 -work work {C:/Users/spenc/OneDrive/Documents/School/ECE 4435/Learning Activity 4/control_signals_logic.vhd}

