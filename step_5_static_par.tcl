puts "Step 5 Static PAR"

open_checkpoint bld/static/static.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/mb_tmr.dcp

set_property HD.RECONFIGURABLE 1 [get_cells design_1_i/dut_0/dut_wrapper/U0/mbb_i]
create_pblock pb0
add_cells_to_pblock [get_pblocks pb0] [get_cells -quiet [list design_1_i/dut_0/dut_wrapper/U0/mbb_i]]
resize_pblock pb0 -add {SLICE_X0Y0:SLICE_X83Y99 DSP48_X0Y0:DSP48_X4Y39 RAMB18_X0Y0:RAMB18_X4Y39 RAMB36_X0Y0:RAMB36_X4Y19} -locs keep_all -replace
set_property RESET_AFTER_RECONFIG true [get_pblocks pb0]
set_property SNAPPING_MODE ON [get_pblocks pb0]

read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/mb_tmr.dcp

set_property HD.RECONFIGURABLE 1 [get_cells design_1_i/dut_1/dut_wrapper/U0/mbb_i]
create_pblock pb1
add_cells_to_pblock [get_pblocks pb1] [get_cells -quiet [list design_1_i/dut_1/dut_wrapper/U0/mbb_i]]
resize_pblock pb1 -add {SLICE_X84Y0:SLICE_X163Y99 DSP48_X5Y0:DSP48_X8Y39 RAMB18_X5Y0:RAMB18_X8Y39 RAMB36_X5Y0:RAMB36_X8Y19} -locs keep_all -replace
set_property RESET_AFTER_RECONFIG true [get_pblocks pb1]
set_property SNAPPING_MODE ON [get_pblocks pb1]

read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/mb_tmr.dcp

set_property HD.RECONFIGURABLE 1 [get_cells design_1_i/dut_2/dut_wrapper/U0/mbb_i]
create_pblock pb2
add_cells_to_pblock [get_pblocks pb2] [get_cells -quiet [list design_1_i/dut_2/dut_wrapper/U0/mbb_i]]
resize_pblock pb2 -add {SLICE_X84Y150:SLICE_X163Y249 DSP48_X5Y60:DSP48_X8Y99 RAMB18_X5Y60:RAMB18_X8Y99 RAMB36_X5Y30:RAMB36_X8Y49}  -locs keep_all -replace
set_property RESET_AFTER_RECONFIG true [get_pblocks pb2]
set_property SNAPPING_MODE ON [get_pblocks pb2]


set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]


opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

write_checkpoint bld/dcps/static.dcp
write_bitstream  bld/bits/static.bit

write_cfgmem -format mcs -size 16 -interface SPIx4 -force -loadbit "up 0x00000000 bld/bits/static.bit" -file bld/cfgmem/static.mcs

update_design -cells design_1_i/dut_0/dut_wrapper/U0/mbb_i -black_box
update_design -cells design_1_i/dut_1/dut_wrapper/U0/mbb_i -black_box
update_design -cells design_1_i/dut_2/dut_wrapper/U0/mbb_i -black_box

lock_design -level routing

write_checkpoint bld/dcps/locked.dcp

close_project

puts "Step 5 Done, Anything Else?"