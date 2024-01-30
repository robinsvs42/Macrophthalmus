-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Compare_To_Constant2.vhd
-- Created: 2024-01-25 16:27:39
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Compare_To_Constant2
-- Source Path: commhdlQPSKTxRx/QPSK Tx/Bit Packetizer/Compare To Constant2
-- Hierarchy Level: 2
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Compare_To_Constant2 IS
  PORT( u                                 :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        y                                 :   OUT   std_logic
        );
END Compare_To_Constant2;


ARCHITECTURE rtl OF Compare_To_Constant2 IS

  -- Signals
  SIGNAL u_unsigned                       : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Constant_out1                    : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Compare_relop1                   : std_logic;

BEGIN
  u_unsigned <= unsigned(u);

  Constant_out1 <= to_unsigned(16#01A#, 12);

  
  Compare_relop1 <= '1' WHEN u_unsigned >= Constant_out1 ELSE
      '0';

  y <= Compare_relop1;

END rtl;
