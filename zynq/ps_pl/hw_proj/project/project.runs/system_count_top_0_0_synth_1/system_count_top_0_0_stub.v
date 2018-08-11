// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4_sdx (win64) Build 1806307 Thu Mar  9 15:24:31 MST 2017
// Date        : Sat Aug 11 17:33:53 2018
// Host        : jmcui-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_count_top_0_0_stub.v
// Design      : system_count_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "count_top,Vivado 2016.4_sdx" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(CLK, RST_N, GATE, PMT, INTR, COUNTER, CLEAR)
/* synthesis syn_black_box black_box_pad_pin="CLK,RST_N,GATE,PMT,INTR,COUNTER[7:0],CLEAR" */;
  input CLK;
  input RST_N;
  input GATE;
  input PMT;
  output INTR;
  output [7:0]COUNTER;
  output CLEAR;
endmodule
