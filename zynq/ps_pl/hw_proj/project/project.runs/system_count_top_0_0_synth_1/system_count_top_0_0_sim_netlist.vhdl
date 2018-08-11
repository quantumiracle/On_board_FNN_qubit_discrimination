-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4_sdx (win64) Build 1806307 Thu Mar  9 15:24:31 MST 2017
-- Date        : Sat Aug 11 17:33:53 2018
-- Host        : jmcui-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_count_top_0_0_sim_netlist.vhdl
-- Design      : system_count_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_div_33k is
  port (
    CLK_33K : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    GATE : in STD_LOGIC;
    clk33_signal_1 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_div_33k;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_div_33k is
  signal \^clk_33k\ : STD_LOGIC;
  signal CLK_33K_i_1_n_0 : STD_LOGIC;
  signal CLK_33K_i_2_n_0 : STD_LOGIC;
  signal cnt : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[10]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[10]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[10]_i_3_n_0\ : STD_LOGIC;
  signal \cnt[10]_i_4_n_0\ : STD_LOGIC;
  signal \cnt[10]_i_5_n_0\ : STD_LOGIC;
  signal \cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[9]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of CLK_33K_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \COUNTER[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[0]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[10]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[10]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[10]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[7]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt[8]_i_2\ : label is "soft_lutpair0";
begin
  CLK_33K <= \^clk_33k\;
CLK_33K_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => CLK_33K_i_2_n_0,
      I1 => \^clk_33k\,
      O => CLK_33K_i_1_n_0
    );
CLK_33K_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => \cnt[10]_i_4_n_0\,
      I1 => cnt(5),
      I2 => cnt(1),
      I3 => cnt(10),
      I4 => cnt(9),
      I5 => cnt(0),
      O => CLK_33K_i_2_n_0
    );
CLK_33K_reg: unisim.vcomponents.FDPE
     port map (
      C => CLK,
      CE => '1',
      D => CLK_33K_i_1_n_0,
      PRE => AR(0),
      Q => \^clk_33k\
    );
\COUNTER[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => GATE,
      I1 => \^clk_33k\,
      I2 => clk33_signal_1,
      O => E(0)
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => cnt(0),
      I1 => GATE,
      I2 => \cnt[0]_i_2_n_0\,
      O => \cnt[0]_i_1_n_0\
    );
\cnt[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => cnt(9),
      I1 => cnt(10),
      I2 => cnt(1),
      I3 => cnt(5),
      I4 => \cnt[10]_i_4_n_0\,
      O => \cnt[0]_i_2_n_0\
    );
\cnt[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88882888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(10),
      I2 => cnt(9),
      I3 => \cnt[10]_i_3_n_0\,
      I4 => \cnt[10]_i_4_n_0\,
      O => \cnt[10]_i_1_n_0\
    );
\cnt[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => cnt(0),
      I1 => \cnt[10]_i_5_n_0\,
      I2 => \cnt[10]_i_4_n_0\,
      I3 => GATE,
      O => \cnt[10]_i_2_n_0\
    );
\cnt[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => cnt(1),
      I1 => cnt(0),
      I2 => cnt(5),
      O => \cnt[10]_i_3_n_0\
    );
\cnt[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => cnt(7),
      I1 => cnt(4),
      I2 => cnt(2),
      I3 => cnt(3),
      I4 => cnt(6),
      I5 => cnt(8),
      O => \cnt[10]_i_4_n_0\
    );
\cnt[10]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => cnt(5),
      I1 => cnt(1),
      I2 => cnt(10),
      I3 => cnt(9),
      O => \cnt[10]_i_5_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(1),
      I2 => cnt(0),
      O => \cnt[1]_i_1_n_0\
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(2),
      I2 => cnt(0),
      I3 => cnt(1),
      O => \cnt[2]_i_1_n_0\
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(3),
      I2 => cnt(1),
      I3 => cnt(0),
      I4 => cnt(2),
      O => \cnt[3]_i_1_n_0\
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(4),
      I2 => cnt(1),
      I3 => cnt(0),
      I4 => cnt(3),
      I5 => cnt(2),
      O => \cnt[4]_i_1_n_0\
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(5),
      I2 => \cnt[5]_i_2_n_0\,
      I3 => cnt(4),
      I4 => cnt(2),
      I5 => cnt(3),
      O => \cnt[5]_i_1_n_0\
    );
\cnt[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      O => \cnt[5]_i_2_n_0\
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(6),
      I2 => \cnt[10]_i_3_n_0\,
      I3 => cnt(4),
      I4 => cnt(2),
      I5 => cnt(3),
      O => \cnt[6]_i_1_n_0\
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888828888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(7),
      I2 => cnt(5),
      I3 => cnt(0),
      I4 => cnt(1),
      I5 => \cnt[7]_i_2_n_0\,
      O => \cnt[7]_i_1_n_0\
    );
\cnt[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => cnt(4),
      I1 => cnt(2),
      I2 => cnt(3),
      I3 => cnt(6),
      O => \cnt[7]_i_2_n_0\
    );
\cnt[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888828888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(8),
      I2 => cnt(5),
      I3 => cnt(0),
      I4 => cnt(1),
      I5 => \cnt[8]_i_2_n_0\,
      O => \cnt[8]_i_1_n_0\
    );
\cnt[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => cnt(6),
      I1 => cnt(3),
      I2 => cnt(2),
      I3 => cnt(4),
      I4 => cnt(7),
      O => \cnt[8]_i_2_n_0\
    );
\cnt[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888828888888"
    )
        port map (
      I0 => \cnt[10]_i_2_n_0\,
      I1 => cnt(9),
      I2 => cnt(5),
      I3 => cnt(0),
      I4 => cnt(1),
      I5 => \cnt[10]_i_4_n_0\,
      O => \cnt[9]_i_1_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[0]_i_1_n_0\,
      Q => cnt(0)
    );
\cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[10]_i_1_n_0\,
      Q => cnt(10)
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[1]_i_1_n_0\,
      Q => cnt(1)
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[2]_i_1_n_0\,
      Q => cnt(2)
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[3]_i_1_n_0\,
      Q => cnt(3)
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[4]_i_1_n_0\,
      Q => cnt(4)
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[5]_i_1_n_0\,
      Q => cnt(5)
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[6]_i_1_n_0\,
      Q => cnt(6)
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[7]_i_1_n_0\,
      Q => cnt(7)
    );
\cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[8]_i_1_n_0\,
      Q => cnt(8)
    );
\cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \cnt[9]_i_1_n_0\,
      Q => cnt(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter is
  port (
    clk33_signal_1 : out STD_LOGIC;
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTR : out STD_LOGIC;
    CLEAR : out STD_LOGIC;
    COUNTER : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK_33K : in STD_LOGIC;
    CLK : in STD_LOGIC;
    GATE : in STD_LOGIC;
    PMT : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter is
  signal \^ar\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^clear\ : STD_LOGIC;
  signal CLEAR_i_1_n_0 : STD_LOGIC;
  signal COUNT : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \COUNT[4]_i_2_n_0\ : STD_LOGIC;
  signal \COUNT[5]_i_2_n_0\ : STD_LOGIC;
  signal \COUNT[7]_i_1_n_0\ : STD_LOGIC;
  signal \COUNT[7]_i_3_n_0\ : STD_LOGIC;
  signal \^intr\ : STD_LOGIC;
  signal INTR_i_1_n_0 : STD_LOGIC;
  signal \^clk33_signal_1\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal pulse_signal_1 : STD_LOGIC;
  signal signal_1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \COUNT[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \COUNT[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \COUNT[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \COUNT[4]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \COUNT[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \COUNT[7]_i_2\ : label is "soft_lutpair6";
begin
  AR(0) <= \^ar\(0);
  CLEAR <= \^clear\;
  INTR <= \^intr\;
  clk33_signal_1 <= \^clk33_signal_1\;
CLEAR_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => GATE,
      I1 => RST_N,
      I2 => \^clear\,
      O => CLEAR_i_1_n_0
    );
CLEAR_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => CLEAR_i_1_n_0,
      Q => \^clear\,
      R => '0'
    );
\COUNTER_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(0),
      Q => COUNTER(0)
    );
\COUNTER_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(1),
      Q => COUNTER(1)
    );
\COUNTER_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(2),
      Q => COUNTER(2)
    );
\COUNTER_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(3),
      Q => COUNTER(3)
    );
\COUNTER_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(4),
      Q => COUNTER(4)
    );
\COUNTER_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(5),
      Q => COUNTER(5)
    );
\COUNTER_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(6),
      Q => COUNTER(6)
    );
\COUNTER_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => E(0),
      CLR => \^ar\(0),
      D => COUNT(7),
      Q => COUNTER(7)
    );
\COUNT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => GATE,
      I1 => signal_1,
      I2 => COUNT(0),
      O => p_1_in(0)
    );
\COUNT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \COUNT[4]_i_2_n_0\,
      I1 => COUNT(1),
      I2 => COUNT(0),
      O => p_1_in(1)
    );
\COUNT[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => \COUNT[4]_i_2_n_0\,
      I1 => COUNT(2),
      I2 => COUNT(0),
      I3 => COUNT(1),
      O => p_1_in(2)
    );
\COUNT[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => \COUNT[4]_i_2_n_0\,
      I1 => COUNT(3),
      I2 => COUNT(1),
      I3 => COUNT(0),
      I4 => COUNT(2),
      O => p_1_in(3)
    );
\COUNT[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => \COUNT[4]_i_2_n_0\,
      I1 => COUNT(4),
      I2 => COUNT(2),
      I3 => COUNT(0),
      I4 => COUNT(1),
      I5 => COUNT(3),
      O => p_1_in(4)
    );
\COUNT[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFDF00DF"
    )
        port map (
      I0 => COUNT(7),
      I1 => \COUNT[7]_i_3_n_0\,
      I2 => COUNT(6),
      I3 => GATE,
      I4 => signal_1,
      O => \COUNT[4]_i_2_n_0\
    );
\COUNT[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B00B"
    )
        port map (
      I0 => signal_1,
      I1 => GATE,
      I2 => COUNT(5),
      I3 => \COUNT[5]_i_2_n_0\,
      O => p_1_in(5)
    );
\COUNT[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => COUNT(3),
      I1 => COUNT(1),
      I2 => COUNT(0),
      I3 => COUNT(2),
      I4 => COUNT(4),
      O => \COUNT[5]_i_2_n_0\
    );
\COUNT[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B00B"
    )
        port map (
      I0 => signal_1,
      I1 => GATE,
      I2 => COUNT(6),
      I3 => \COUNT[7]_i_3_n_0\,
      O => p_1_in(6)
    );
\COUNT[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40F0"
    )
        port map (
      I0 => pulse_signal_1,
      I1 => PMT,
      I2 => GATE,
      I3 => signal_1,
      O => \COUNT[7]_i_1_n_0\
    );
\COUNT[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B00BB0B0"
    )
        port map (
      I0 => signal_1,
      I1 => GATE,
      I2 => COUNT(7),
      I3 => \COUNT[7]_i_3_n_0\,
      I4 => COUNT(6),
      O => p_1_in(7)
    );
\COUNT[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => COUNT(4),
      I1 => COUNT(2),
      I2 => COUNT(0),
      I3 => COUNT(1),
      I4 => COUNT(3),
      I5 => COUNT(5),
      O => \COUNT[7]_i_3_n_0\
    );
\COUNT_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(0),
      Q => COUNT(0)
    );
\COUNT_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(1),
      Q => COUNT(1)
    );
\COUNT_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(2),
      Q => COUNT(2)
    );
\COUNT_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(3),
      Q => COUNT(3)
    );
\COUNT_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(4),
      Q => COUNT(4)
    );
\COUNT_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(5),
      Q => COUNT(5)
    );
\COUNT_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(6),
      Q => COUNT(6)
    );
\COUNT_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \COUNT[7]_i_1_n_0\,
      CLR => \^ar\(0),
      D => p_1_in(7),
      Q => COUNT(7)
    );
INTR_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => CLK_33K,
      I1 => \^clk33_signal_1\,
      I2 => GATE,
      I3 => \^intr\,
      O => INTR_i_1_n_0
    );
INTR_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RST_N,
      O => \^ar\(0)
    );
INTR_reg: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \^ar\(0),
      D => INTR_i_1_n_0,
      Q => \^intr\
    );
clk33_signal_1_reg: unisim.vcomponents.FDPE
     port map (
      C => CLK,
      CE => '1',
      D => CLK_33K,
      PRE => \^ar\(0),
      Q => \^clk33_signal_1\
    );
pulse_signal_1_reg: unisim.vcomponents.FDPE
     port map (
      C => CLK,
      CE => '1',
      D => PMT,
      PRE => \^ar\(0),
      Q => pulse_signal_1
    );
signal_1_reg: unisim.vcomponents.FDPE
     port map (
      C => CLK,
      CE => '1',
      D => GATE,
      PRE => \^ar\(0),
      Q => signal_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_count_top is
  port (
    COUNTER : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTR : out STD_LOGIC;
    CLEAR : out STD_LOGIC;
    CLK : in STD_LOGIC;
    GATE : in STD_LOGIC;
    PMT : in STD_LOGIC;
    RST_N : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_count_top;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_count_top is
  signal CLK_33K : STD_LOGIC;
  signal clk33_signal_1 : STD_LOGIC;
  signal clk_div_33k_n_1 : STD_LOGIC;
  signal counter_n_1 : STD_LOGIC;
begin
clk_div_33k: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clk_div_33k
     port map (
      AR(0) => counter_n_1,
      CLK => CLK,
      CLK_33K => CLK_33K,
      E(0) => clk_div_33k_n_1,
      GATE => GATE,
      clk33_signal_1 => clk33_signal_1
    );
counter_RnM: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter
     port map (
      AR(0) => counter_n_1,
      CLEAR => CLEAR,
      CLK => CLK,
      CLK_33K => CLK_33K,
      COUNTER(7 downto 0) => COUNTER(7 downto 0),
      E(0) => clk_div_33k_n_1,
      GATE => GATE,
      INTR => INTR,
      PMT => PMT,
      RST_N => RST_N,
      clk33_signal_1 => clk33_signal_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    CLK : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    GATE : in STD_LOGIC;
    PMT : in STD_LOGIC;
    INTR : out STD_LOGIC;
    COUNTER : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLEAR : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_count_top_0_0,count_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "count_top,Vivado 2016.4_sdx";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_count_top
     port map (
      CLEAR => CLEAR,
      CLK => CLK,
      COUNTER(7 downto 0) => COUNTER(7 downto 0),
      GATE => GATE,
      INTR => INTR,
      PMT => PMT,
      RST_N => RST_N
    );
end STRUCTURE;
