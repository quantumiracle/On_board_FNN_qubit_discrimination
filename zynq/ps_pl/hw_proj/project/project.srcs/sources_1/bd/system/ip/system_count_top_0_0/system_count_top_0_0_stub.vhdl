-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4_sdx (win64) Build 1806307 Thu Mar  9 15:24:31 MST 2017
-- Date        : Sat Aug 11 17:33:53 2018
-- Host        : jmcui-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Users/jmcui/workspace/ps_pl6/ps_pl6/ps_pl/hw_proj/project/project.srcs/sources_1/bd/system/ip/system_count_top_0_0/system_count_top_0_0_stub.vhdl
-- Design      : system_count_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_count_top_0_0 is
  Port ( 
    CLK : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    GATE : in STD_LOGIC;
    PMT : in STD_LOGIC;
    INTR : out STD_LOGIC;
    COUNTER : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLEAR : out STD_LOGIC
  );

end system_count_top_0_0;

architecture stub of system_count_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,RST_N,GATE,PMT,INTR,COUNTER[7:0],CLEAR";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "count_top,Vivado 2016.4_sdx";
begin
end;
