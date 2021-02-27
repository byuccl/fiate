library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bbt is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Master Bus Interface M_AXI_DP_0
		C_M_AXI_DP_0_START_DATA_VALUE	: std_logic_vector	:= x"AA000000";
		C_M_AXI_DP_0_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"40000000";
		C_M_AXI_DP_0_ADDR_WIDTH	: integer	:= 32;
		C_M_AXI_DP_0_DATA_WIDTH	: integer	:= 32;
		C_M_AXI_DP_0_TRANSACTIONS_NUM	: integer	:= 4;

		-- Parameters of Axi Master Bus Interface M_AXI_DC_0
		C_M_AXI_DC_0_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"40000000";
		C_M_AXI_DC_0_BURST_LEN	: integer	:= 16;
		C_M_AXI_DC_0_ID_WIDTH	: integer	:= 1;
		C_M_AXI_DC_0_ADDR_WIDTH	: integer	:= 32;
		C_M_AXI_DC_0_DATA_WIDTH	: integer	:= 32;
		C_M_AXI_DC_0_AWUSER_WIDTH	: integer	:= 0;
		C_M_AXI_DC_0_ARUSER_WIDTH	: integer	:= 0;
		C_M_AXI_DC_0_WUSER_WIDTH	: integer	:= 0;
		C_M_AXI_DC_0_RUSER_WIDTH	: integer	:= 0;
		C_M_AXI_DC_0_BUSER_WIDTH	: integer	:= 0;

		-- Parameters of Axi Master Bus Interface M_AXI_IC_0
		C_M_AXI_IC_0_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"40000000";
		C_M_AXI_IC_0_BURST_LEN	: integer	:= 16;
		C_M_AXI_IC_0_ID_WIDTH	: integer	:= 1;
		C_M_AXI_IC_0_ADDR_WIDTH	: integer	:= 32;
		C_M_AXI_IC_0_DATA_WIDTH	: integer	:= 32;
		C_M_AXI_IC_0_AWUSER_WIDTH	: integer	:= 0;
		C_M_AXI_IC_0_ARUSER_WIDTH	: integer	:= 0;
		C_M_AXI_IC_0_WUSER_WIDTH	: integer	:= 0;
		C_M_AXI_IC_0_RUSER_WIDTH	: integer	:= 0;
		C_M_AXI_IC_0_BUSER_WIDTH	: integer	:= 0
	);
	port (

    Clk_0_TMR_0 : in STD_LOGIC;
    Clk_0_TMR_1 : in STD_LOGIC;
    Clk_0_TMR_2 : in STD_LOGIC;
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
    M_AXI_DP_0_wvalid : out STD_LOGIC;
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
    Reset_0_TMR_0 : in STD_LOGIC;
    Reset_0_TMR_1 : in STD_LOGIC;
    Reset_0_TMR_2 : in STD_LOGIC
  );
end bbt;

architecture STRUCTURE of bbt is


  ATTRIBUTE X_INTERFACE_INFO : string;
    
				
				
component dut_wrapper is
  port (
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
  end component dut_wrapper;
  
  

  
signal M_AXI_DC_0_araddr_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_araddr_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_araddr_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_arburst_TMR_0 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_arburst_TMR_1 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_arburst_TMR_2 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_arcache_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arcache_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arcache_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arid_TMR_0 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_arid_TMR_1 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_arid_TMR_2 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_arlen_TMR_0 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_arlen_TMR_1 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_arlen_TMR_2 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_arlock_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_arlock_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_arlock_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_arprot_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arprot_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arprot_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arqos_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arqos_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arqos_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_arsize_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arsize_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arsize_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_arvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_arvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_arvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_awaddr_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_awaddr_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_awaddr_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_awburst_TMR_0 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_awburst_TMR_1 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_awburst_TMR_2 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_DC_0_awcache_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awcache_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awcache_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awid_TMR_0 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_awid_TMR_1 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_awid_TMR_2 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_DC_0_awlen_TMR_0 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_awlen_TMR_1 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_awlen_TMR_2 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_DC_0_awlock_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_awlock_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_awlock_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_awprot_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awprot_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awprot_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awqos_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awqos_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awqos_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_awsize_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awsize_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awsize_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DC_0_awvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_awvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_awvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_bready_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_bready_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_bready_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_rready_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_rready_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_rready_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_wdata_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_wdata_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_wdata_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DC_0_wlast_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_wlast_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_wlast_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_wstrb_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_wstrb_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_wstrb_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DC_0_wvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_wvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DC_0_wvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_araddr_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_araddr_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_araddr_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_arburst_TMR_0 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_arburst_TMR_1 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_arburst_TMR_2 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_arcache_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arcache_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arcache_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arid_TMR_0 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_arid_TMR_1 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_arid_TMR_2 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_arlen_TMR_0 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_arlen_TMR_1 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_arlen_TMR_2 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_arlock_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_arlock_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_arlock_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_arprot_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arprot_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arprot_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arqos_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arqos_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arqos_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_arsize_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arsize_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arsize_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_arvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_arvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_arvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_awaddr_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_awaddr_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_awaddr_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_awburst_TMR_0 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_awburst_TMR_1 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_awburst_TMR_2 : STD_LOGIC_VECTOR( 1 downto 0 );
signal M_AXI_IC_0_awcache_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awcache_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awcache_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awid_TMR_0 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_awid_TMR_1 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_awid_TMR_2 : STD_LOGIC_VECTOR( 0 to 0 );
signal M_AXI_IC_0_awlen_TMR_0 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_awlen_TMR_1 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_awlen_TMR_2 : STD_LOGIC_VECTOR( 7 downto 0 );
signal M_AXI_IC_0_awlock_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_awlock_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_awlock_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_awprot_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awprot_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awprot_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awqos_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awqos_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awqos_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_awsize_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awsize_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awsize_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_IC_0_awvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_awvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_awvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_bready_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_bready_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_bready_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_rready_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_rready_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_rready_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_wdata_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_wdata_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_wdata_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_IC_0_wlast_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_wlast_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_wlast_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_wstrb_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_wstrb_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_wstrb_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_IC_0_wvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_wvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_IC_0_wvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_araddr_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_araddr_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_araddr_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_arprot_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_arprot_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_arprot_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_arvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_arvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_arvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_awaddr_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_awaddr_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_awaddr_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_awprot_TMR_0 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_awprot_TMR_1 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_awprot_TMR_2 : STD_LOGIC_VECTOR( 2 downto 0 );
signal M_AXI_DP_0_awvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_awvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_awvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_bready_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_bready_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_bready_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_rready_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_rready_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_rready_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_wdata_TMR_0 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_wdata_TMR_1 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_wdata_TMR_2 : STD_LOGIC_VECTOR( 31 downto 0 );
signal M_AXI_DP_0_wstrb_TMR_0 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DP_0_wstrb_TMR_1 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DP_0_wstrb_TMR_2 : STD_LOGIC_VECTOR( 3 downto 0 );
signal M_AXI_DP_0_wvalid_TMR_0 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_wvalid_TMR_1 : STD_LOGIC_VECTOR (0 to 0);
signal M_AXI_DP_0_wvalid_TMR_2 : STD_LOGIC_VECTOR (0 to 0);
  
begin

voter_i_a3 : entity work.voter
port map (
        A => M_AXI_DC_0_araddr_TMR_0,
        B => M_AXI_DC_0_araddr_TMR_1,
        C => M_AXI_DC_0_araddr_TMR_2,
        D => M_AXI_DC_0_araddr
);
voter_i_a4 : entity work.voter
port map (
        A => M_AXI_DC_0_arburst_TMR_0,
        B => M_AXI_DC_0_arburst_TMR_1,
        C => M_AXI_DC_0_arburst_TMR_2,
        D => M_AXI_DC_0_arburst
);
voter_i_15 : entity work.voter
port map (
        A => M_AXI_DC_0_arcache_TMR_0,
        B => M_AXI_DC_0_arcache_TMR_1,
        C => M_AXI_DC_0_arcache_TMR_2,
        D => M_AXI_DC_0_arcache
);
voter_i_16 : entity work.voter
port map (
        A => M_AXI_DC_0_arid_TMR_0,
        B => M_AXI_DC_0_arid_TMR_1,
        C => M_AXI_DC_0_arid_TMR_2,
        D => M_AXI_DC_0_arid
);
voter_i_17 : entity work.voter
port map (
        A => M_AXI_DC_0_arlen_TMR_0,
        B => M_AXI_DC_0_arlen_TMR_1,
        C => M_AXI_DC_0_arlen_TMR_2,
        D => M_AXI_DC_0_arlen
);
voter_i_18 : entity work.voter
port map (
        A => M_AXI_DC_0_arlock_TMR_0,
        B => M_AXI_DC_0_arlock_TMR_1,
        C => M_AXI_DC_0_arlock_TMR_2,
        D(0) => M_AXI_DC_0_arlock
);
voter_i_19 : entity work.voter
port map (
        A => M_AXI_DC_0_arprot_TMR_0,
        B => M_AXI_DC_0_arprot_TMR_1,
        C => M_AXI_DC_0_arprot_TMR_2,
        D => M_AXI_DC_0_arprot
);
voter_i_20 : entity work.voter
port map (
        A => M_AXI_DC_0_arqos_TMR_0,
        B => M_AXI_DC_0_arqos_TMR_1,
        C => M_AXI_DC_0_arqos_TMR_2,
        D => M_AXI_DC_0_arqos
);
voter_i_21 : entity work.voter
port map (
        A => M_AXI_DC_0_arsize_TMR_0,
        B => M_AXI_DC_0_arsize_TMR_1,
        C => M_AXI_DC_0_arsize_TMR_2,
        D => M_AXI_DC_0_arsize
);
voter_i_22 : entity work.voter
port map (
        A => M_AXI_DC_0_arvalid_TMR_0,
        B => M_AXI_DC_0_arvalid_TMR_1,
        C => M_AXI_DC_0_arvalid_TMR_2,
        D(0) => M_AXI_DC_0_arvalid
);
voter_i_23 : entity work.voter
port map (
        A => M_AXI_DC_0_awaddr_TMR_0,
        B => M_AXI_DC_0_awaddr_TMR_1,
        C => M_AXI_DC_0_awaddr_TMR_2,
        D => M_AXI_DC_0_awaddr
);
voter_i_24 : entity work.voter
port map (
        A => M_AXI_DC_0_awburst_TMR_0,
        B => M_AXI_DC_0_awburst_TMR_1,
        C => M_AXI_DC_0_awburst_TMR_2,
        D => M_AXI_DC_0_awburst
);
voter_i_25 : entity work.voter
port map (
        A => M_AXI_DC_0_awcache_TMR_0,
        B => M_AXI_DC_0_awcache_TMR_1,
        C => M_AXI_DC_0_awcache_TMR_2,
        D => M_AXI_DC_0_awcache
);
voter_i_26 : entity work.voter
port map (
        A => M_AXI_DC_0_awid_TMR_0,
        B => M_AXI_DC_0_awid_TMR_1,
        C => M_AXI_DC_0_awid_TMR_2,
        D => M_AXI_DC_0_awid
);
voter_i_27 : entity work.voter
port map (
        A => M_AXI_DC_0_awlen_TMR_0,
        B => M_AXI_DC_0_awlen_TMR_1,
        C => M_AXI_DC_0_awlen_TMR_2,
        D => M_AXI_DC_0_awlen
);
voter_i_28 : entity work.voter
port map (
        A => M_AXI_DC_0_awlock_TMR_0,
        B => M_AXI_DC_0_awlock_TMR_1,
        C => M_AXI_DC_0_awlock_TMR_2,
        D(0) => M_AXI_DC_0_awlock
);
voter_i_29 : entity work.voter
port map (
        A => M_AXI_DC_0_awprot_TMR_0,
        B => M_AXI_DC_0_awprot_TMR_1,
        C => M_AXI_DC_0_awprot_TMR_2,
        D => M_AXI_DC_0_awprot
);
voter_i_30 : entity work.voter
port map (
        A => M_AXI_DC_0_awqos_TMR_0,
        B => M_AXI_DC_0_awqos_TMR_1,
        C => M_AXI_DC_0_awqos_TMR_2,
        D => M_AXI_DC_0_awqos
);
voter_i_31 : entity work.voter
port map (
        A => M_AXI_DC_0_awsize_TMR_0,
        B => M_AXI_DC_0_awsize_TMR_1,
        C => M_AXI_DC_0_awsize_TMR_2,
        D => M_AXI_DC_0_awsize
);
voter_i_32 : entity work.voter
port map (
        A => M_AXI_DC_0_awvalid_TMR_0,
        B => M_AXI_DC_0_awvalid_TMR_1,
        C => M_AXI_DC_0_awvalid_TMR_2,
        D(0) => M_AXI_DC_0_awvalid
);
voter_i_33 : entity work.voter
port map (
        A => M_AXI_DC_0_bready_TMR_0,
        B => M_AXI_DC_0_bready_TMR_1,
        C => M_AXI_DC_0_bready_TMR_2,
        D(0) => M_AXI_DC_0_bready
);
voter_i_34 : entity work.voter
port map (
        A => M_AXI_DC_0_rready_TMR_0,
        B => M_AXI_DC_0_rready_TMR_1,
        C => M_AXI_DC_0_rready_TMR_2,
        D(0) => M_AXI_DC_0_rready
);
voter_i_35 : entity work.voter
port map (
        A => M_AXI_DC_0_wdata_TMR_0,
        B => M_AXI_DC_0_wdata_TMR_1,
        C => M_AXI_DC_0_wdata_TMR_2,
        D => M_AXI_DC_0_wdata
);
voter_i_36 : entity work.voter
port map (
        A => M_AXI_DC_0_wlast_TMR_0,
        B => M_AXI_DC_0_wlast_TMR_1,
        C => M_AXI_DC_0_wlast_TMR_2,
        D(0) => M_AXI_DC_0_wlast
);
voter_i_37 : entity work.voter
port map (
        A => M_AXI_DC_0_wstrb_TMR_0,
        B => M_AXI_DC_0_wstrb_TMR_1,
        C => M_AXI_DC_0_wstrb_TMR_2,
        D => M_AXI_DC_0_wstrb
);
voter_i_38 : entity work.voter
port map (
        A => M_AXI_DC_0_wvalid_TMR_0,
        B => M_AXI_DC_0_wvalid_TMR_1,
        C => M_AXI_DC_0_wvalid_TMR_2,
        D(0) => M_AXI_DC_0_wvalid
);
voter_i_39 : entity work.voter
port map (
        A => M_AXI_IC_0_araddr_TMR_0,
        B => M_AXI_IC_0_araddr_TMR_1,
        C => M_AXI_IC_0_araddr_TMR_2,
        D => M_AXI_IC_0_araddr
);
voter_i_40 : entity work.voter
port map (
        A => M_AXI_IC_0_arburst_TMR_0,
        B => M_AXI_IC_0_arburst_TMR_1,
        C => M_AXI_IC_0_arburst_TMR_2,
        D => M_AXI_IC_0_arburst
);
voter_i_41 : entity work.voter
port map (
        A => M_AXI_IC_0_arcache_TMR_0,
        B => M_AXI_IC_0_arcache_TMR_1,
        C => M_AXI_IC_0_arcache_TMR_2,
        D => M_AXI_IC_0_arcache
);
voter_i_42 : entity work.voter
port map (
        A => M_AXI_IC_0_arid_TMR_0,
        B => M_AXI_IC_0_arid_TMR_1,
        C => M_AXI_IC_0_arid_TMR_2,
        D => M_AXI_IC_0_arid
);
voter_i_43 : entity work.voter
port map (
        A => M_AXI_IC_0_arlen_TMR_0,
        B => M_AXI_IC_0_arlen_TMR_1,
        C => M_AXI_IC_0_arlen_TMR_2,
        D => M_AXI_IC_0_arlen
);
voter_i_44 : entity work.voter
port map (
        A => M_AXI_IC_0_arlock_TMR_0,
        B => M_AXI_IC_0_arlock_TMR_1,
        C => M_AXI_IC_0_arlock_TMR_2,
        D(0) => M_AXI_IC_0_arlock
);
voter_i_45 : entity work.voter
port map (
        A => M_AXI_IC_0_arprot_TMR_0,
        B => M_AXI_IC_0_arprot_TMR_1,
        C => M_AXI_IC_0_arprot_TMR_2,
        D => M_AXI_IC_0_arprot
);
voter_i_46 : entity work.voter
port map (
        A => M_AXI_IC_0_arqos_TMR_0,
        B => M_AXI_IC_0_arqos_TMR_1,
        C => M_AXI_IC_0_arqos_TMR_2,
        D => M_AXI_IC_0_arqos
);
voter_i_47 : entity work.voter
port map (
        A => M_AXI_IC_0_arsize_TMR_0,
        B => M_AXI_IC_0_arsize_TMR_1,
        C => M_AXI_IC_0_arsize_TMR_2,
        D => M_AXI_IC_0_arsize
);
voter_i_48 : entity work.voter
port map (
        A => M_AXI_IC_0_arvalid_TMR_0,
        B => M_AXI_IC_0_arvalid_TMR_1,
        C => M_AXI_IC_0_arvalid_TMR_2,
        D(0) => M_AXI_IC_0_arvalid
);
voter_i_49 : entity work.voter
port map (
        A => M_AXI_IC_0_awaddr_TMR_0,
        B => M_AXI_IC_0_awaddr_TMR_1,
        C => M_AXI_IC_0_awaddr_TMR_2,
        D => M_AXI_IC_0_awaddr
);
voter_i_50 : entity work.voter
port map (
        A => M_AXI_IC_0_awburst_TMR_0,
        B => M_AXI_IC_0_awburst_TMR_1,
        C => M_AXI_IC_0_awburst_TMR_2,
        D => M_AXI_IC_0_awburst
);
voter_i_51 : entity work.voter
port map (
        A => M_AXI_IC_0_awcache_TMR_0,
        B => M_AXI_IC_0_awcache_TMR_1,
        C => M_AXI_IC_0_awcache_TMR_2,
        D => M_AXI_IC_0_awcache
);
voter_i_52 : entity work.voter
port map (
        A => M_AXI_IC_0_awid_TMR_0,
        B => M_AXI_IC_0_awid_TMR_1,
        C => M_AXI_IC_0_awid_TMR_2,
        D => M_AXI_IC_0_awid
);
voter_i_53 : entity work.voter
port map (
        A => M_AXI_IC_0_awlen_TMR_0,
        B => M_AXI_IC_0_awlen_TMR_1,
        C => M_AXI_IC_0_awlen_TMR_2,
        D => M_AXI_IC_0_awlen
);
voter_i_54 : entity work.voter
port map (
        A => M_AXI_IC_0_awlock_TMR_0,
        B => M_AXI_IC_0_awlock_TMR_1,
        C => M_AXI_IC_0_awlock_TMR_2,
        D(0) => M_AXI_IC_0_awlock
);
voter_i_55 : entity work.voter
port map (
        A => M_AXI_IC_0_awprot_TMR_0,
        B => M_AXI_IC_0_awprot_TMR_1,
        C => M_AXI_IC_0_awprot_TMR_2,
        D => M_AXI_IC_0_awprot
);
voter_i_56 : entity work.voter
port map (
        A => M_AXI_IC_0_awqos_TMR_0,
        B => M_AXI_IC_0_awqos_TMR_1,
        C => M_AXI_IC_0_awqos_TMR_2,
        D => M_AXI_IC_0_awqos
);
voter_i_57 : entity work.voter
port map (
        A => M_AXI_IC_0_awsize_TMR_0,
        B => M_AXI_IC_0_awsize_TMR_1,
        C => M_AXI_IC_0_awsize_TMR_2,
        D => M_AXI_IC_0_awsize
);
voter_i_58 : entity work.voter
port map (
        A => M_AXI_IC_0_awvalid_TMR_0,
        B => M_AXI_IC_0_awvalid_TMR_1,
        C => M_AXI_IC_0_awvalid_TMR_2,
        D(0) => M_AXI_IC_0_awvalid
);
voter_i_59 : entity work.voter
port map (
        A => M_AXI_IC_0_bready_TMR_0,
        B => M_AXI_IC_0_bready_TMR_1,
        C => M_AXI_IC_0_bready_TMR_2,
        D(0) => M_AXI_IC_0_bready
);
voter_i_60 : entity work.voter
port map (
        A => M_AXI_IC_0_rready_TMR_0,
        B => M_AXI_IC_0_rready_TMR_1,
        C => M_AXI_IC_0_rready_TMR_2,
        D(0) => M_AXI_IC_0_rready
);
voter_i_61 : entity work.voter
port map (
        A => M_AXI_IC_0_wdata_TMR_0,
        B => M_AXI_IC_0_wdata_TMR_1,
        C => M_AXI_IC_0_wdata_TMR_2,
        D => M_AXI_IC_0_wdata
);
voter_i_62 : entity work.voter
port map (
        A => M_AXI_IC_0_wlast_TMR_0,
        B => M_AXI_IC_0_wlast_TMR_1,
        C => M_AXI_IC_0_wlast_TMR_2,
        D(0) => M_AXI_IC_0_wlast
);
voter_i_63 : entity work.voter
port map (
        A => M_AXI_IC_0_wstrb_TMR_0,
        B => M_AXI_IC_0_wstrb_TMR_1,
        C => M_AXI_IC_0_wstrb_TMR_2,
        D => M_AXI_IC_0_wstrb
);
voter_i_64 : entity work.voter
port map (
        A => M_AXI_IC_0_wvalid_TMR_0,
        B => M_AXI_IC_0_wvalid_TMR_1,
        C => M_AXI_IC_0_wvalid_TMR_2,
        D(0) => M_AXI_IC_0_wvalid
);
voter_i_65 : entity work.voter
port map (
        A => M_AXI_DP_0_araddr_TMR_0,
        B => M_AXI_DP_0_araddr_TMR_1,
        C => M_AXI_DP_0_araddr_TMR_2,
        D => M_AXI_DP_0_araddr
);
voter_i_66 : entity work.voter
port map (
        A => M_AXI_DP_0_arprot_TMR_0,
        B => M_AXI_DP_0_arprot_TMR_1,
        C => M_AXI_DP_0_arprot_TMR_2,
        D => M_AXI_DP_0_arprot
);
voter_i_67 : entity work.voter
port map (
        A => M_AXI_DP_0_arvalid_TMR_0,
        B => M_AXI_DP_0_arvalid_TMR_1,
        C => M_AXI_DP_0_arvalid_TMR_2,
        D(0) => M_AXI_DP_0_arvalid
);
voter_i_68 : entity work.voter
port map (
        A => M_AXI_DP_0_awaddr_TMR_0,
        B => M_AXI_DP_0_awaddr_TMR_1,
        C => M_AXI_DP_0_awaddr_TMR_2,
        D => M_AXI_DP_0_awaddr
);
voter_i_69 : entity work.voter
port map (
        A => M_AXI_DP_0_awprot_TMR_0,
        B => M_AXI_DP_0_awprot_TMR_1,
        C => M_AXI_DP_0_awprot_TMR_2,
        D => M_AXI_DP_0_awprot
);
voter_i_70 : entity work.voter
port map (
        A => M_AXI_DP_0_awvalid_TMR_0,
        B => M_AXI_DP_0_awvalid_TMR_1,
        C => M_AXI_DP_0_awvalid_TMR_2,
        D(0) => M_AXI_DP_0_awvalid
);
voter_i_71 : entity work.voter
port map (
        A => M_AXI_DP_0_bready_TMR_0,
        B => M_AXI_DP_0_bready_TMR_1,
        C => M_AXI_DP_0_bready_TMR_2,
        D(0) => M_AXI_DP_0_bready
);
voter_i_72 : entity work.voter
port map (
        A => M_AXI_DP_0_rready_TMR_0,
        B => M_AXI_DP_0_rready_TMR_1,
        C => M_AXI_DP_0_rready_TMR_2,
        D(0) => M_AXI_DP_0_rready
);
voter_i_73 : entity work.voter
port map (
        A => M_AXI_DP_0_wdata_TMR_0,
        B => M_AXI_DP_0_wdata_TMR_1,
        C => M_AXI_DP_0_wdata_TMR_2,
        D => M_AXI_DP_0_wdata
);
voter_i_74 : entity work.voter
port map (
        A => M_AXI_DP_0_wstrb_TMR_0,
        B => M_AXI_DP_0_wstrb_TMR_1,
        C => M_AXI_DP_0_wstrb_TMR_2,
        D => M_AXI_DP_0_wstrb
);
voter_i_75 : entity work.voter
port map (
        A => M_AXI_DP_0_wvalid_TMR_0,
        B => M_AXI_DP_0_wvalid_TMR_1,
        C => M_AXI_DP_0_wvalid_TMR_2,
        D(0) => M_AXI_DP_0_wvalid
);

mbb_i: component dut_wrapper
     port map (
      Clk_0_TMR_0 => Clk_0_TMR_0,
      Clk_0_TMR_1 => Clk_0_TMR_1,
      Clk_0_TMR_2 => Clk_0_TMR_2,
M_AXI_DC_0_araddr_TMR_0 => M_AXI_DC_0_araddr_TMR_0,
M_AXI_DC_0_araddr_TMR_1 => M_AXI_DC_0_araddr_TMR_1,
M_AXI_DC_0_araddr_TMR_2 => M_AXI_DC_0_araddr_TMR_2,
M_AXI_DC_0_arburst_TMR_0 => M_AXI_DC_0_arburst_TMR_0,
M_AXI_DC_0_arburst_TMR_1 => M_AXI_DC_0_arburst_TMR_1,
M_AXI_DC_0_arburst_TMR_2 => M_AXI_DC_0_arburst_TMR_2,
M_AXI_DC_0_arcache_TMR_0 => M_AXI_DC_0_arcache_TMR_0,
M_AXI_DC_0_arcache_TMR_1 => M_AXI_DC_0_arcache_TMR_1,
M_AXI_DC_0_arcache_TMR_2 => M_AXI_DC_0_arcache_TMR_2,
M_AXI_DC_0_arid_TMR_0 => M_AXI_DC_0_arid_TMR_0,
M_AXI_DC_0_arid_TMR_1 => M_AXI_DC_0_arid_TMR_1,
M_AXI_DC_0_arid_TMR_2 => M_AXI_DC_0_arid_TMR_2,
M_AXI_DC_0_arlen_TMR_0 => M_AXI_DC_0_arlen_TMR_0,
M_AXI_DC_0_arlen_TMR_1 => M_AXI_DC_0_arlen_TMR_1,
M_AXI_DC_0_arlen_TMR_2 => M_AXI_DC_0_arlen_TMR_2,
M_AXI_DC_0_arlock_TMR_0 => M_AXI_DC_0_arlock_TMR_0(0),
M_AXI_DC_0_arlock_TMR_1 => M_AXI_DC_0_arlock_TMR_1(0),
M_AXI_DC_0_arlock_TMR_2 => M_AXI_DC_0_arlock_TMR_2(0),
M_AXI_DC_0_arprot_TMR_0 => M_AXI_DC_0_arprot_TMR_0,
M_AXI_DC_0_arprot_TMR_1 => M_AXI_DC_0_arprot_TMR_1,
M_AXI_DC_0_arprot_TMR_2 => M_AXI_DC_0_arprot_TMR_2,
M_AXI_DC_0_arqos_TMR_0 => M_AXI_DC_0_arqos_TMR_0,
M_AXI_DC_0_arqos_TMR_1 => M_AXI_DC_0_arqos_TMR_1,
M_AXI_DC_0_arqos_TMR_2 => M_AXI_DC_0_arqos_TMR_2,
M_AXI_DC_0_arready_TMR_0 => M_AXI_DC_0_arready,
M_AXI_DC_0_arready_TMR_1 => M_AXI_DC_0_arready,
M_AXI_DC_0_arready_TMR_2 => M_AXI_DC_0_arready,
M_AXI_DC_0_arsize_TMR_0 => M_AXI_DC_0_arsize_TMR_0,
M_AXI_DC_0_arsize_TMR_1 => M_AXI_DC_0_arsize_TMR_1,
M_AXI_DC_0_arsize_TMR_2 => M_AXI_DC_0_arsize_TMR_2,
M_AXI_DC_0_arvalid_TMR_0 => M_AXI_DC_0_arvalid_TMR_0(0),
M_AXI_DC_0_arvalid_TMR_1 => M_AXI_DC_0_arvalid_TMR_1(0),
M_AXI_DC_0_arvalid_TMR_2 => M_AXI_DC_0_arvalid_TMR_2(0),
M_AXI_DC_0_awaddr_TMR_0 => M_AXI_DC_0_awaddr_TMR_0,
M_AXI_DC_0_awaddr_TMR_1 => M_AXI_DC_0_awaddr_TMR_1,
M_AXI_DC_0_awaddr_TMR_2 => M_AXI_DC_0_awaddr_TMR_2,
M_AXI_DC_0_awburst_TMR_0 => M_AXI_DC_0_awburst_TMR_0,
M_AXI_DC_0_awburst_TMR_1 => M_AXI_DC_0_awburst_TMR_1,
M_AXI_DC_0_awburst_TMR_2 => M_AXI_DC_0_awburst_TMR_2,
M_AXI_DC_0_awcache_TMR_0 => M_AXI_DC_0_awcache_TMR_0,
M_AXI_DC_0_awcache_TMR_1 => M_AXI_DC_0_awcache_TMR_1,
M_AXI_DC_0_awcache_TMR_2 => M_AXI_DC_0_awcache_TMR_2,
M_AXI_DC_0_awid_TMR_0 => M_AXI_DC_0_awid_TMR_0,
M_AXI_DC_0_awid_TMR_1 => M_AXI_DC_0_awid_TMR_1,
M_AXI_DC_0_awid_TMR_2 => M_AXI_DC_0_awid_TMR_2,
M_AXI_DC_0_awlen_TMR_0 => M_AXI_DC_0_awlen_TMR_0,
M_AXI_DC_0_awlen_TMR_1 => M_AXI_DC_0_awlen_TMR_1,
M_AXI_DC_0_awlen_TMR_2 => M_AXI_DC_0_awlen_TMR_2,
M_AXI_DC_0_awlock_TMR_0 => M_AXI_DC_0_awlock_TMR_0(0),
M_AXI_DC_0_awlock_TMR_1 => M_AXI_DC_0_awlock_TMR_1(0),
M_AXI_DC_0_awlock_TMR_2 => M_AXI_DC_0_awlock_TMR_2(0),
M_AXI_DC_0_awprot_TMR_0 => M_AXI_DC_0_awprot_TMR_0,
M_AXI_DC_0_awprot_TMR_1 => M_AXI_DC_0_awprot_TMR_1,
M_AXI_DC_0_awprot_TMR_2 => M_AXI_DC_0_awprot_TMR_2,
M_AXI_DC_0_awqos_TMR_0 => M_AXI_DC_0_awqos_TMR_0,
M_AXI_DC_0_awqos_TMR_1 => M_AXI_DC_0_awqos_TMR_1,
M_AXI_DC_0_awqos_TMR_2 => M_AXI_DC_0_awqos_TMR_2,
M_AXI_DC_0_awready_TMR_0 => M_AXI_DC_0_awready,
M_AXI_DC_0_awready_TMR_1 => M_AXI_DC_0_awready,
M_AXI_DC_0_awready_TMR_2 => M_AXI_DC_0_awready,
M_AXI_DC_0_awsize_TMR_0 => M_AXI_DC_0_awsize_TMR_0,
M_AXI_DC_0_awsize_TMR_1 => M_AXI_DC_0_awsize_TMR_1,
M_AXI_DC_0_awsize_TMR_2 => M_AXI_DC_0_awsize_TMR_2,
M_AXI_DC_0_awvalid_TMR_0 => M_AXI_DC_0_awvalid_TMR_0(0),
M_AXI_DC_0_awvalid_TMR_1 => M_AXI_DC_0_awvalid_TMR_1(0),
M_AXI_DC_0_awvalid_TMR_2 => M_AXI_DC_0_awvalid_TMR_2(0),
M_AXI_DC_0_bid_TMR_0 => M_AXI_DC_0_bid,
M_AXI_DC_0_bid_TMR_1 => M_AXI_DC_0_bid,
M_AXI_DC_0_bid_TMR_2 => M_AXI_DC_0_bid,
M_AXI_DC_0_bready_TMR_0 => M_AXI_DC_0_bready_TMR_0(0),
M_AXI_DC_0_bready_TMR_1 => M_AXI_DC_0_bready_TMR_1(0),
M_AXI_DC_0_bready_TMR_2 => M_AXI_DC_0_bready_TMR_2(0),
M_AXI_DC_0_bresp_TMR_0 => M_AXI_DC_0_bresp,
M_AXI_DC_0_bresp_TMR_1 => M_AXI_DC_0_bresp,
M_AXI_DC_0_bresp_TMR_2 => M_AXI_DC_0_bresp,
M_AXI_DC_0_bvalid_TMR_0 => M_AXI_DC_0_bvalid,
M_AXI_DC_0_bvalid_TMR_1 => M_AXI_DC_0_bvalid,
M_AXI_DC_0_bvalid_TMR_2 => M_AXI_DC_0_bvalid,
M_AXI_DC_0_rdata_TMR_0 => M_AXI_DC_0_rdata,
M_AXI_DC_0_rdata_TMR_1 => M_AXI_DC_0_rdata,
M_AXI_DC_0_rdata_TMR_2 => M_AXI_DC_0_rdata,
M_AXI_DC_0_rid_TMR_0 => M_AXI_DC_0_rid,
M_AXI_DC_0_rid_TMR_1 => M_AXI_DC_0_rid,
M_AXI_DC_0_rid_TMR_2 => M_AXI_DC_0_rid,
M_AXI_DC_0_rlast_TMR_0 => M_AXI_DC_0_rlast,
M_AXI_DC_0_rlast_TMR_1 => M_AXI_DC_0_rlast,
M_AXI_DC_0_rlast_TMR_2 => M_AXI_DC_0_rlast,
M_AXI_DC_0_rready_TMR_0 => M_AXI_DC_0_rready_TMR_0(0),
M_AXI_DC_0_rready_TMR_1 => M_AXI_DC_0_rready_TMR_1(0),
M_AXI_DC_0_rready_TMR_2 => M_AXI_DC_0_rready_TMR_2(0),
M_AXI_DC_0_rresp_TMR_0 => M_AXI_DC_0_rresp,
M_AXI_DC_0_rresp_TMR_1 => M_AXI_DC_0_rresp,
M_AXI_DC_0_rresp_TMR_2 => M_AXI_DC_0_rresp,
M_AXI_DC_0_rvalid_TMR_0 => M_AXI_DC_0_rvalid,
M_AXI_DC_0_rvalid_TMR_1 => M_AXI_DC_0_rvalid,
M_AXI_DC_0_rvalid_TMR_2 => M_AXI_DC_0_rvalid,
M_AXI_DC_0_wdata_TMR_0 => M_AXI_DC_0_wdata_TMR_0,
M_AXI_DC_0_wdata_TMR_1 => M_AXI_DC_0_wdata_TMR_1,
M_AXI_DC_0_wdata_TMR_2 => M_AXI_DC_0_wdata_TMR_2,
M_AXI_DC_0_wlast_TMR_0 => M_AXI_DC_0_wlast_TMR_0(0),
M_AXI_DC_0_wlast_TMR_1 => M_AXI_DC_0_wlast_TMR_1(0),
M_AXI_DC_0_wlast_TMR_2 => M_AXI_DC_0_wlast_TMR_2(0),
M_AXI_DC_0_wready_TMR_0 => M_AXI_DC_0_wready,
M_AXI_DC_0_wready_TMR_1 => M_AXI_DC_0_wready,
M_AXI_DC_0_wready_TMR_2 => M_AXI_DC_0_wready,
M_AXI_DC_0_wstrb_TMR_0 => M_AXI_DC_0_wstrb_TMR_0,
M_AXI_DC_0_wstrb_TMR_1 => M_AXI_DC_0_wstrb_TMR_1,
M_AXI_DC_0_wstrb_TMR_2 => M_AXI_DC_0_wstrb_TMR_2,
M_AXI_DC_0_wvalid_TMR_0 => M_AXI_DC_0_wvalid_TMR_0(0),
M_AXI_DC_0_wvalid_TMR_1 => M_AXI_DC_0_wvalid_TMR_1(0),
M_AXI_DC_0_wvalid_TMR_2 => M_AXI_DC_0_wvalid_TMR_2(0),
M_AXI_IC_0_araddr_TMR_0 => M_AXI_IC_0_araddr_TMR_0,
M_AXI_IC_0_araddr_TMR_1 => M_AXI_IC_0_araddr_TMR_1,
M_AXI_IC_0_araddr_TMR_2 => M_AXI_IC_0_araddr_TMR_2,
M_AXI_IC_0_arburst_TMR_0 => M_AXI_IC_0_arburst_TMR_0,
M_AXI_IC_0_arburst_TMR_1 => M_AXI_IC_0_arburst_TMR_1,
M_AXI_IC_0_arburst_TMR_2 => M_AXI_IC_0_arburst_TMR_2,
M_AXI_IC_0_arcache_TMR_0 => M_AXI_IC_0_arcache_TMR_0,
M_AXI_IC_0_arcache_TMR_1 => M_AXI_IC_0_arcache_TMR_1,
M_AXI_IC_0_arcache_TMR_2 => M_AXI_IC_0_arcache_TMR_2,
M_AXI_IC_0_arid_TMR_0 => M_AXI_IC_0_arid_TMR_0,
M_AXI_IC_0_arid_TMR_1 => M_AXI_IC_0_arid_TMR_1,
M_AXI_IC_0_arid_TMR_2 => M_AXI_IC_0_arid_TMR_2,
M_AXI_IC_0_arlen_TMR_0 => M_AXI_IC_0_arlen_TMR_0,
M_AXI_IC_0_arlen_TMR_1 => M_AXI_IC_0_arlen_TMR_1,
M_AXI_IC_0_arlen_TMR_2 => M_AXI_IC_0_arlen_TMR_2,
M_AXI_IC_0_arlock_TMR_0 => M_AXI_IC_0_arlock_TMR_0(0),
M_AXI_IC_0_arlock_TMR_1 => M_AXI_IC_0_arlock_TMR_1(0),
M_AXI_IC_0_arlock_TMR_2 => M_AXI_IC_0_arlock_TMR_2(0),
M_AXI_IC_0_arprot_TMR_0 => M_AXI_IC_0_arprot_TMR_0,
M_AXI_IC_0_arprot_TMR_1 => M_AXI_IC_0_arprot_TMR_1,
M_AXI_IC_0_arprot_TMR_2 => M_AXI_IC_0_arprot_TMR_2,
M_AXI_IC_0_arqos_TMR_0 => M_AXI_IC_0_arqos_TMR_0,
M_AXI_IC_0_arqos_TMR_1 => M_AXI_IC_0_arqos_TMR_1,
M_AXI_IC_0_arqos_TMR_2 => M_AXI_IC_0_arqos_TMR_2,
M_AXI_IC_0_arready_TMR_0 => M_AXI_IC_0_arready,
M_AXI_IC_0_arready_TMR_1 => M_AXI_IC_0_arready,
M_AXI_IC_0_arready_TMR_2 => M_AXI_IC_0_arready,
M_AXI_IC_0_arsize_TMR_0 => M_AXI_IC_0_arsize_TMR_0,
M_AXI_IC_0_arsize_TMR_1 => M_AXI_IC_0_arsize_TMR_1,
M_AXI_IC_0_arsize_TMR_2 => M_AXI_IC_0_arsize_TMR_2,
M_AXI_IC_0_arvalid_TMR_0 => M_AXI_IC_0_arvalid_TMR_0(0),
M_AXI_IC_0_arvalid_TMR_1 => M_AXI_IC_0_arvalid_TMR_1(0),
M_AXI_IC_0_arvalid_TMR_2 => M_AXI_IC_0_arvalid_TMR_2(0),
M_AXI_IC_0_awaddr_TMR_0 => M_AXI_IC_0_awaddr_TMR_0,
M_AXI_IC_0_awaddr_TMR_1 => M_AXI_IC_0_awaddr_TMR_1,
M_AXI_IC_0_awaddr_TMR_2 => M_AXI_IC_0_awaddr_TMR_2,
M_AXI_IC_0_awburst_TMR_0 => M_AXI_IC_0_awburst_TMR_0,
M_AXI_IC_0_awburst_TMR_1 => M_AXI_IC_0_awburst_TMR_1,
M_AXI_IC_0_awburst_TMR_2 => M_AXI_IC_0_awburst_TMR_2,
M_AXI_IC_0_awcache_TMR_0 => M_AXI_IC_0_awcache_TMR_0,
M_AXI_IC_0_awcache_TMR_1 => M_AXI_IC_0_awcache_TMR_1,
M_AXI_IC_0_awcache_TMR_2 => M_AXI_IC_0_awcache_TMR_2,
M_AXI_IC_0_awid_TMR_0 => M_AXI_IC_0_awid_TMR_0,
M_AXI_IC_0_awid_TMR_1 => M_AXI_IC_0_awid_TMR_1,
M_AXI_IC_0_awid_TMR_2 => M_AXI_IC_0_awid_TMR_2,
M_AXI_IC_0_awlen_TMR_0 => M_AXI_IC_0_awlen_TMR_0,
M_AXI_IC_0_awlen_TMR_1 => M_AXI_IC_0_awlen_TMR_1,
M_AXI_IC_0_awlen_TMR_2 => M_AXI_IC_0_awlen_TMR_2,
M_AXI_IC_0_awlock_TMR_0 => M_AXI_IC_0_awlock_TMR_0(0),
M_AXI_IC_0_awlock_TMR_1 => M_AXI_IC_0_awlock_TMR_1(0),
M_AXI_IC_0_awlock_TMR_2 => M_AXI_IC_0_awlock_TMR_2(0),
M_AXI_IC_0_awprot_TMR_0 => M_AXI_IC_0_awprot_TMR_0,
M_AXI_IC_0_awprot_TMR_1 => M_AXI_IC_0_awprot_TMR_1,
M_AXI_IC_0_awprot_TMR_2 => M_AXI_IC_0_awprot_TMR_2,
M_AXI_IC_0_awqos_TMR_0 => M_AXI_IC_0_awqos_TMR_0,
M_AXI_IC_0_awqos_TMR_1 => M_AXI_IC_0_awqos_TMR_1,
M_AXI_IC_0_awqos_TMR_2 => M_AXI_IC_0_awqos_TMR_2,
M_AXI_IC_0_awready_TMR_0 => M_AXI_IC_0_awready,
M_AXI_IC_0_awready_TMR_1 => M_AXI_IC_0_awready,
M_AXI_IC_0_awready_TMR_2 => M_AXI_IC_0_awready,
M_AXI_IC_0_awsize_TMR_0 => M_AXI_IC_0_awsize_TMR_0,
M_AXI_IC_0_awsize_TMR_1 => M_AXI_IC_0_awsize_TMR_1,
M_AXI_IC_0_awsize_TMR_2 => M_AXI_IC_0_awsize_TMR_2,
M_AXI_IC_0_awvalid_TMR_0 => M_AXI_IC_0_awvalid_TMR_0(0),
M_AXI_IC_0_awvalid_TMR_1 => M_AXI_IC_0_awvalid_TMR_1(0),
M_AXI_IC_0_awvalid_TMR_2 => M_AXI_IC_0_awvalid_TMR_2(0),
M_AXI_IC_0_bid_TMR_0 => M_AXI_IC_0_bid,
M_AXI_IC_0_bid_TMR_1 => M_AXI_IC_0_bid,
M_AXI_IC_0_bid_TMR_2 => M_AXI_IC_0_bid,
M_AXI_IC_0_bready_TMR_0 => M_AXI_IC_0_bready_TMR_0(0),
M_AXI_IC_0_bready_TMR_1 => M_AXI_IC_0_bready_TMR_1(0),
M_AXI_IC_0_bready_TMR_2 => M_AXI_IC_0_bready_TMR_2(0),
M_AXI_IC_0_bresp_TMR_0 => M_AXI_IC_0_bresp,
M_AXI_IC_0_bresp_TMR_1 => M_AXI_IC_0_bresp,
M_AXI_IC_0_bresp_TMR_2 => M_AXI_IC_0_bresp,
M_AXI_IC_0_bvalid_TMR_0 => M_AXI_IC_0_bvalid,
M_AXI_IC_0_bvalid_TMR_1 => M_AXI_IC_0_bvalid,
M_AXI_IC_0_bvalid_TMR_2 => M_AXI_IC_0_bvalid,
M_AXI_IC_0_rdata_TMR_0 => M_AXI_IC_0_rdata,
M_AXI_IC_0_rdata_TMR_1 => M_AXI_IC_0_rdata,
M_AXI_IC_0_rdata_TMR_2 => M_AXI_IC_0_rdata,
M_AXI_IC_0_rid_TMR_0 => M_AXI_IC_0_rid,
M_AXI_IC_0_rid_TMR_1 => M_AXI_IC_0_rid,
M_AXI_IC_0_rid_TMR_2 => M_AXI_IC_0_rid,
M_AXI_IC_0_rlast_TMR_0 => M_AXI_IC_0_rlast,
M_AXI_IC_0_rlast_TMR_1 => M_AXI_IC_0_rlast,
M_AXI_IC_0_rlast_TMR_2 => M_AXI_IC_0_rlast,
M_AXI_IC_0_rready_TMR_0 => M_AXI_IC_0_rready_TMR_0(0),
M_AXI_IC_0_rready_TMR_1 => M_AXI_IC_0_rready_TMR_1(0),
M_AXI_IC_0_rready_TMR_2 => M_AXI_IC_0_rready_TMR_2(0),
M_AXI_IC_0_rresp_TMR_0 => M_AXI_IC_0_rresp,
M_AXI_IC_0_rresp_TMR_1 => M_AXI_IC_0_rresp,
M_AXI_IC_0_rresp_TMR_2 => M_AXI_IC_0_rresp,
M_AXI_IC_0_rvalid_TMR_0 => M_AXI_IC_0_rvalid,
M_AXI_IC_0_rvalid_TMR_1 => M_AXI_IC_0_rvalid,
M_AXI_IC_0_rvalid_TMR_2 => M_AXI_IC_0_rvalid,
M_AXI_IC_0_wdata_TMR_0 => M_AXI_IC_0_wdata_TMR_0,
M_AXI_IC_0_wdata_TMR_1 => M_AXI_IC_0_wdata_TMR_1,
M_AXI_IC_0_wdata_TMR_2 => M_AXI_IC_0_wdata_TMR_2,
M_AXI_IC_0_wlast_TMR_0 => M_AXI_IC_0_wlast_TMR_0(0),
M_AXI_IC_0_wlast_TMR_1 => M_AXI_IC_0_wlast_TMR_1(0),
M_AXI_IC_0_wlast_TMR_2 => M_AXI_IC_0_wlast_TMR_2(0),
M_AXI_IC_0_wready_TMR_0 => M_AXI_IC_0_wready,
M_AXI_IC_0_wready_TMR_1 => M_AXI_IC_0_wready,
M_AXI_IC_0_wready_TMR_2 => M_AXI_IC_0_wready,
M_AXI_IC_0_wstrb_TMR_0 => M_AXI_IC_0_wstrb_TMR_0,
M_AXI_IC_0_wstrb_TMR_1 => M_AXI_IC_0_wstrb_TMR_1,
M_AXI_IC_0_wstrb_TMR_2 => M_AXI_IC_0_wstrb_TMR_2,
M_AXI_IC_0_wvalid_TMR_0 => M_AXI_IC_0_wvalid_TMR_0(0),
M_AXI_IC_0_wvalid_TMR_1 => M_AXI_IC_0_wvalid_TMR_1(0),
M_AXI_IC_0_wvalid_TMR_2 => M_AXI_IC_0_wvalid_TMR_2(0),
M_AXI_DP_0_araddr_TMR_0 => M_AXI_DP_0_araddr_TMR_0,
M_AXI_DP_0_araddr_TMR_1 => M_AXI_DP_0_araddr_TMR_1,
M_AXI_DP_0_araddr_TMR_2 => M_AXI_DP_0_araddr_TMR_2,
M_AXI_DP_0_arprot_TMR_0 => M_AXI_DP_0_arprot_TMR_0,
M_AXI_DP_0_arprot_TMR_1 => M_AXI_DP_0_arprot_TMR_1,
M_AXI_DP_0_arprot_TMR_2 => M_AXI_DP_0_arprot_TMR_2,
M_AXI_DP_0_arready_TMR_0 => M_AXI_DP_0_arready,
M_AXI_DP_0_arready_TMR_1 => M_AXI_DP_0_arready,
M_AXI_DP_0_arready_TMR_2 => M_AXI_DP_0_arready,
M_AXI_DP_0_arvalid_TMR_0 => M_AXI_DP_0_arvalid_TMR_0(0),
M_AXI_DP_0_arvalid_TMR_1 => M_AXI_DP_0_arvalid_TMR_1(0),
M_AXI_DP_0_arvalid_TMR_2 => M_AXI_DP_0_arvalid_TMR_2(0),
M_AXI_DP_0_awaddr_TMR_0 => M_AXI_DP_0_awaddr_TMR_0,
M_AXI_DP_0_awaddr_TMR_1 => M_AXI_DP_0_awaddr_TMR_1,
M_AXI_DP_0_awaddr_TMR_2 => M_AXI_DP_0_awaddr_TMR_2,
M_AXI_DP_0_awprot_TMR_0 => M_AXI_DP_0_awprot_TMR_0,
M_AXI_DP_0_awprot_TMR_1 => M_AXI_DP_0_awprot_TMR_1,
M_AXI_DP_0_awprot_TMR_2 => M_AXI_DP_0_awprot_TMR_2,
M_AXI_DP_0_awready_TMR_0 => M_AXI_DP_0_awready,
M_AXI_DP_0_awready_TMR_1 => M_AXI_DP_0_awready,
M_AXI_DP_0_awready_TMR_2 => M_AXI_DP_0_awready,
M_AXI_DP_0_awvalid_TMR_0 => M_AXI_DP_0_awvalid_TMR_0(0),
M_AXI_DP_0_awvalid_TMR_1 => M_AXI_DP_0_awvalid_TMR_1(0),
M_AXI_DP_0_awvalid_TMR_2 => M_AXI_DP_0_awvalid_TMR_2(0),
M_AXI_DP_0_bready_TMR_0 => M_AXI_DP_0_bready_TMR_0(0),
M_AXI_DP_0_bready_TMR_1 => M_AXI_DP_0_bready_TMR_1(0),
M_AXI_DP_0_bready_TMR_2 => M_AXI_DP_0_bready_TMR_2(0),
M_AXI_DP_0_bresp_TMR_0 => M_AXI_DP_0_bresp,
M_AXI_DP_0_bresp_TMR_1 => M_AXI_DP_0_bresp,
M_AXI_DP_0_bresp_TMR_2 => M_AXI_DP_0_bresp,
M_AXI_DP_0_bvalid_TMR_0 => M_AXI_DP_0_bvalid,
M_AXI_DP_0_bvalid_TMR_1 => M_AXI_DP_0_bvalid,
M_AXI_DP_0_bvalid_TMR_2 => M_AXI_DP_0_bvalid,
M_AXI_DP_0_rdata_TMR_0 => M_AXI_DP_0_rdata,
M_AXI_DP_0_rdata_TMR_1 => M_AXI_DP_0_rdata,
M_AXI_DP_0_rdata_TMR_2 => M_AXI_DP_0_rdata,
M_AXI_DP_0_rready_TMR_0 => M_AXI_DP_0_rready_TMR_0(0),
M_AXI_DP_0_rready_TMR_1 => M_AXI_DP_0_rready_TMR_1(0),
M_AXI_DP_0_rready_TMR_2 => M_AXI_DP_0_rready_TMR_2(0),
M_AXI_DP_0_rresp_TMR_0 => M_AXI_DP_0_rresp,
M_AXI_DP_0_rresp_TMR_1 => M_AXI_DP_0_rresp,
M_AXI_DP_0_rresp_TMR_2 => M_AXI_DP_0_rresp,
M_AXI_DP_0_rvalid_TMR_0 => M_AXI_DP_0_rvalid,
M_AXI_DP_0_rvalid_TMR_1 => M_AXI_DP_0_rvalid,
M_AXI_DP_0_rvalid_TMR_2 => M_AXI_DP_0_rvalid,
M_AXI_DP_0_wdata_TMR_0 => M_AXI_DP_0_wdata_TMR_0,
M_AXI_DP_0_wdata_TMR_1 => M_AXI_DP_0_wdata_TMR_1,
M_AXI_DP_0_wdata_TMR_2 => M_AXI_DP_0_wdata_TMR_2,
M_AXI_DP_0_wready_TMR_0 => M_AXI_DP_0_wready,
M_AXI_DP_0_wready_TMR_1 => M_AXI_DP_0_wready,
M_AXI_DP_0_wready_TMR_2 => M_AXI_DP_0_wready,
M_AXI_DP_0_wstrb_TMR_0 => M_AXI_DP_0_wstrb_TMR_0,
M_AXI_DP_0_wstrb_TMR_1 => M_AXI_DP_0_wstrb_TMR_1,
M_AXI_DP_0_wstrb_TMR_2 => M_AXI_DP_0_wstrb_TMR_2,
M_AXI_DP_0_wvalid_TMR_0 => M_AXI_DP_0_wvalid_TMR_0(0),
M_AXI_DP_0_wvalid_TMR_1 => M_AXI_DP_0_wvalid_TMR_1(0),
M_AXI_DP_0_wvalid_TMR_2 => M_AXI_DP_0_wvalid_TMR_2(0),
      Reset_0_TMR_0 => Reset_0_TMR_0,
      Reset_0_TMR_1 => Reset_0_TMR_1,
      Reset_0_TMR_2 => Reset_0_TMR_2
    );
    
end STRUCTURE;
