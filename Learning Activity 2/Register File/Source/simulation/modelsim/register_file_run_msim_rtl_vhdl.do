transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/spenc/OneDrive/Documents/School/ECE 4435/Learning Activity 2/RF/Source/register_file.vhd}

