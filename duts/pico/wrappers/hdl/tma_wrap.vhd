----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2020 06:08:36 PM
-- Design Name: 
-- Module Name: tmr_wrap - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tma_wrap is
    Port (
    Reset_0_TMR_0 : in STD_LOGIC;
    Reset_0_TMR_1 : in STD_LOGIC;
    Reset_0_TMR_2 : in STD_LOGIC;
    Clk_0_TMR_0 : in STD_LOGIC;
    Clk_0_TMR_1 : in STD_LOGIC;
    Clk_0_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_araddr_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_araddr_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_araddr_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_arburst_TMR_0 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_DC_0_arburst_TMR_1 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_DC_0_arburst_TMR_2 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_DC_0_arcache_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_arcache_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_arcache_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_arid_TMR_0 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_DC_0_arid_TMR_1 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_DC_0_arid_TMR_2 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_DC_0_arlen_TMR_0 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_DC_0_arlen_TMR_1 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_DC_0_arlen_TMR_2 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_DC_0_arlock_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_arlock_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_arlock_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_arprot_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_arprot_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_arprot_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_arqos_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_arqos_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_arqos_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_arready_TMR_0 : in STD_LOGIC;
    M_AXI_DC_0_arready_TMR_1 : in STD_LOGIC;
    M_AXI_DC_0_arready_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_arsize_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_arsize_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_arsize_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_arvalid_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_arvalid_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_arvalid_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_awaddr_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_awaddr_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_awaddr_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_awburst_TMR_0 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_DC_0_awburst_TMR_1 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_DC_0_awburst_TMR_2 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_DC_0_awcache_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_awcache_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_awcache_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_awid_TMR_0 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_DC_0_awid_TMR_1 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_DC_0_awid_TMR_2 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_DC_0_awlen_TMR_0 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_DC_0_awlen_TMR_1 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_DC_0_awlen_TMR_2 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_DC_0_awlock_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_awlock_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_awlock_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_awprot_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_awprot_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_awprot_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_awqos_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_awqos_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_awqos_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_awready_TMR_0 : in STD_LOGIC;
    M_AXI_DC_0_awready_TMR_1 : in STD_LOGIC;
    M_AXI_DC_0_awready_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_awsize_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_awsize_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_awsize_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DC_0_awvalid_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_awvalid_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_awvalid_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_bid_TMR_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_bid_TMR_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_bid_TMR_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_bready_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_bready_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_bready_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_bresp_TMR_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_bresp_TMR_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_bresp_TMR_2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_bvalid_TMR_0 : in STD_LOGIC;
    M_AXI_DC_0_bvalid_TMR_1 : in STD_LOGIC;
    M_AXI_DC_0_bvalid_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_rdata_TMR_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_rdata_TMR_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_rdata_TMR_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_rid_TMR_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_rid_TMR_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_rid_TMR_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_rlast_TMR_0 : in STD_LOGIC;
    M_AXI_DC_0_rlast_TMR_1 : in STD_LOGIC;
    M_AXI_DC_0_rlast_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_rready_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_rready_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_rready_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_rresp_TMR_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_rresp_TMR_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_rresp_TMR_2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_rvalid_TMR_0 : in STD_LOGIC;
    M_AXI_DC_0_rvalid_TMR_1 : in STD_LOGIC;
    M_AXI_DC_0_rvalid_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_wdata_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_wdata_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_wdata_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DC_0_wlast_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_wlast_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_wlast_TMR_2 : out STD_LOGIC;
    M_AXI_DC_0_wready_TMR_0 : in STD_LOGIC;
    M_AXI_DC_0_wready_TMR_1 : in STD_LOGIC;
    M_AXI_DC_0_wready_TMR_2 : in STD_LOGIC;
    M_AXI_DC_0_wstrb_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_wstrb_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_wstrb_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DC_0_wvalid_TMR_0 : out STD_LOGIC;
    M_AXI_DC_0_wvalid_TMR_1 : out STD_LOGIC;
    M_AXI_DC_0_wvalid_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_araddr_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_araddr_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_araddr_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_arburst_TMR_0 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_IC_0_arburst_TMR_1 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_IC_0_arburst_TMR_2 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_IC_0_arcache_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_arcache_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_arcache_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_arid_TMR_0 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_IC_0_arid_TMR_1 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_IC_0_arid_TMR_2 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_IC_0_arlen_TMR_0 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_IC_0_arlen_TMR_1 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_IC_0_arlen_TMR_2 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_IC_0_arlock_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_arlock_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_arlock_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_arprot_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_arprot_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_arprot_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_arqos_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_arqos_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_arqos_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_arready_TMR_0 : in STD_LOGIC;
    M_AXI_IC_0_arready_TMR_1 : in STD_LOGIC;
    M_AXI_IC_0_arready_TMR_2 : in STD_LOGIC;
    M_AXI_IC_0_arsize_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_arsize_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_arsize_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_arvalid_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_arvalid_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_arvalid_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_awaddr_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_awaddr_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_awaddr_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_awburst_TMR_0 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_IC_0_awburst_TMR_1 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_IC_0_awburst_TMR_2 : out STD_LOGIC_VECTOR( 1 downto 0 );
    M_AXI_IC_0_awcache_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_awcache_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_awcache_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_awid_TMR_0 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_IC_0_awid_TMR_1 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_IC_0_awid_TMR_2 : out STD_LOGIC_VECTOR( 0 to 0 );
    M_AXI_IC_0_awlen_TMR_0 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_IC_0_awlen_TMR_1 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_IC_0_awlen_TMR_2 : out STD_LOGIC_VECTOR( 7 downto 0 );
    M_AXI_IC_0_awlock_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_awlock_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_awlock_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_awprot_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_awprot_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_awprot_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_awqos_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_awqos_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_awqos_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_awready_TMR_0 : in STD_LOGIC;
    M_AXI_IC_0_awready_TMR_1 : in STD_LOGIC;
    M_AXI_IC_0_awready_TMR_2 : in STD_LOGIC;
    M_AXI_IC_0_awsize_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_awsize_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_awsize_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_IC_0_awvalid_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_awvalid_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_awvalid_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_bid_TMR_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_bid_TMR_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_bid_TMR_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_bready_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_bready_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_bready_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_bresp_TMR_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_bresp_TMR_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_bresp_TMR_2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_bvalid_TMR_0 : in STD_LOGIC;
    M_AXI_IC_0_bvalid_TMR_1 : in STD_LOGIC;
    M_AXI_IC_0_bvalid_TMR_2 : in STD_LOGIC;
    M_AXI_IC_0_rdata_TMR_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_rdata_TMR_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_rdata_TMR_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_rid_TMR_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_rid_TMR_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_rid_TMR_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_rlast_TMR_0 : in STD_LOGIC;
    M_AXI_IC_0_rlast_TMR_1 : in STD_LOGIC;
    M_AXI_IC_0_rlast_TMR_2 : in STD_LOGIC;
    M_AXI_IC_0_rready_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_rready_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_rready_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_rresp_TMR_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_rresp_TMR_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_rresp_TMR_2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_rvalid_TMR_0 : in STD_LOGIC;
    M_AXI_IC_0_rvalid_TMR_1 : in STD_LOGIC;
    M_AXI_IC_0_rvalid_TMR_2 : in STD_LOGIC;
    M_AXI_IC_0_wdata_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_wdata_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_wdata_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_IC_0_wlast_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_wlast_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_wlast_TMR_2 : out STD_LOGIC;
    M_AXI_IC_0_wready_TMR_0 : in STD_LOGIC;
    M_AXI_IC_0_wready_TMR_1 : in STD_LOGIC;
    M_AXI_IC_0_wready_TMR_2 : in STD_LOGIC;
    M_AXI_IC_0_wstrb_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_wstrb_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_wstrb_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_IC_0_wvalid_TMR_0 : out STD_LOGIC;
    M_AXI_IC_0_wvalid_TMR_1 : out STD_LOGIC;
    M_AXI_IC_0_wvalid_TMR_2 : out STD_LOGIC;
    M_AXI_DP_0_araddr_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_araddr_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_araddr_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_arprot_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DP_0_arprot_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DP_0_arprot_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DP_0_arready_TMR_0 : in STD_LOGIC;
    M_AXI_DP_0_arready_TMR_1 : in STD_LOGIC;
    M_AXI_DP_0_arready_TMR_2 : in STD_LOGIC;
    M_AXI_DP_0_arvalid_TMR_0 : out STD_LOGIC;
    M_AXI_DP_0_arvalid_TMR_1 : out STD_LOGIC;
    M_AXI_DP_0_arvalid_TMR_2 : out STD_LOGIC;
    M_AXI_DP_0_awaddr_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_awaddr_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_awaddr_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_awprot_TMR_0 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DP_0_awprot_TMR_1 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DP_0_awprot_TMR_2 : out STD_LOGIC_VECTOR( 2 downto 0 );
    M_AXI_DP_0_awready_TMR_0 : in STD_LOGIC;
    M_AXI_DP_0_awready_TMR_1 : in STD_LOGIC;
    M_AXI_DP_0_awready_TMR_2 : in STD_LOGIC;
    M_AXI_DP_0_awvalid_TMR_0 : out STD_LOGIC;
    M_AXI_DP_0_awvalid_TMR_1 : out STD_LOGIC;
    M_AXI_DP_0_awvalid_TMR_2 : out STD_LOGIC;
    M_AXI_DP_0_bready_TMR_0 : out STD_LOGIC;
    M_AXI_DP_0_bready_TMR_1 : out STD_LOGIC;
    M_AXI_DP_0_bready_TMR_2 : out STD_LOGIC;
    M_AXI_DP_0_bresp_TMR_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_bresp_TMR_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_bresp_TMR_2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_bvalid_TMR_0 : in STD_LOGIC;
    M_AXI_DP_0_bvalid_TMR_1 : in STD_LOGIC;
    M_AXI_DP_0_bvalid_TMR_2 : in STD_LOGIC;
    M_AXI_DP_0_rdata_TMR_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_rdata_TMR_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_rdata_TMR_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_rready_TMR_0 : out STD_LOGIC;
    M_AXI_DP_0_rready_TMR_1 : out STD_LOGIC;
    M_AXI_DP_0_rready_TMR_2 : out STD_LOGIC;
    M_AXI_DP_0_rresp_TMR_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_rresp_TMR_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_rresp_TMR_2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_rvalid_TMR_0 : in STD_LOGIC;
    M_AXI_DP_0_rvalid_TMR_1 : in STD_LOGIC;
    M_AXI_DP_0_rvalid_TMR_2 : in STD_LOGIC;
    M_AXI_DP_0_wdata_TMR_0 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_wdata_TMR_1 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_wdata_TMR_2 : out STD_LOGIC_VECTOR( 31 downto 0 );
    M_AXI_DP_0_wready_TMR_0 : in STD_LOGIC;
    M_AXI_DP_0_wready_TMR_1 : in STD_LOGIC;
    M_AXI_DP_0_wready_TMR_2 : in STD_LOGIC;
    M_AXI_DP_0_wstrb_TMR_0 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DP_0_wstrb_TMR_1 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DP_0_wstrb_TMR_2 : out STD_LOGIC_VECTOR( 3 downto 0 );
    M_AXI_DP_0_wvalid_TMR_0 : out STD_LOGIC;
    M_AXI_DP_0_wvalid_TMR_1 : out STD_LOGIC;
    M_AXI_DP_0_wvalid_TMR_2 : out STD_LOGIC
    );
end tma_wrap;

architecture Behavioral of tma_wrap is
	  component mbb_wrapper is
  port (
    Reset_0 : in STD_LOGIC;
    Clk_0 : in STD_LOGIC;
    M_AXI_DC_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_0_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_DC_0_arlock : out STD_LOGIC;
    M_AXI_DC_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_0_arready : in STD_LOGIC;
    M_AXI_DC_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_0_arvalid : out STD_LOGIC;
    M_AXI_DC_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_0_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_DC_0_awlock : out STD_LOGIC;
    M_AXI_DC_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_0_awready : in STD_LOGIC;
    M_AXI_DC_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DC_0_awvalid : out STD_LOGIC;
    M_AXI_DC_0_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_bready : out STD_LOGIC;
    M_AXI_DC_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_bvalid : in STD_LOGIC;
    M_AXI_DC_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_rlast : in STD_LOGIC;
    M_AXI_DC_0_rready : out STD_LOGIC;
    M_AXI_DC_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DC_0_rvalid : in STD_LOGIC;
    M_AXI_DC_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DC_0_wlast : out STD_LOGIC;
    M_AXI_DC_0_wready : in STD_LOGIC;
    M_AXI_DC_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DC_0_wvalid : out STD_LOGIC;
    M_AXI_IC_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_0_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_IC_0_arlock : out STD_LOGIC;
    M_AXI_IC_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_0_arready : in STD_LOGIC;
    M_AXI_IC_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_0_arvalid : out STD_LOGIC;
    M_AXI_IC_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_0_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_IC_0_awlock : out STD_LOGIC;
    M_AXI_IC_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_0_awready : in STD_LOGIC;
    M_AXI_IC_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_IC_0_awvalid : out STD_LOGIC;
    M_AXI_IC_0_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_bready : out STD_LOGIC;
    M_AXI_IC_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_bvalid : in STD_LOGIC;
    M_AXI_IC_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_rlast : in STD_LOGIC;
    M_AXI_IC_0_rready : out STD_LOGIC;
    M_AXI_IC_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_rvalid : in STD_LOGIC;
    M_AXI_IC_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_wlast : out STD_LOGIC;
    M_AXI_IC_0_wready : in STD_LOGIC;
    M_AXI_IC_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_IC_0_wvalid : out STD_LOGIC;
    M_AXI_DP_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DP_0_arready : in STD_LOGIC;
    M_AXI_DP_0_arvalid : out STD_LOGIC;
    M_AXI_DP_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_DP_0_awready : in STD_LOGIC;
    M_AXI_DP_0_awvalid : out STD_LOGIC;
    M_AXI_DP_0_bready : out STD_LOGIC;
    M_AXI_DP_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_bvalid : in STD_LOGIC;
    M_AXI_DP_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_rready : out STD_LOGIC;
    M_AXI_DP_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_DP_0_rvalid : in STD_LOGIC;
    M_AXI_DP_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_DP_0_wready : in STD_LOGIC;
    M_AXI_DP_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_DP_0_wvalid : out STD_LOGIC
  );
  end component mbb_wrapper;
  signal M_AXI_DC_0_araddr : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_arburst : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_arcache : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arid : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_arlen : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_arlock : STD_LOGIC;
signal M_AXI_DC_0_arprot : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arqos : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arsize : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arvalid : STD_LOGIC;
signal M_AXI_DC_0_awaddr : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_awburst : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_awcache : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awid : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_awlen : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_awlock : STD_LOGIC;
signal M_AXI_DC_0_awprot : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awqos : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awsize : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awvalid : STD_LOGIC;
signal M_AXI_DC_0_bready : STD_LOGIC;
signal M_AXI_DC_0_rready : STD_LOGIC;
signal M_AXI_DC_0_wdata : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_wlast : STD_LOGIC;
signal M_AXI_DC_0_wstrb : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_wvalid : STD_LOGIC;
signal M_AXI_IC_0_araddr : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_arburst : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_arcache : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arid : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_arlen : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_arlock : STD_LOGIC;
signal M_AXI_IC_0_arprot : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arqos : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arsize : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arvalid : STD_LOGIC;
signal M_AXI_IC_0_awaddr : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_awburst : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_awcache : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awid : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_awlen : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_awlock : STD_LOGIC;
signal M_AXI_IC_0_awprot : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awqos : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awsize : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awvalid : STD_LOGIC;
signal M_AXI_IC_0_bready : STD_LOGIC;
signal M_AXI_IC_0_rready : STD_LOGIC;
signal M_AXI_IC_0_wdata : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_wlast : STD_LOGIC;
signal M_AXI_IC_0_wstrb : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_wvalid : STD_LOGIC;
signal M_AXI_DP_0_araddr : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_arprot : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_arvalid : STD_LOGIC;
signal M_AXI_DP_0_awaddr : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_awprot : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_awvalid : STD_LOGIC;
signal M_AXI_DP_0_bready : STD_LOGIC;
signal M_AXI_DP_0_rready : STD_LOGIC;
signal M_AXI_DP_0_wdata : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_wstrb : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DP_0_wvalid : STD_LOGIC;

begin

M_AXI_DC_0_araddr_TMR_0 <= M_AXI_DC_0_araddr;
M_AXI_DC_0_araddr_TMR_1 <= M_AXI_DC_0_araddr;
M_AXI_DC_0_araddr_TMR_2 <= M_AXI_DC_0_araddr;
M_AXI_DC_0_arburst_TMR_0 <= M_AXI_DC_0_arburst;
M_AXI_DC_0_arburst_TMR_1 <= M_AXI_DC_0_arburst;
M_AXI_DC_0_arburst_TMR_2 <= M_AXI_DC_0_arburst;
M_AXI_DC_0_arcache_TMR_0 <= M_AXI_DC_0_arcache;
M_AXI_DC_0_arcache_TMR_1 <= M_AXI_DC_0_arcache;
M_AXI_DC_0_arcache_TMR_2 <= M_AXI_DC_0_arcache;
M_AXI_DC_0_arid_TMR_0 <= M_AXI_DC_0_arid;
M_AXI_DC_0_arid_TMR_1 <= M_AXI_DC_0_arid;
M_AXI_DC_0_arid_TMR_2 <= M_AXI_DC_0_arid;
M_AXI_DC_0_arlen_TMR_0 <= M_AXI_DC_0_arlen;
M_AXI_DC_0_arlen_TMR_1 <= M_AXI_DC_0_arlen;
M_AXI_DC_0_arlen_TMR_2 <= M_AXI_DC_0_arlen;
M_AXI_DC_0_arlock_TMR_0 <= M_AXI_DC_0_arlock;
M_AXI_DC_0_arlock_TMR_1 <= M_AXI_DC_0_arlock;
M_AXI_DC_0_arlock_TMR_2 <= M_AXI_DC_0_arlock;
M_AXI_DC_0_arprot_TMR_0 <= M_AXI_DC_0_arprot;
M_AXI_DC_0_arprot_TMR_1 <= M_AXI_DC_0_arprot;
M_AXI_DC_0_arprot_TMR_2 <= M_AXI_DC_0_arprot;
M_AXI_DC_0_arqos_TMR_0 <= M_AXI_DC_0_arqos;
M_AXI_DC_0_arqos_TMR_1 <= M_AXI_DC_0_arqos;
M_AXI_DC_0_arqos_TMR_2 <= M_AXI_DC_0_arqos;
M_AXI_DC_0_arsize_TMR_0 <= M_AXI_DC_0_arsize;
M_AXI_DC_0_arsize_TMR_1 <= M_AXI_DC_0_arsize;
M_AXI_DC_0_arsize_TMR_2 <= M_AXI_DC_0_arsize;
M_AXI_DC_0_arvalid_TMR_0 <= M_AXI_DC_0_arvalid;
M_AXI_DC_0_arvalid_TMR_1 <= M_AXI_DC_0_arvalid;
M_AXI_DC_0_arvalid_TMR_2 <= M_AXI_DC_0_arvalid;
M_AXI_DC_0_awaddr_TMR_0 <= M_AXI_DC_0_awaddr;
M_AXI_DC_0_awaddr_TMR_1 <= M_AXI_DC_0_awaddr;
M_AXI_DC_0_awaddr_TMR_2 <= M_AXI_DC_0_awaddr;
M_AXI_DC_0_awburst_TMR_0 <= M_AXI_DC_0_awburst;
M_AXI_DC_0_awburst_TMR_1 <= M_AXI_DC_0_awburst;
M_AXI_DC_0_awburst_TMR_2 <= M_AXI_DC_0_awburst;
M_AXI_DC_0_awcache_TMR_0 <= M_AXI_DC_0_awcache;
M_AXI_DC_0_awcache_TMR_1 <= M_AXI_DC_0_awcache;
M_AXI_DC_0_awcache_TMR_2 <= M_AXI_DC_0_awcache;
M_AXI_DC_0_awid_TMR_0 <= M_AXI_DC_0_awid;
M_AXI_DC_0_awid_TMR_1 <= M_AXI_DC_0_awid;
M_AXI_DC_0_awid_TMR_2 <= M_AXI_DC_0_awid;
M_AXI_DC_0_awlen_TMR_0 <= M_AXI_DC_0_awlen;
M_AXI_DC_0_awlen_TMR_1 <= M_AXI_DC_0_awlen;
M_AXI_DC_0_awlen_TMR_2 <= M_AXI_DC_0_awlen;
M_AXI_DC_0_awlock_TMR_0 <= M_AXI_DC_0_awlock;
M_AXI_DC_0_awlock_TMR_1 <= M_AXI_DC_0_awlock;
M_AXI_DC_0_awlock_TMR_2 <= M_AXI_DC_0_awlock;
M_AXI_DC_0_awprot_TMR_0 <= M_AXI_DC_0_awprot;
M_AXI_DC_0_awprot_TMR_1 <= M_AXI_DC_0_awprot;
M_AXI_DC_0_awprot_TMR_2 <= M_AXI_DC_0_awprot;
M_AXI_DC_0_awqos_TMR_0 <= M_AXI_DC_0_awqos;
M_AXI_DC_0_awqos_TMR_1 <= M_AXI_DC_0_awqos;
M_AXI_DC_0_awqos_TMR_2 <= M_AXI_DC_0_awqos;
M_AXI_DC_0_awsize_TMR_0 <= M_AXI_DC_0_awsize;
M_AXI_DC_0_awsize_TMR_1 <= M_AXI_DC_0_awsize;
M_AXI_DC_0_awsize_TMR_2 <= M_AXI_DC_0_awsize;
M_AXI_DC_0_awvalid_TMR_0 <= M_AXI_DC_0_awvalid;
M_AXI_DC_0_awvalid_TMR_1 <= M_AXI_DC_0_awvalid;
M_AXI_DC_0_awvalid_TMR_2 <= M_AXI_DC_0_awvalid;
M_AXI_DC_0_bready_TMR_0 <= M_AXI_DC_0_bready;
M_AXI_DC_0_bready_TMR_1 <= M_AXI_DC_0_bready;
M_AXI_DC_0_bready_TMR_2 <= M_AXI_DC_0_bready;
M_AXI_DC_0_rready_TMR_0 <= M_AXI_DC_0_rready;
M_AXI_DC_0_rready_TMR_1 <= M_AXI_DC_0_rready;
M_AXI_DC_0_rready_TMR_2 <= M_AXI_DC_0_rready;
M_AXI_DC_0_wdata_TMR_0 <= M_AXI_DC_0_wdata;
M_AXI_DC_0_wdata_TMR_1 <= M_AXI_DC_0_wdata;
M_AXI_DC_0_wdata_TMR_2 <= M_AXI_DC_0_wdata;
M_AXI_DC_0_wlast_TMR_0 <= M_AXI_DC_0_wlast;
M_AXI_DC_0_wlast_TMR_1 <= M_AXI_DC_0_wlast;
M_AXI_DC_0_wlast_TMR_2 <= M_AXI_DC_0_wlast;
M_AXI_DC_0_wstrb_TMR_0 <= M_AXI_DC_0_wstrb;
M_AXI_DC_0_wstrb_TMR_1 <= M_AXI_DC_0_wstrb;
M_AXI_DC_0_wstrb_TMR_2 <= M_AXI_DC_0_wstrb;
M_AXI_DC_0_wvalid_TMR_0 <= M_AXI_DC_0_wvalid;
M_AXI_DC_0_wvalid_TMR_1 <= M_AXI_DC_0_wvalid;
M_AXI_DC_0_wvalid_TMR_2 <= M_AXI_DC_0_wvalid;
M_AXI_IC_0_araddr_TMR_0 <= M_AXI_IC_0_araddr;
M_AXI_IC_0_araddr_TMR_1 <= M_AXI_IC_0_araddr;
M_AXI_IC_0_araddr_TMR_2 <= M_AXI_IC_0_araddr;
M_AXI_IC_0_arburst_TMR_0 <= M_AXI_IC_0_arburst;
M_AXI_IC_0_arburst_TMR_1 <= M_AXI_IC_0_arburst;
M_AXI_IC_0_arburst_TMR_2 <= M_AXI_IC_0_arburst;
M_AXI_IC_0_arcache_TMR_0 <= M_AXI_IC_0_arcache;
M_AXI_IC_0_arcache_TMR_1 <= M_AXI_IC_0_arcache;
M_AXI_IC_0_arcache_TMR_2 <= M_AXI_IC_0_arcache;
M_AXI_IC_0_arid_TMR_0 <= M_AXI_IC_0_arid;
M_AXI_IC_0_arid_TMR_1 <= M_AXI_IC_0_arid;
M_AXI_IC_0_arid_TMR_2 <= M_AXI_IC_0_arid;
M_AXI_IC_0_arlen_TMR_0 <= M_AXI_IC_0_arlen;
M_AXI_IC_0_arlen_TMR_1 <= M_AXI_IC_0_arlen;
M_AXI_IC_0_arlen_TMR_2 <= M_AXI_IC_0_arlen;
M_AXI_IC_0_arlock_TMR_0 <= M_AXI_IC_0_arlock;
M_AXI_IC_0_arlock_TMR_1 <= M_AXI_IC_0_arlock;
M_AXI_IC_0_arlock_TMR_2 <= M_AXI_IC_0_arlock;
M_AXI_IC_0_arprot_TMR_0 <= M_AXI_IC_0_arprot;
M_AXI_IC_0_arprot_TMR_1 <= M_AXI_IC_0_arprot;
M_AXI_IC_0_arprot_TMR_2 <= M_AXI_IC_0_arprot;
M_AXI_IC_0_arqos_TMR_0 <= M_AXI_IC_0_arqos;
M_AXI_IC_0_arqos_TMR_1 <= M_AXI_IC_0_arqos;
M_AXI_IC_0_arqos_TMR_2 <= M_AXI_IC_0_arqos;
M_AXI_IC_0_arsize_TMR_0 <= M_AXI_IC_0_arsize;
M_AXI_IC_0_arsize_TMR_1 <= M_AXI_IC_0_arsize;
M_AXI_IC_0_arsize_TMR_2 <= M_AXI_IC_0_arsize;
M_AXI_IC_0_arvalid_TMR_0 <= M_AXI_IC_0_arvalid;
M_AXI_IC_0_arvalid_TMR_1 <= M_AXI_IC_0_arvalid;
M_AXI_IC_0_arvalid_TMR_2 <= M_AXI_IC_0_arvalid;
M_AXI_IC_0_awaddr_TMR_0 <= M_AXI_IC_0_awaddr;
M_AXI_IC_0_awaddr_TMR_1 <= M_AXI_IC_0_awaddr;
M_AXI_IC_0_awaddr_TMR_2 <= M_AXI_IC_0_awaddr;
M_AXI_IC_0_awburst_TMR_0 <= M_AXI_IC_0_awburst;
M_AXI_IC_0_awburst_TMR_1 <= M_AXI_IC_0_awburst;
M_AXI_IC_0_awburst_TMR_2 <= M_AXI_IC_0_awburst;
M_AXI_IC_0_awcache_TMR_0 <= M_AXI_IC_0_awcache;
M_AXI_IC_0_awcache_TMR_1 <= M_AXI_IC_0_awcache;
M_AXI_IC_0_awcache_TMR_2 <= M_AXI_IC_0_awcache;
M_AXI_IC_0_awid_TMR_0 <= M_AXI_IC_0_awid;
M_AXI_IC_0_awid_TMR_1 <= M_AXI_IC_0_awid;
M_AXI_IC_0_awid_TMR_2 <= M_AXI_IC_0_awid;
M_AXI_IC_0_awlen_TMR_0 <= M_AXI_IC_0_awlen;
M_AXI_IC_0_awlen_TMR_1 <= M_AXI_IC_0_awlen;
M_AXI_IC_0_awlen_TMR_2 <= M_AXI_IC_0_awlen;
M_AXI_IC_0_awlock_TMR_0 <= M_AXI_IC_0_awlock;
M_AXI_IC_0_awlock_TMR_1 <= M_AXI_IC_0_awlock;
M_AXI_IC_0_awlock_TMR_2 <= M_AXI_IC_0_awlock;
M_AXI_IC_0_awprot_TMR_0 <= M_AXI_IC_0_awprot;
M_AXI_IC_0_awprot_TMR_1 <= M_AXI_IC_0_awprot;
M_AXI_IC_0_awprot_TMR_2 <= M_AXI_IC_0_awprot;
M_AXI_IC_0_awqos_TMR_0 <= M_AXI_IC_0_awqos;
M_AXI_IC_0_awqos_TMR_1 <= M_AXI_IC_0_awqos;
M_AXI_IC_0_awqos_TMR_2 <= M_AXI_IC_0_awqos;
M_AXI_IC_0_awsize_TMR_0 <= M_AXI_IC_0_awsize;
M_AXI_IC_0_awsize_TMR_1 <= M_AXI_IC_0_awsize;
M_AXI_IC_0_awsize_TMR_2 <= M_AXI_IC_0_awsize;
M_AXI_IC_0_awvalid_TMR_0 <= M_AXI_IC_0_awvalid;
M_AXI_IC_0_awvalid_TMR_1 <= M_AXI_IC_0_awvalid;
M_AXI_IC_0_awvalid_TMR_2 <= M_AXI_IC_0_awvalid;
M_AXI_IC_0_bready_TMR_0 <= M_AXI_IC_0_bready;
M_AXI_IC_0_bready_TMR_1 <= M_AXI_IC_0_bready;
M_AXI_IC_0_bready_TMR_2 <= M_AXI_IC_0_bready;
M_AXI_IC_0_rready_TMR_0 <= M_AXI_IC_0_rready;
M_AXI_IC_0_rready_TMR_1 <= M_AXI_IC_0_rready;
M_AXI_IC_0_rready_TMR_2 <= M_AXI_IC_0_rready;
M_AXI_IC_0_wdata_TMR_0 <= M_AXI_IC_0_wdata;
M_AXI_IC_0_wdata_TMR_1 <= M_AXI_IC_0_wdata;
M_AXI_IC_0_wdata_TMR_2 <= M_AXI_IC_0_wdata;
M_AXI_IC_0_wlast_TMR_0 <= M_AXI_IC_0_wlast;
M_AXI_IC_0_wlast_TMR_1 <= M_AXI_IC_0_wlast;
M_AXI_IC_0_wlast_TMR_2 <= M_AXI_IC_0_wlast;
M_AXI_IC_0_wstrb_TMR_0 <= M_AXI_IC_0_wstrb;
M_AXI_IC_0_wstrb_TMR_1 <= M_AXI_IC_0_wstrb;
M_AXI_IC_0_wstrb_TMR_2 <= M_AXI_IC_0_wstrb;
M_AXI_IC_0_wvalid_TMR_0 <= M_AXI_IC_0_wvalid;
M_AXI_IC_0_wvalid_TMR_1 <= M_AXI_IC_0_wvalid;
M_AXI_IC_0_wvalid_TMR_2 <= M_AXI_IC_0_wvalid;
M_AXI_DP_0_araddr_TMR_0 <= M_AXI_DP_0_araddr;
M_AXI_DP_0_araddr_TMR_1 <= M_AXI_DP_0_araddr;
M_AXI_DP_0_araddr_TMR_2 <= M_AXI_DP_0_araddr;
M_AXI_DP_0_arprot_TMR_0 <= M_AXI_DP_0_arprot;
M_AXI_DP_0_arprot_TMR_1 <= M_AXI_DP_0_arprot;
M_AXI_DP_0_arprot_TMR_2 <= M_AXI_DP_0_arprot;
M_AXI_DP_0_arvalid_TMR_0 <= M_AXI_DP_0_arvalid;
M_AXI_DP_0_arvalid_TMR_1 <= M_AXI_DP_0_arvalid;
M_AXI_DP_0_arvalid_TMR_2 <= M_AXI_DP_0_arvalid;
M_AXI_DP_0_awaddr_TMR_0 <= M_AXI_DP_0_awaddr;
M_AXI_DP_0_awaddr_TMR_1 <= M_AXI_DP_0_awaddr;
M_AXI_DP_0_awaddr_TMR_2 <= M_AXI_DP_0_awaddr;
M_AXI_DP_0_awprot_TMR_0 <= M_AXI_DP_0_awprot;
M_AXI_DP_0_awprot_TMR_1 <= M_AXI_DP_0_awprot;
M_AXI_DP_0_awprot_TMR_2 <= M_AXI_DP_0_awprot;
M_AXI_DP_0_awvalid_TMR_0 <= M_AXI_DP_0_awvalid;
M_AXI_DP_0_awvalid_TMR_1 <= M_AXI_DP_0_awvalid;
M_AXI_DP_0_awvalid_TMR_2 <= M_AXI_DP_0_awvalid;
M_AXI_DP_0_bready_TMR_0 <= M_AXI_DP_0_bready;
M_AXI_DP_0_bready_TMR_1 <= M_AXI_DP_0_bready;
M_AXI_DP_0_bready_TMR_2 <= M_AXI_DP_0_bready;
M_AXI_DP_0_rready_TMR_0 <= M_AXI_DP_0_rready;
M_AXI_DP_0_rready_TMR_1 <= M_AXI_DP_0_rready;
M_AXI_DP_0_rready_TMR_2 <= M_AXI_DP_0_rready;
M_AXI_DP_0_wdata_TMR_0 <= M_AXI_DP_0_wdata;
M_AXI_DP_0_wdata_TMR_1 <= M_AXI_DP_0_wdata;
M_AXI_DP_0_wdata_TMR_2 <= M_AXI_DP_0_wdata;
M_AXI_DP_0_wstrb_TMR_0 <= M_AXI_DP_0_wstrb;
M_AXI_DP_0_wstrb_TMR_1 <= M_AXI_DP_0_wstrb;
M_AXI_DP_0_wstrb_TMR_2 <= M_AXI_DP_0_wstrb;
M_AXI_DP_0_wvalid_TMR_0 <= M_AXI_DP_0_wvalid;
M_AXI_DP_0_wvalid_TMR_1 <= M_AXI_DP_0_wvalid;
M_AXI_DP_0_wvalid_TMR_2 <= M_AXI_DP_0_wvalid;

mbb_i: component mbb_wrapper
     port map (
      Clk_0 => Clk_0_TMR_0,
      M_AXI_DC_0_araddr(31 downto 0) => M_AXI_DC_0_araddr(31 downto 0),
      M_AXI_DC_0_arburst(1 downto 0) => M_AXI_DC_0_arburst(1 downto 0),
      M_AXI_DC_0_arcache(3 downto 0) => M_AXI_DC_0_arcache(3 downto 0),
      M_AXI_DC_0_arid(0) => M_AXI_DC_0_arid(0),
      M_AXI_DC_0_arlen(7 downto 0) => M_AXI_DC_0_arlen(7 downto 0),
      M_AXI_DC_0_arlock => M_AXI_DC_0_arlock,
      M_AXI_DC_0_arprot(2 downto 0) => M_AXI_DC_0_arprot(2 downto 0),
      M_AXI_DC_0_arqos(3 downto 0) => M_AXI_DC_0_arqos(3 downto 0),
      M_AXI_DC_0_arready => M_AXI_DC_0_arready_TMR_0,
      M_AXI_DC_0_arsize(2 downto 0) => M_AXI_DC_0_arsize(2 downto 0),
      M_AXI_DC_0_arvalid => M_AXI_DC_0_arvalid,
      M_AXI_DC_0_awaddr(31 downto 0) => M_AXI_DC_0_awaddr(31 downto 0),
      M_AXI_DC_0_awburst(1 downto 0) => M_AXI_DC_0_awburst(1 downto 0),
      M_AXI_DC_0_awcache(3 downto 0) => M_AXI_DC_0_awcache(3 downto 0),
      M_AXI_DC_0_awid(0) => M_AXI_DC_0_awid(0),
      M_AXI_DC_0_awlen(7 downto 0) => M_AXI_DC_0_awlen(7 downto 0),
      M_AXI_DC_0_awlock => M_AXI_DC_0_awlock,
      M_AXI_DC_0_awprot(2 downto 0) => M_AXI_DC_0_awprot(2 downto 0),
      M_AXI_DC_0_awqos(3 downto 0) => M_AXI_DC_0_awqos(3 downto 0),
      M_AXI_DC_0_awready => M_AXI_DC_0_awready_TMR_0,
      M_AXI_DC_0_awsize(2 downto 0) => M_AXI_DC_0_awsize(2 downto 0),
      M_AXI_DC_0_awvalid => M_AXI_DC_0_awvalid,
      M_AXI_DC_0_bid(0) => M_AXI_DC_0_bid_TMR_0(0),
      M_AXI_DC_0_bready => M_AXI_DC_0_bready,
      M_AXI_DC_0_bresp(1 downto 0) => M_AXI_DC_0_bresp_TMR_0(1 downto 0),
      M_AXI_DC_0_bvalid => M_AXI_DC_0_bvalid_TMR_0,
      M_AXI_DC_0_rdata(31 downto 0) => M_AXI_DC_0_rdata_TMR_0(31 downto 0),
      M_AXI_DC_0_rid(0) => M_AXI_DC_0_rid_TMR_0(0),
      M_AXI_DC_0_rlast => M_AXI_DC_0_rlast_TMR_0,
      M_AXI_DC_0_rready => M_AXI_DC_0_rready,
      M_AXI_DC_0_rresp(1 downto 0) => M_AXI_DC_0_rresp_TMR_0(1 downto 0),
      M_AXI_DC_0_rvalid => M_AXI_DC_0_rvalid_TMR_0,
      M_AXI_DC_0_wdata(31 downto 0) => M_AXI_DC_0_wdata(31 downto 0),
      M_AXI_DC_0_wlast => M_AXI_DC_0_wlast,
      M_AXI_DC_0_wready => M_AXI_DC_0_wready_TMR_0,
      M_AXI_DC_0_wstrb(3 downto 0) => M_AXI_DC_0_wstrb(3 downto 0),
      M_AXI_DC_0_wvalid => M_AXI_DC_0_wvalid,
      M_AXI_DP_0_araddr(31 downto 0) => M_AXI_DP_0_araddr(31 downto 0),
      M_AXI_DP_0_arprot(2 downto 0) => M_AXI_DP_0_arprot(2 downto 0),
      M_AXI_DP_0_arready => M_AXI_DP_0_arready_TMR_0,
      M_AXI_DP_0_arvalid => M_AXI_DP_0_arvalid,
      M_AXI_DP_0_awaddr(31 downto 0) => M_AXI_DP_0_awaddr(31 downto 0),
      M_AXI_DP_0_awprot(2 downto 0) => M_AXI_DP_0_awprot(2 downto 0),
      M_AXI_DP_0_awready => M_AXI_DP_0_awready_TMR_0,
      M_AXI_DP_0_awvalid => M_AXI_DP_0_awvalid,
      M_AXI_DP_0_bready => M_AXI_DP_0_bready,
      M_AXI_DP_0_bresp(1 downto 0) => M_AXI_DP_0_bresp_TMR_0(1 downto 0),
      M_AXI_DP_0_bvalid => M_AXI_DP_0_bvalid_TMR_0,
      M_AXI_DP_0_rdata(31 downto 0) => M_AXI_DP_0_rdata_TMR_0(31 downto 0),
      M_AXI_DP_0_rready => M_AXI_DP_0_rready,
      M_AXI_DP_0_rresp(1 downto 0) => M_AXI_DP_0_rresp_TMR_0(1 downto 0),
      M_AXI_DP_0_rvalid => M_AXI_DP_0_rvalid_TMR_0,
      M_AXI_DP_0_wdata(31 downto 0) => M_AXI_DP_0_wdata(31 downto 0),
      M_AXI_DP_0_wready => M_AXI_DP_0_wready_TMR_0,
      M_AXI_DP_0_wstrb(3 downto 0) => M_AXI_DP_0_wstrb(3 downto 0),
      M_AXI_DP_0_wvalid => M_AXI_DP_0_wvalid,
      M_AXI_IC_0_araddr(31 downto 0) => M_AXI_IC_0_araddr(31 downto 0),
      M_AXI_IC_0_arburst(1 downto 0) => M_AXI_IC_0_arburst(1 downto 0),
      M_AXI_IC_0_arcache(3 downto 0) => M_AXI_IC_0_arcache(3 downto 0),
      M_AXI_IC_0_arid(0) => M_AXI_IC_0_arid(0),
      M_AXI_IC_0_arlen(7 downto 0) => M_AXI_IC_0_arlen(7 downto 0),
      M_AXI_IC_0_arlock => M_AXI_IC_0_arlock,
      M_AXI_IC_0_arprot(2 downto 0) => M_AXI_IC_0_arprot(2 downto 0),
      M_AXI_IC_0_arqos(3 downto 0) => M_AXI_IC_0_arqos(3 downto 0),
      M_AXI_IC_0_arready => M_AXI_IC_0_arready_TMR_0,
      M_AXI_IC_0_arsize(2 downto 0) => M_AXI_IC_0_arsize(2 downto 0),
      M_AXI_IC_0_arvalid => M_AXI_IC_0_arvalid,
      M_AXI_IC_0_awaddr(31 downto 0) => M_AXI_IC_0_awaddr(31 downto 0),
      M_AXI_IC_0_awburst(1 downto 0) => M_AXI_IC_0_awburst(1 downto 0),
      M_AXI_IC_0_awcache(3 downto 0) => M_AXI_IC_0_awcache(3 downto 0),
      M_AXI_IC_0_awid(0) => M_AXI_IC_0_awid(0),
      M_AXI_IC_0_awlen(7 downto 0) => M_AXI_IC_0_awlen(7 downto 0),
      M_AXI_IC_0_awlock => M_AXI_IC_0_awlock,
      M_AXI_IC_0_awprot(2 downto 0) => M_AXI_IC_0_awprot(2 downto 0),
      M_AXI_IC_0_awqos(3 downto 0) => M_AXI_IC_0_awqos(3 downto 0),
      M_AXI_IC_0_awready => M_AXI_IC_0_awready_TMR_0,
      M_AXI_IC_0_awsize(2 downto 0) => M_AXI_IC_0_awsize(2 downto 0),
      M_AXI_IC_0_awvalid => M_AXI_IC_0_awvalid,
      M_AXI_IC_0_bid(0) => M_AXI_IC_0_bid_TMR_0(0),
      M_AXI_IC_0_bready => M_AXI_IC_0_bready,
      M_AXI_IC_0_bresp(1 downto 0) => M_AXI_IC_0_bresp_TMR_0(1 downto 0),
      M_AXI_IC_0_bvalid => M_AXI_IC_0_bvalid_TMR_0,
      M_AXI_IC_0_rdata(31 downto 0) => M_AXI_IC_0_rdata_TMR_0(31 downto 0),
      M_AXI_IC_0_rid(0) => M_AXI_IC_0_rid_TMR_0(0),
      M_AXI_IC_0_rlast => M_AXI_IC_0_rlast_TMR_0,
      M_AXI_IC_0_rready => M_AXI_IC_0_rready,
      M_AXI_IC_0_rresp(1 downto 0) => M_AXI_IC_0_rresp_TMR_0(1 downto 0),
      M_AXI_IC_0_rvalid => M_AXI_IC_0_rvalid_TMR_0,
      M_AXI_IC_0_wdata(31 downto 0) => M_AXI_IC_0_wdata(31 downto 0),
      M_AXI_IC_0_wlast => M_AXI_IC_0_wlast,
      M_AXI_IC_0_wready => M_AXI_IC_0_wready_TMR_0,
      M_AXI_IC_0_wstrb(3 downto 0) => M_AXI_IC_0_wstrb(3 downto 0),
      M_AXI_IC_0_wvalid => M_AXI_IC_0_wvalid,
      Reset_0 => Reset_0_TMR_0
    );

end Behavioral;
