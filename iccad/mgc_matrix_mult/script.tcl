set search_path {.}
set link_path {*  NangateOpenCellLibrary_typical_ccs.lib}
#set link_path {* NangateOpenCellLibrary_fast_ccs.lib}
#set link_path {* NangateOpenCellLibrary_low_temp_ccs.lib }
read_verilog mgc_matrix_mult.v
current_design matrix_mult
link_design
read_sdc mgc_matrix_mult.sdc
