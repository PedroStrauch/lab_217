check_design -unresolved -undriven    > $_REPORTS_PATH/${DESIGN}_check_design.rpt
check_design -multiple_driver        >> $_REPORTS_PATH/${DESIGN}_check_design.rpt

init_design
####################################################################
## Constraints Setup
####################################################################

# Ler constraints de timing (SDC)
read_sdc $CONSTR_PATH/${DESIGN}.sdc


####################################################################
## Synthesis
####################################################################

# Configurar esforço de síntese
set_db syn_generic_effort medium
set_db syn_map_effort     medium
set_db syn_opt_effort     medium

# Síntese genérica (tecnologia independente)
syn_generic
write_snapshot -outdir $_REPORTS_PATH -tag generic
report_summary -directory $_REPORTS_PATH

# Mapeamento para células da biblioteca
syn_map
write_snapshot -outdir $_REPORTS_PATH -tag mapped
report_summary -directory $_REPORTS_PATH
# Escrever arquivo lec de verificação pós mapeamento
write_do_lec -golden_design rtl -revised_design fv_map > $_OUTPUTS_PATH/${DESIGN}_rtl_to_fv_map.tcl

####################################################################
## Reports PRE-DFT  (antes da inserção da scan chain)
####################################################################
report_area                      >  $_REPORTS_PATH/${DESIGN}_pre_dft_area.rpt
report_timing                    >  $_REPORTS_PATH/${DESIGN}_pre_dft_timing.rpt
report_power                     >  $_REPORTS_PATH/${DESIGN}_pre_dft_power.rpt
report_port [get_db ports .name] >  $_REPORTS_PATH/${DESIGN}_pre_dft_ports.rpt

################## Scan Chains ###################################
# DFT: Scan-Chain insertion 
#check_dft_rules > $_REPORTS_PATH/DFT_${DESIGN}_check_dft_rules.rpt
#convert_to_scan
#connect_scan_chains $DESIGN -auto_create_chain


###################################################################
## Incremental Synthesis
###################################################################
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag final
write_db db_${DESIGN}.db
report_summary -directory $_REPORTS_PATH

####################################################################
## Reports POST-DFT
####################################################################
report_area                      >  $_REPORTS_PATH/${DESIGN}_post_dft_area.rpt
report_timing                    >  $_REPORTS_PATH/${DESIGN}_post_dft_timing.rpt
report_power                     >  $_REPORTS_PATH/${DESIGN}_post_dft_power.rpt
report_port [get_db ports .name] >  $_REPORTS_PATH/${DESIGN}_post_dft_ports.rpt

####################################################################
## Reports
####################################################################


####################################################################
## Outputs
####################################################################

# Escrever netlist e SDC finais
write_hdl  > $_OUTPUTS_PATH/${DESIGN}_netlist.v
write_sdc -view nominal_view  > $_OUTPUTS_PATH/${DESIGN}_nom_m.sdc
write_sdc -view worst_view  > $_OUTPUTS_PATH/${DESIGN}_wrst_m.sdc
write_sdc -view best_view  > $_OUTPUTS_PATH/${DESIGN}_best_m.sdc

# Escrever arquivo LEC final
write_do_lec -golden_design fv_map -revised_design $_OUTPUTS_PATH/${DESIGN}_netlist.v > $_OUTPUTS_PATH/${DESIGN}_fv_map_to_final.tcl

# Salvar db para uso futuro
#write_db db_${DESIGN}.db

# Salvar arquivos do Innovus para as etapas seguintes
# write_design -innovus -base_name $_INNOVUS_PATH/${DESIGN}
#write_db -common -legacy -all_root_attributes $_INNOVUS_PATH/${DESIGN}

puts "============================"
puts "Synthesis Finished ........."
puts "============================"