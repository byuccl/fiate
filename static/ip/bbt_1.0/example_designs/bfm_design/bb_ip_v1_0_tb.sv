
`timescale 1ns / 1ps
`include "bb_ip_v1_0_tb_include.svh"

import axi_vip_pkg::*;
import bb_ip_v1_0_bfm_1_slave_1_0_pkg::*;
import bb_ip_v1_0_bfm_1_slave_2_0_pkg::*;
import bb_ip_v1_0_bfm_1_slave_0_0_pkg::*;

module bb_ip_v1_0_tb();


xil_axi_uint                            error_cnt = 0;
xil_axi_uint                            comparison_cnt = 0;
axi_transaction                         wr_transaction;   
axi_transaction                         rd_transaction;   
axi_monitor_transaction                 mst_monitor_transaction;  
axi_monitor_transaction                 master_moniter_transaction_queue[$];  
xil_axi_uint                            master_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 mst_scb_transaction;  
axi_monitor_transaction                 passthrough_monitor_transaction;  
axi_monitor_transaction                 passthrough_master_moniter_transaction_queue[$];  
xil_axi_uint                            passthrough_master_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 passthrough_mst_scb_transaction;  
axi_monitor_transaction                 passthrough_slave_moniter_transaction_queue[$];  
xil_axi_uint                            passthrough_slave_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 passthrough_slv_scb_transaction;  
axi_monitor_transaction                 slv_monitor_transaction;  
axi_monitor_transaction                 slave_moniter_transaction_queue[$];  
xil_axi_uint                            slave_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 slv_scb_transaction;  
xil_axi_uint                           mst_agent_verbosity = 0;  
xil_axi_uint                           slv_agent_verbosity = 0;  
xil_axi_uint                           passthrough_agent_verbosity = 0;  
bit                                     clock;
bit                                     reset;
xil_axi_ulong                           mem_rd_addr;
xil_axi_ulong                           mem_wr_addr;
bit[32-1:0]                             write_data;
bit                                     write_strb[];
bit[32-1:0]                             read_data;
bb_ip_v1_0_bfm_1_slave_1_0_slv_mem_t          slv_agent_1;
bit error_1;
bit done_1;
bit init_1;
bb_ip_v1_0_bfm_1_slave_2_0_slv_mem_t          slv_agent_2;
bit error_2;
bit done_2;
bit init_2;
bb_ip_v1_0_bfm_1_slave_0_0_slv_mem_t          slv_agent_0;
bit error_0;
bit done_0;
bit init_0;

  `BD_WRAPPER DUT(
      .ARESETN(reset), 
.M_AXI_DC_0_INIT_AXI_TXN(init_1),
.M_AXI_DC_0_TXN_DONE(done_1),
.M_AXI_DC_0_ERROR(error_1),
.M_AXI_IC_0_INIT_AXI_TXN(init_2),
.M_AXI_IC_0_TXN_DONE(done_2),
.M_AXI_IC_0_ERROR(error_2),
.M_AXI_DP_0_INIT_AXI_TXN(init_0),
.M_AXI_DP_0_TXN_DONE(done_0),
.M_AXI_DP_0_ERROR(error_0),
      .ACLK(clock) 
    ); 
  
initial begin
    slv_agent_1 = new("slave vip agent",DUT.`BD_INST_NAME.slave_1.inst.IF);
    slv_agent_1.vif_proxy.set_dummy_drive_type(XIL_AXI_VIF_DRIVE_NONE);
    slv_agent_1.set_agent_tag("Slave VIP");
    slv_agent_1.set_verbosity(slv_agent_verbosity);
    slv_agent_1.start_slave();
    slv_agent_2 = new("slave vip agent",DUT.`BD_INST_NAME.slave_2.inst.IF);
    slv_agent_2.vif_proxy.set_dummy_drive_type(XIL_AXI_VIF_DRIVE_NONE);
    slv_agent_2.set_agent_tag("Slave VIP");
    slv_agent_2.set_verbosity(slv_agent_verbosity);
    slv_agent_2.start_slave();
    slv_agent_0 = new("slave vip agent",DUT.`BD_INST_NAME.slave_0.inst.IF);
    slv_agent_0.vif_proxy.set_dummy_drive_type(XIL_AXI_VIF_DRIVE_NONE);
    slv_agent_0.set_agent_tag("Slave VIP");
    slv_agent_0.set_verbosity(slv_agent_verbosity);
    slv_agent_0.start_slave();
     $timeformat (-12, 1, " ps", 1);
  end
  initial begin
    reset <= 1'b0;
    #200ns;
    reset <= 1'b1;
    repeat (5) @(negedge clock); 
  end
  always #5 clock <= ~clock;
  initial begin
    init_1 = 0;
    #200ns;
    init_1 =1'b1;
    #20ns;
    init_1 = 1'b0;
    $display("EXAMPLE TEST M_AXI_DC_0:");
      wait( done_1 == 1'b1);
      $display("M_AXI_DC_0: PTGEN_TEST_FINISHED!");
      if ( error_1 ) begin
        $display("PTGEN_TEST: FAILED!");
      end else begin
        $display("PTGEN_TEST: PASSED!");
      end
    init_2 = 0;
    #200ns;
    init_2 =1'b1;
    #20ns;
    init_2 = 1'b0;
    $display("EXAMPLE TEST M_AXI_IC_0:");
      wait( done_2 == 1'b1);
      $display("M_AXI_IC_0: PTGEN_TEST_FINISHED!");
      if ( error_2 ) begin
        $display("PTGEN_TEST: FAILED!");
      end else begin
        $display("PTGEN_TEST: PASSED!");
      end
    init_0 = 0;
    #200ns;
    init_0 =1'b1;
    #20ns;
    init_0 = 1'b0;
    $display("EXAMPLE TEST M_AXI_DP_0:");
      wait( done_0 == 1'b1);
      $display("M_AXI_DP_0: PTGEN_TEST_FINISHED!");
      if ( error_0 ) begin
        $display("PTGEN_TEST: FAILED!");
      end else begin
        $display("PTGEN_TEST: PASSED!");
      end
      #1ns;
      $finish;
  end
  initial begin
  #1;
    forever begin
      slv_agent_1.monitor.item_collected_port.get(slv_monitor_transaction);
      slave_moniter_transaction_queue.push_back(slv_monitor_transaction);
      slave_moniter_transaction_queue_size++;
    end
  end
  initial begin
  #1;
    forever begin
      slv_agent_2.monitor.item_collected_port.get(slv_monitor_transaction);
      slave_moniter_transaction_queue.push_back(slv_monitor_transaction);
      slave_moniter_transaction_queue_size++;
    end
  end
  initial begin
  #1;
    forever begin
      slv_agent_0.monitor.item_collected_port.get(slv_monitor_transaction);
      slave_moniter_transaction_queue.push_back(slv_monitor_transaction);
      slave_moniter_transaction_queue_size++;
    end
  end

endmodule
