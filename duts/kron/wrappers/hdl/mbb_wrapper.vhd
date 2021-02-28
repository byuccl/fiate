--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Wed Apr  8 07:58:54 2020
--Host        : CB459-EE11237 running 64-bit major release  (build 9200)
--Command     : generate_target mbb_wrapper.bd
--Design      : mbb_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbb_wrapper is
  port (
    Clk_0 : in STD_LOGIC;
    M_AXI_DC_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 ) := (others=>'0');
    M_AXI_DC_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 ) := (others=>'0');
    M_AXI_DC_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 ) := (others=>'0');
    M_AXI_DC_0_arid : out STD_LOGIC_VECTOR ( 0 to 0 ):= (others=>'0');
    M_AXI_DC_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 ):= (others=>'0');
    M_AXI_DC_0_arlock : out STD_LOGIC :='0';
    M_AXI_DC_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_DC_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_DC_0_arready : in STD_LOGIC;
    M_AXI_DC_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_DC_0_arvalid : out STD_LOGIC :='0';
    M_AXI_DC_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awid : out STD_LOGIC_VECTOR ( 0 to 0 ):= (others=>'0');
    M_AXI_DC_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awlock : out STD_LOGIC :='0';
    M_AXI_DC_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awready : in STD_LOGIC;
    M_AXI_DC_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_DC_0_awvalid : out STD_LOGIC :='0';
    M_AXI_DC_0_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_bready : out STD_LOGIC :='0';
    M_AXI_DC_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 ):= (others=>'0');
    M_AXI_DC_0_bvalid : in STD_LOGIC;
    M_AXI_DC_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 ):= (others=>'0');
    M_AXI_DC_0_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_DC_0_rlast : in STD_LOGIC;
    M_AXI_DC_0_rready : out STD_LOGIC :='0';
    M_AXI_DC_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 ):= (others=>'0');
    M_AXI_DC_0_rvalid : in STD_LOGIC;
    M_AXI_DC_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 ):= (others=>'0');
    M_AXI_DC_0_wlast : out STD_LOGIC :='0';
    M_AXI_DC_0_wready : in STD_LOGIC;
    M_AXI_DC_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_DC_0_wvalid : out STD_LOGIC :='0';
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
    M_AXI_IC_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arid : out STD_LOGIC_VECTOR ( 0 to 0 ):= (others=>'0');
    M_AXI_IC_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arlock : out STD_LOGIC :='0';
    M_AXI_IC_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arready : in STD_LOGIC :='0';
    M_AXI_IC_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_IC_0_arvalid : out STD_LOGIC :='0';
    M_AXI_IC_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awid : out STD_LOGIC_VECTOR ( 0 to 0 ):= (others=>'0');
    M_AXI_IC_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awlock : out STD_LOGIC :='0';
    M_AXI_IC_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awready : in STD_LOGIC;
    M_AXI_IC_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 ):= (others=>'0');
    M_AXI_IC_0_awvalid : out STD_LOGIC :='0';
    M_AXI_IC_0_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_bready : out STD_LOGIC :='0';
    M_AXI_IC_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_bvalid : in STD_LOGIC;
    M_AXI_IC_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_IC_0_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_IC_0_rlast : in STD_LOGIC;
    M_AXI_IC_0_rready : out STD_LOGIC :='0';
    M_AXI_IC_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_IC_0_rvalid : in STD_LOGIC;
    M_AXI_IC_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 ):= (others=>'0');
    M_AXI_IC_0_wlast : out STD_LOGIC :='0';
    M_AXI_IC_0_wready : in STD_LOGIC;
    M_AXI_IC_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 ):= (others=>'0');
    M_AXI_IC_0_wvalid : out STD_LOGIC :='0';
    Reset_0 : in STD_LOGIC
  );
end mbb_wrapper;

architecture STRUCTURE of mbb_wrapper is
  component kronos is
  port (
    Reset_0 : in STD_LOGIC;
    Clk_0 : in STD_LOGIC;
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
  end component kronos;
begin

mbb_i: component kronos
     port map (
      Clk_0 => Clk_0,
      M_AXI_DP_0_araddr(31 downto 0) => M_AXI_DP_0_araddr(31 downto 0),
      M_AXI_DP_0_arprot(2 downto 0) => M_AXI_DP_0_arprot(2 downto 0),
      M_AXI_DP_0_arready => M_AXI_DP_0_arready,
      M_AXI_DP_0_arvalid => M_AXI_DP_0_arvalid,
      M_AXI_DP_0_awaddr(31 downto 0) => M_AXI_DP_0_awaddr(31 downto 0),
      M_AXI_DP_0_awprot(2 downto 0) => M_AXI_DP_0_awprot(2 downto 0),
      M_AXI_DP_0_awready => M_AXI_DP_0_awready,
      M_AXI_DP_0_awvalid => M_AXI_DP_0_awvalid,
      M_AXI_DP_0_bready => M_AXI_DP_0_bready,
      M_AXI_DP_0_bresp(1 downto 0) => M_AXI_DP_0_bresp(1 downto 0),
      M_AXI_DP_0_bvalid => M_AXI_DP_0_bvalid,
      M_AXI_DP_0_rdata(31 downto 0) => M_AXI_DP_0_rdata(31 downto 0),
      M_AXI_DP_0_rready => M_AXI_DP_0_rready,
      M_AXI_DP_0_rresp(1 downto 0) => M_AXI_DP_0_rresp(1 downto 0),
      M_AXI_DP_0_rvalid => M_AXI_DP_0_rvalid,
      M_AXI_DP_0_wdata(31 downto 0) => M_AXI_DP_0_wdata(31 downto 0),
      M_AXI_DP_0_wready => M_AXI_DP_0_wready,
      M_AXI_DP_0_wstrb(3 downto 0) => M_AXI_DP_0_wstrb(3 downto 0),
      M_AXI_DP_0_wvalid => M_AXI_DP_0_wvalid,
      Reset_0 => Reset_0
    );
end STRUCTURE;
