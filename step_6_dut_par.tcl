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

#Taiga

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/taiga.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/taiga.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/taiga.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/taiga.dcp
write_bitstream  bld/bits/taiga.bit

close_project

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/taiga_tmr.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/taiga_tmr.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/taiga_tmr.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/taiga_tmr.dcp
write_bitstream  bld/bits/taiga_tmr.bit

close_project

#PicoRV32

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/pico.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/pico.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/pico.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/pico.dcp
write_bitstream  bld/bits/pico.bit

close_project

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/pico_tmr.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/pico_tmr.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/pico_tmr.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/pico_tmr.dcp
write_bitstream  bld/bits/pico_tmr.bit

close_project

#Kronos

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/kron.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/kron.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/kron.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/kron.dcp
write_bitstream  bld/bits/kron.bit

close_project

open_checkpoint bld/dcps/locked.dcp

read_checkpoint -cell design_1_i/dut_0/dut_wrapper/U0/mbb_i bld/cpus/kron_tmr.dcp
read_checkpoint -cell design_1_i/dut_1/dut_wrapper/U0/mbb_i bld/cpus/kron_tmr.dcp
read_checkpoint -cell design_1_i/dut_2/dut_wrapper/U0/mbb_i bld/cpus/kron_tmr.dcp

opt_design
place_design
route_design -directive AggressiveExplore -tns_cleanup

set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

write_checkpoint bld/dcps/kron_tmr.dcp
write_bitstream  bld/bits/kron_tmr.bit

close_project


puts "Step 6 Done, Anything Else?"