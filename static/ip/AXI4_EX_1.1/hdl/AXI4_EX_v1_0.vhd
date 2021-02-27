library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXI4_EX_v1_1 is
	generic (
		-- Users to add parameters here
        USE_DYNAMIC_PAGING : boolean := false;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Master Bus Interface M00_AXI
		C_M00_AXI_BASE_ADDR	: std_logic_vector(63 downto 0)	:= x"0000_0040_0000_0000";
		C_M00_AXI_ID_WIDTH	: integer	:= 0;
		C_M00_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M00_AXI_DATA_WIDTH	: integer	:= 32;
		C_M00_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_WUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_RUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_BUSER_WIDTH	: integer	:= 0;

		-- Parameters of Axi Slave Bus Interface S00_AXI
		 C_S00_AXI_ID_WIDTH	: integer	:= 0;
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 6;
		C_S00_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_WUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_RUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_BUSER_WIDTH	: integer	:= 0
	);
	port (
		-- Users to add ports here
        page : in std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Master Bus Interface M00_AXI
		m00_axi_awaddr	: out std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		m00_axi_awlen	: out std_logic_vector(7 downto 0);
		m00_axi_awsize	: out std_logic_vector(2 downto 0);
		m00_axi_awburst	: out std_logic_vector(1 downto 0);
		m00_axi_awlock	: out std_logic;
		m00_axi_awcache	: out std_logic_vector(3 downto 0);
		m00_axi_awprot	: out std_logic_vector(2 downto 0);
		m00_axi_awqos	: out std_logic_vector(3 downto 0);
		m00_axi_awuser	: out std_logic_vector(C_M00_AXI_AWUSER_WIDTH-1 downto 0);
		m00_axi_awvalid	: out std_logic;
		m00_axi_awready	: in std_logic := '0';
		m00_axi_wdata	: out std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0);
		m00_axi_wstrb	: out std_logic_vector(C_M00_AXI_DATA_WIDTH/8-1 downto 0);
		m00_axi_wlast	: out std_logic;
		m00_axi_wuser	: out std_logic_vector(C_M00_AXI_WUSER_WIDTH-1 downto 0);
		m00_axi_wvalid	: out std_logic;
		m00_axi_wready	: in std_logic  := '0';
		m00_axi_bresp	: in std_logic_vector(1 downto 0) := (others=>'0');
		m00_axi_buser	: in std_logic_vector(C_M00_AXI_BUSER_WIDTH-1 downto 0) := (others=>'0');
		m00_axi_bvalid	: in std_logic :='0';
		m00_axi_bready	: out std_logic;
		m00_axi_araddr	: out std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		m00_axi_arlen	: out std_logic_vector(7 downto 0);
		m00_axi_arsize	: out std_logic_vector(2 downto 0);
		m00_axi_arburst	: out std_logic_vector(1 downto 0);
		m00_axi_arlock	: out std_logic;
		m00_axi_arcache	: out std_logic_vector(3 downto 0);
		m00_axi_arprot	: out std_logic_vector(2 downto 0);
		m00_axi_arqos	: out std_logic_vector(3 downto 0);
		m00_axi_aruser	: out std_logic_vector(C_M00_AXI_ARUSER_WIDTH-1 downto 0);
		m00_axi_arvalid	: out std_logic;
		m00_axi_arready	: in std_logic := '0';
		m00_axi_rdata	: in std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
		m00_axi_rresp	: in std_logic_vector(1 downto 0) := (others=>'0');
		m00_axi_rlast	: in std_logic := '0';
		m00_axi_ruser	: in std_logic_vector(C_M00_AXI_RUSER_WIDTH-1 downto 0)  := (others=>'0');
		m00_axi_rvalid	: in std_logic := '0';
		m00_axi_rready	: out std_logic;
		m00_axi_awregion	: out std_logic_vector(3 downto 0);
		m00_axi_arregion	: out std_logic_vector(3 downto 0);

		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk    : in std_logic :='0';
		
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0)  := (others=>'0');
		s00_axi_awlen	: in std_logic_vector(7 downto 0)  := (others=>'0');
		s00_axi_awsize	: in std_logic_vector(2 downto 0)  := (others=>'0');
		s00_axi_awburst	: in std_logic_vector(1 downto 0)  := (others=>'0');
		s00_axi_awlock	: in std_logic  :='0';
		s00_axi_awcache	: in std_logic_vector(3 downto 0) := (others=>'0');
		s00_axi_awprot	: in std_logic_vector(2 downto 0) := (others=>'0');
		s00_axi_awqos	: in std_logic_vector(3 downto 0)  := (others=>'0');
		s00_axi_awregion	: in std_logic_vector(3 downto 0)  := (others=>'0');
		s00_axi_awuser	: in std_logic_vector(C_S00_AXI_AWUSER_WIDTH-1 downto 0)  := (others=>'0');
		s00_axi_awvalid	: in std_logic :='0';
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0)  := (others=>'0');
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0)  := (others=>'0');
		s00_axi_wlast	: in std_logic :='0';
		s00_axi_wuser	: in std_logic_vector(C_S00_AXI_WUSER_WIDTH-1 downto 0)  := (others=>'0');
		s00_axi_wvalid	: in std_logic :='0';
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_buser	: out std_logic_vector(C_S00_AXI_BUSER_WIDTH-1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic := '0';
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0)  := (others=>'0');
		s00_axi_arlen	: in std_logic_vector(7 downto 0)  := (others=>'0');
		s00_axi_arsize	: in std_logic_vector(2 downto 0)  := (others=>'0');
		s00_axi_arburst	: in std_logic_vector(1 downto 0)  := (others=>'0');
		s00_axi_arlock	: in std_logic :='0';
		s00_axi_arcache	: in std_logic_vector(3 downto 0) := (others=>'0');
		s00_axi_arprot	: in std_logic_vector(2 downto 0) := (others=>'0');
		s00_axi_arqos	: in std_logic_vector(3 downto 0) := (others=>'0');
		s00_axi_arregion	: in std_logic_vector(3 downto 0) := (others=>'0');
		s00_axi_aruser	: in std_logic_vector(C_S00_AXI_ARUSER_WIDTH-1 downto 0) := (others=>'0');
		s00_axi_arvalid	: in std_logic :='0';
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rlast	: out std_logic;
		s00_axi_ruser	: out std_logic_vector(C_S00_AXI_RUSER_WIDTH-1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic :='0'
	);
end AXI4_EX_v1_1;

architecture arch_imp of AXI4_EX_v1_1 is
signal extend : std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto C_S00_AXI_ADDR_WIDTH);

begin

        extend <= page(C_M00_AXI_ADDR_WIDTH-1 downto C_S00_AXI_ADDR_WIDTH) when USE_DYNAMIC_PAGING = true else C_M00_AXI_BASE_ADDR(C_M00_AXI_ADDR_WIDTH-1 downto C_S00_AXI_ADDR_WIDTH);

		m00_axi_awaddr	<= extend & s00_axi_awaddr;
		m00_axi_awlen	<= s00_axi_awlen;
		m00_axi_awsize	<= s00_axi_awsize;
		m00_axi_awburst	<= s00_axi_awburst;
		m00_axi_awlock	<= s00_axi_awlock;
		m00_axi_awcache	<= s00_axi_awcache;
		m00_axi_awprot	<= s00_axi_awprot;
		m00_axi_awqos	<= s00_axi_awqos;
		m00_axi_awregion<= s00_axi_awregion;
		m00_axi_awuser	<= s00_axi_awuser;
		m00_axi_awvalid	<= s00_axi_awvalid;
		s00_axi_awready	<= m00_axi_awready;
		m00_axi_wdata	<= s00_axi_wdata;
		m00_axi_wstrb	<= s00_axi_wstrb;
		m00_axi_wlast	<= s00_axi_wlast;
		m00_axi_wuser	<= s00_axi_wuser;
		m00_axi_wvalid	<= s00_axi_wvalid;
		s00_axi_wready	<= m00_axi_wready;
		s00_axi_bresp	<= m00_axi_bresp;
		s00_axi_buser	<= m00_axi_buser;
		s00_axi_bvalid	<= m00_axi_bvalid;
		m00_axi_bready	<= s00_axi_bready;
		m00_axi_araddr	<= extend & s00_axi_araddr;
		m00_axi_arlen	<= s00_axi_arlen;
		m00_axi_arsize	<= s00_axi_arsize;
		m00_axi_arburst	<= s00_axi_arburst;
		m00_axi_arlock	<= s00_axi_arlock;
		m00_axi_arcache	<= s00_axi_arcache;
		m00_axi_arprot	<= s00_axi_arprot;
		m00_axi_arqos	<= s00_axi_arqos;
		m00_axi_arregion<= s00_axi_arregion;
		m00_axi_aruser	<= s00_axi_aruser;
		m00_axi_arvalid	<= s00_axi_arvalid;
		s00_axi_arready	<= m00_axi_arready;
		s00_axi_rdata	<= m00_axi_rdata;
		s00_axi_rresp	<= m00_axi_rresp;
		s00_axi_rlast	<= m00_axi_rlast;
		s00_axi_ruser	<= m00_axi_ruser;
		s00_axi_rvalid	<= m00_axi_rvalid;
		m00_axi_rready	<= s00_axi_rready;


	-- Add user logic here

	-- User logic ends

end arch_imp;
