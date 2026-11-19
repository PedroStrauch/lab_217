set sdc_version 2.1
##############################################################
###VARIABLES
# @TODO: set here your clock period in ns
set period_clock 4.2
set in_delay 0.1
set out_delay 0.1
set in_transition 0.01
set clock_uncertainty 0.1
set clock_latency 0.05
###############################################################
### CLOCK
# @TODO: set the name of your clock signal in the get_ports argument
create_clock -name {clk} -period $period_clock [get_ports {clk}]
set_input_transition -rise $in_transition [all_inputs]
set_input_transition -fall $in_transition [all_inputs]

set_input_delay  -clock clk $in_delay [all_inputs]
set_output_delay -clock clk $out_delay [all_outputs]

set_clock_uncertainty $clock_uncertainty clk
set_max_fanout 8 [current_design]
