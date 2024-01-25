-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Compare_To_Constant_block.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Compare_To_Constant_block
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/FIFO/Validate 
-- Input Push Pop/Compare To Constan
-- Hierarchy Level: 6
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Compare_To_Constant_block IS
  PORT( u                                 :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        y                                 :   OUT   std_logic
        );
END Compare_To_Constant_block;


ARCHITECTURE rtl OF Compare_To_Constant_block IS

  -- Signals
  SIGNAL u_unsigned                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Compare_relop1                   : std_logic;

BEGIN
  u_unsigned <= unsigned(u);

  Constant_out1 <= to_unsigned(16#00#, 6);

  
  Compare_relop1 <= '1' WHEN u_unsigned = Constant_out1 ELSE
      '0';

  y <= Compare_relop1;

END rtl;

