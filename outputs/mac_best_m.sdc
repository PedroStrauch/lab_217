# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.18-s043_1 on Thu Nov 12 17:02:17 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design mac

create_clock -name "clk" -period 4.2 -waveform {0.0 2.1} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports en]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n1[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {n2[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {out[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports cp]
set_output_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports cn]
set_max_fanout 8.000 [current_design]
set_input_transition 0.01 [get_ports clk]
set_input_transition 0.01 [get_ports rst]
set_input_transition 0.01 [get_ports en]
set_input_transition 0.01 [get_ports {n1[7]}]
set_input_transition 0.01 [get_ports {n1[6]}]
set_input_transition 0.01 [get_ports {n1[5]}]
set_input_transition 0.01 [get_ports {n1[4]}]
set_input_transition 0.01 [get_ports {n1[3]}]
set_input_transition 0.01 [get_ports {n1[2]}]
set_input_transition 0.01 [get_ports {n1[1]}]
set_input_transition 0.01 [get_ports {n1[0]}]
set_input_transition 0.01 [get_ports {n2[7]}]
set_input_transition 0.01 [get_ports {n2[6]}]
set_input_transition 0.01 [get_ports {n2[5]}]
set_input_transition 0.01 [get_ports {n2[4]}]
set_input_transition 0.01 [get_ports {n2[3]}]
set_input_transition 0.01 [get_ports {n2[2]}]
set_input_transition 0.01 [get_ports {n2[1]}]
set_input_transition 0.01 [get_ports {n2[0]}]
set_wire_load_mode "top"
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
