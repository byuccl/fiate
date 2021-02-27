puts "Step 6 DUT PAR"

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/vex.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/vex.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/vex.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/vex.dcp
write_bitstream  bld/bits/vex.bit

close_project

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/vex_tmr.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/vex_tmr.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/vex_tmr.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/vex_tmr.dcp
write_bitstream  bld/bits/vex_tmr.bit

close_project

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/mb.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/mb.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/mb.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/mb.dcp
write_bitstream  bld/bits/mb.bit

close_project

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/mb_tmr.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/mb_tmr.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/mb_tmr.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/mb_tmr.dcp
write_bitstream  bld/bits/mb_tmr.bit

close_project

puts "Step 6 Done, Anything Else?"