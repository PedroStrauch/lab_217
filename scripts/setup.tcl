##################################################
## Preset global variables and attributes
##################################################
set DESIGN mac
set DATE [clock format [clock seconds] -format "%b%d-%T"]
set _OUTPUTS_PATH ../outputs
set _REPORTS_PATH ../reports
set _LOGS_PATH    ../logs

set RTL_PATH ../verilog_code
#set_db / .init_hdl_search_path $RTL_PATH
set CONSTR_PATH ../constr

###############################################################
## Library setup
###############################################################

read_libs { 
	/pdk/skywater/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_100C_1v65.lib
	/pdk/skywater/sky130/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__gpiov2_pad_wrapped_ff_ss_100C_1v65_1v65.lib
}



## pad limited lib
## /pdk/xfab/XC018_61_3.1.3/synopsys/xc018/MOS5ST/IO_CELLS_5V_MOS5ST_typ_1_80V_5_00V_25C.lib

## io cels core limited
## /pdk/xfab/XC018_61_3.1.3/cadence/xc018/LEF/xc018_m6_FE/IO_CELLS_F5V.lef
#
# io cells pad limited
# /pdk/xfab/XC018_61_3.1.3/cadence/xc018/LEF/xc018_m6_FE/IO_CELLS_5V.lef
# 
