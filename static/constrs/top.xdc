set_property PACKAGE_PIN G3 [get_ports {leda[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leda[0]}]
set_property PACKAGE_PIN H3 [get_ports ledb]
set_property IOSTANDARD LVCMOS33 [get_ports ledb]

set_property PACKAGE_PIN J19 [get_ports CLK_IN1_D_0_clk_p]
set_property PACKAGE_PIN H19 [get_ports CLK_IN1_D_0_clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_IN1_D_0_clk_p]
create_clock -period 5.000 -name ddr_clkin [get_ports CLK_IN1_D_0_clk_p]

###############################################################################
# Timing Constraints
###############################################################################

create_clock -period 10.000 -name pcie_clkin [get_ports pcie_clkin_p]

###############################################################################
# Physical Constraints
###############################################################################

# Input reset is resynchronized within FPGA design as necessary
set_false_path -from [get_ports pcie_reset]
set_false_path -from [get_pins design_1_i/pcie_7x_0/inst/inst/user_reset_out_reg/C]

###############################################################################
# SPI
###############################################################################
set_property PACKAGE_PIN P22 [get_ports SPI_0_io0_io]
set_property PACKAGE_PIN R22 [get_ports SPI_0_io1_io]
set_property PACKAGE_PIN P21 [get_ports SPI_0_io2_io]
set_property PACKAGE_PIN R21 [get_ports SPI_0_io3_io]

set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io0_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io1_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io2_io]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io3_io]

#
set_property PACKAGE_PIN U21 [get_ports SPI_0_ss_t]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss_t]
set_property PACKAGE_PIN T19 [get_ports {ss_o_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ss_o_0[0]}]
set_property PACKAGE_PIN U22 [get_ports {SPI_0_ss_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SPI_0_ss_i[0]}]


###############################################################################
# Additional design / project settings
###############################################################################

# Power down on overtemp
set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN ENABLE [current_design]

# High-speed configuration so FPGA is up in time to negotiate with PCIe root complex
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN Div-1 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

