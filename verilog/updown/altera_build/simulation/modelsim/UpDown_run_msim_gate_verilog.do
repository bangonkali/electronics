transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {UpDown.vo}

vlog -vlog01compat -work work +incdir+D:/Data/Project/Electronics/electronics/verilog/updown/altera_build {D:/Data/Project/Electronics/electronics/verilog/updown/altera_build/UpDown_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  UpDown_tb

add wave *
view structure
view signals
run -all
