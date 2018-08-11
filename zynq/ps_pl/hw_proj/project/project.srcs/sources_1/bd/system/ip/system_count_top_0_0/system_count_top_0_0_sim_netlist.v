// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4_sdx (win64) Build 1806307 Thu Mar  9 15:24:31 MST 2017
// Date        : Sat Aug 11 17:33:53 2018
// Host        : jmcui-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               d:/Users/jmcui/workspace/ps_pl6/ps_pl6/ps_pl/hw_proj/project/project.srcs/sources_1/bd/system/ip/system_count_top_0_0/system_count_top_0_0_sim_netlist.v
// Design      : system_count_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_count_top_0_0,count_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "count_top,Vivado 2016.4_sdx" *) 
(* NotValidForBitStream *)
module system_count_top_0_0
   (CLK,
    RST_N,
    GATE,
    PMT,
    INTR,
    COUNTER,
    CLEAR);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST_N RST" *) input RST_N;
  input GATE;
  input PMT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR INTERRUPT" *) output INTR;
  output [7:0]COUNTER;
  output CLEAR;

  wire CLEAR;
  wire CLK;
  wire [7:0]COUNTER;
  wire GATE;
  wire INTR;
  wire PMT;
  wire RST_N;

  system_count_top_0_0_count_top inst
       (.CLEAR(CLEAR),
        .CLK(CLK),
        .COUNTER(COUNTER),
        .GATE(GATE),
        .INTR(INTR),
        .PMT(PMT),
        .RST_N(RST_N));
endmodule

(* ORIG_REF_NAME = "clk_div_33k" *) 
module system_count_top_0_0_clk_div_33k
   (CLK_33K,
    E,
    CLK,
    AR,
    GATE,
    clk33_signal_1);
  output CLK_33K;
  output [0:0]E;
  input CLK;
  input [0:0]AR;
  input GATE;
  input clk33_signal_1;

  wire [0:0]AR;
  wire CLK;
  wire CLK_33K;
  wire CLK_33K_i_1_n_0;
  wire CLK_33K_i_2_n_0;
  wire [0:0]E;
  wire GATE;
  wire clk33_signal_1;
  wire [10:0]cnt;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[0]_i_2_n_0 ;
  wire \cnt[10]_i_1_n_0 ;
  wire \cnt[10]_i_2_n_0 ;
  wire \cnt[10]_i_3_n_0 ;
  wire \cnt[10]_i_4_n_0 ;
  wire \cnt[10]_i_5_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[4]_i_1_n_0 ;
  wire \cnt[5]_i_1_n_0 ;
  wire \cnt[5]_i_2_n_0 ;
  wire \cnt[6]_i_1_n_0 ;
  wire \cnt[7]_i_1_n_0 ;
  wire \cnt[7]_i_2_n_0 ;
  wire \cnt[8]_i_1_n_0 ;
  wire \cnt[8]_i_2_n_0 ;
  wire \cnt[9]_i_1_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    CLK_33K_i_1
       (.I0(CLK_33K_i_2_n_0),
        .I1(CLK_33K),
        .O(CLK_33K_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    CLK_33K_i_2
       (.I0(\cnt[10]_i_4_n_0 ),
        .I1(cnt[5]),
        .I2(cnt[1]),
        .I3(cnt[10]),
        .I4(cnt[9]),
        .I5(cnt[0]),
        .O(CLK_33K_i_2_n_0));
  FDPE CLK_33K_reg
       (.C(CLK),
        .CE(1'b1),
        .D(CLK_33K_i_1_n_0),
        .PRE(AR),
        .Q(CLK_33K));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \COUNTER[7]_i_1 
       (.I0(GATE),
        .I1(CLK_33K),
        .I2(clk33_signal_1),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .I1(GATE),
        .I2(\cnt[0]_i_2_n_0 ),
        .O(\cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \cnt[0]_i_2 
       (.I0(cnt[9]),
        .I1(cnt[10]),
        .I2(cnt[1]),
        .I3(cnt[5]),
        .I4(\cnt[10]_i_4_n_0 ),
        .O(\cnt[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h88882888)) 
    \cnt[10]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[10]),
        .I2(cnt[9]),
        .I3(\cnt[10]_i_3_n_0 ),
        .I4(\cnt[10]_i_4_n_0 ),
        .O(\cnt[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt[10]_i_2 
       (.I0(cnt[0]),
        .I1(\cnt[10]_i_5_n_0 ),
        .I2(\cnt[10]_i_4_n_0 ),
        .I3(GATE),
        .O(\cnt[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \cnt[10]_i_3 
       (.I0(cnt[1]),
        .I1(cnt[0]),
        .I2(cnt[5]),
        .O(\cnt[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \cnt[10]_i_4 
       (.I0(cnt[7]),
        .I1(cnt[4]),
        .I2(cnt[2]),
        .I3(cnt[3]),
        .I4(cnt[6]),
        .I5(cnt[8]),
        .O(\cnt[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \cnt[10]_i_5 
       (.I0(cnt[5]),
        .I1(cnt[1]),
        .I2(cnt[10]),
        .I3(cnt[9]),
        .O(\cnt[10]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \cnt[1]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[1]),
        .I2(cnt[0]),
        .O(\cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \cnt[2]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[2]),
        .I2(cnt[0]),
        .I3(cnt[1]),
        .O(\cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \cnt[3]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[3]),
        .I2(cnt[1]),
        .I3(cnt[0]),
        .I4(cnt[2]),
        .O(\cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \cnt[4]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[4]),
        .I2(cnt[1]),
        .I3(cnt[0]),
        .I4(cnt[3]),
        .I5(cnt[2]),
        .O(\cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \cnt[5]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[5]),
        .I2(\cnt[5]_i_2_n_0 ),
        .I3(cnt[4]),
        .I4(cnt[2]),
        .I5(cnt[3]),
        .O(\cnt[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[5]_i_2 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .O(\cnt[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \cnt[6]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[6]),
        .I2(\cnt[10]_i_3_n_0 ),
        .I3(cnt[4]),
        .I4(cnt[2]),
        .I5(cnt[3]),
        .O(\cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888888828888888)) 
    \cnt[7]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[7]),
        .I2(cnt[5]),
        .I3(cnt[0]),
        .I4(cnt[1]),
        .I5(\cnt[7]_i_2_n_0 ),
        .O(\cnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \cnt[7]_i_2 
       (.I0(cnt[4]),
        .I1(cnt[2]),
        .I2(cnt[3]),
        .I3(cnt[6]),
        .O(\cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8888888828888888)) 
    \cnt[8]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[8]),
        .I2(cnt[5]),
        .I3(cnt[0]),
        .I4(cnt[1]),
        .I5(\cnt[8]_i_2_n_0 ),
        .O(\cnt[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \cnt[8]_i_2 
       (.I0(cnt[6]),
        .I1(cnt[3]),
        .I2(cnt[2]),
        .I3(cnt[4]),
        .I4(cnt[7]),
        .O(\cnt[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8888888828888888)) 
    \cnt[9]_i_1 
       (.I0(\cnt[10]_i_2_n_0 ),
        .I1(cnt[9]),
        .I2(cnt[5]),
        .I3(cnt[0]),
        .I4(cnt[1]),
        .I5(\cnt[10]_i_4_n_0 ),
        .O(\cnt[9]_i_1_n_0 ));
  FDCE \cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt[0]));
  FDCE \cnt_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[10]_i_1_n_0 ),
        .Q(cnt[10]));
  FDCE \cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt[1]));
  FDCE \cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt[2]));
  FDCE \cnt_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[3]_i_1_n_0 ),
        .Q(cnt[3]));
  FDCE \cnt_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[4]_i_1_n_0 ),
        .Q(cnt[4]));
  FDCE \cnt_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[5]_i_1_n_0 ),
        .Q(cnt[5]));
  FDCE \cnt_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[6]_i_1_n_0 ),
        .Q(cnt[6]));
  FDCE \cnt_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[7]_i_1_n_0 ),
        .Q(cnt[7]));
  FDCE \cnt_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[8]_i_1_n_0 ),
        .Q(cnt[8]));
  FDCE \cnt_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\cnt[9]_i_1_n_0 ),
        .Q(cnt[9]));
endmodule

(* ORIG_REF_NAME = "count_top" *) 
module system_count_top_0_0_count_top
   (COUNTER,
    INTR,
    CLEAR,
    CLK,
    GATE,
    PMT,
    RST_N);
  output [7:0]COUNTER;
  output INTR;
  output CLEAR;
  input CLK;
  input GATE;
  input PMT;
  input RST_N;

  wire CLEAR;
  wire CLK;
  wire CLK_33K;
  wire [7:0]COUNTER;
  wire GATE;
  wire INTR;
  wire PMT;
  wire RST_N;
  wire clk33_signal_1;
  wire clk_div_33k_n_1;
  wire counter_n_1;

  system_count_top_0_0_clk_div_33k clk_div_33k
       (.AR(counter_n_1),
        .CLK(CLK),
        .CLK_33K(CLK_33K),
        .E(clk_div_33k_n_1),
        .GATE(GATE),
        .clk33_signal_1(clk33_signal_1));
  system_count_top_0_0_counter counter
       (.AR(counter_n_1),
        .CLEAR(CLEAR),
        .CLK(CLK),
        .CLK_33K(CLK_33K),
        .COUNTER(COUNTER),
        .E(clk_div_33k_n_1),
        .GATE(GATE),
        .INTR(INTR),
        .PMT(PMT),
        .RST_N(RST_N),
        .clk33_signal_1(clk33_signal_1));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module system_count_top_0_0_counter
   (clk33_signal_1,
    AR,
    INTR,
    CLEAR,
    COUNTER,
    CLK_33K,
    CLK,
    GATE,
    PMT,
    RST_N,
    E);
  output clk33_signal_1;
  output [0:0]AR;
  output INTR;
  output CLEAR;
  output [7:0]COUNTER;
  input CLK_33K;
  input CLK;
  input GATE;
  input PMT;
  input RST_N;
  input [0:0]E;

  wire [0:0]AR;
  wire CLEAR;
  wire CLEAR_i_1_n_0;
  wire CLK;
  wire CLK_33K;
  wire [7:0]COUNT;
  wire [7:0]COUNTER;
  wire \COUNT[4]_i_2_n_0 ;
  wire \COUNT[5]_i_2_n_0 ;
  wire \COUNT[7]_i_1_n_0 ;
  wire \COUNT[7]_i_3_n_0 ;
  wire [0:0]E;
  wire GATE;
  wire INTR;
  wire INTR_i_1_n_0;
  wire PMT;
  wire RST_N;
  wire clk33_signal_1;
  wire [7:0]p_1_in;
  wire pulse_signal_1;
  wire signal_1;

  LUT3 #(
    .INIT(8'h74)) 
    CLEAR_i_1
       (.I0(GATE),
        .I1(RST_N),
        .I2(CLEAR),
        .O(CLEAR_i_1_n_0));
  FDRE CLEAR_reg
       (.C(CLK),
        .CE(1'b1),
        .D(CLEAR_i_1_n_0),
        .Q(CLEAR),
        .R(1'b0));
  FDCE \COUNTER_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[0]),
        .Q(COUNTER[0]));
  FDCE \COUNTER_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[1]),
        .Q(COUNTER[1]));
  FDCE \COUNTER_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[2]),
        .Q(COUNTER[2]));
  FDCE \COUNTER_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[3]),
        .Q(COUNTER[3]));
  FDCE \COUNTER_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[4]),
        .Q(COUNTER[4]));
  FDCE \COUNTER_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[5]),
        .Q(COUNTER[5]));
  FDCE \COUNTER_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[6]),
        .Q(COUNTER[6]));
  FDCE \COUNTER_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(COUNT[7]),
        .Q(COUNTER[7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \COUNT[0]_i_1 
       (.I0(GATE),
        .I1(signal_1),
        .I2(COUNT[0]),
        .O(p_1_in[0]));
  LUT3 #(
    .INIT(8'h28)) 
    \COUNT[1]_i_1 
       (.I0(\COUNT[4]_i_2_n_0 ),
        .I1(COUNT[1]),
        .I2(COUNT[0]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \COUNT[2]_i_1 
       (.I0(\COUNT[4]_i_2_n_0 ),
        .I1(COUNT[2]),
        .I2(COUNT[0]),
        .I3(COUNT[1]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \COUNT[3]_i_1 
       (.I0(\COUNT[4]_i_2_n_0 ),
        .I1(COUNT[3]),
        .I2(COUNT[1]),
        .I3(COUNT[0]),
        .I4(COUNT[2]),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \COUNT[4]_i_1 
       (.I0(\COUNT[4]_i_2_n_0 ),
        .I1(COUNT[4]),
        .I2(COUNT[2]),
        .I3(COUNT[0]),
        .I4(COUNT[1]),
        .I5(COUNT[3]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hDFDF00DF)) 
    \COUNT[4]_i_2 
       (.I0(COUNT[7]),
        .I1(\COUNT[7]_i_3_n_0 ),
        .I2(COUNT[6]),
        .I3(GATE),
        .I4(signal_1),
        .O(\COUNT[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB00B)) 
    \COUNT[5]_i_1 
       (.I0(signal_1),
        .I1(GATE),
        .I2(COUNT[5]),
        .I3(\COUNT[5]_i_2_n_0 ),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \COUNT[5]_i_2 
       (.I0(COUNT[3]),
        .I1(COUNT[1]),
        .I2(COUNT[0]),
        .I3(COUNT[2]),
        .I4(COUNT[4]),
        .O(\COUNT[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hB00B)) 
    \COUNT[6]_i_1 
       (.I0(signal_1),
        .I1(GATE),
        .I2(COUNT[6]),
        .I3(\COUNT[7]_i_3_n_0 ),
        .O(p_1_in[6]));
  LUT4 #(
    .INIT(16'h40F0)) 
    \COUNT[7]_i_1 
       (.I0(pulse_signal_1),
        .I1(PMT),
        .I2(GATE),
        .I3(signal_1),
        .O(\COUNT[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hB00BB0B0)) 
    \COUNT[7]_i_2 
       (.I0(signal_1),
        .I1(GATE),
        .I2(COUNT[7]),
        .I3(\COUNT[7]_i_3_n_0 ),
        .I4(COUNT[6]),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \COUNT[7]_i_3 
       (.I0(COUNT[4]),
        .I1(COUNT[2]),
        .I2(COUNT[0]),
        .I3(COUNT[1]),
        .I4(COUNT[3]),
        .I5(COUNT[5]),
        .O(\COUNT[7]_i_3_n_0 ));
  FDCE \COUNT_reg[0] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[0]),
        .Q(COUNT[0]));
  FDCE \COUNT_reg[1] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[1]),
        .Q(COUNT[1]));
  FDCE \COUNT_reg[2] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[2]),
        .Q(COUNT[2]));
  FDCE \COUNT_reg[3] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[3]),
        .Q(COUNT[3]));
  FDCE \COUNT_reg[4] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[4]),
        .Q(COUNT[4]));
  FDCE \COUNT_reg[5] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[5]),
        .Q(COUNT[5]));
  FDCE \COUNT_reg[6] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[6]),
        .Q(COUNT[6]));
  FDCE \COUNT_reg[7] 
       (.C(CLK),
        .CE(\COUNT[7]_i_1_n_0 ),
        .CLR(AR),
        .D(p_1_in[7]),
        .Q(COUNT[7]));
  LUT4 #(
    .INIT(16'h2F20)) 
    INTR_i_1
       (.I0(CLK_33K),
        .I1(clk33_signal_1),
        .I2(GATE),
        .I3(INTR),
        .O(INTR_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    INTR_i_2
       (.I0(RST_N),
        .O(AR));
  FDCE INTR_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(INTR_i_1_n_0),
        .Q(INTR));
  FDPE clk33_signal_1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(CLK_33K),
        .PRE(AR),
        .Q(clk33_signal_1));
  FDPE pulse_signal_1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(PMT),
        .PRE(AR),
        .Q(pulse_signal_1));
  FDPE signal_1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(GATE),
        .PRE(AR),
        .Q(signal_1));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
