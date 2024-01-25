-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Subsystem.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase 
-- Ambiguity Estimator/Subsyste
-- Hierarchy Level: 4
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        L                                 :   IN    std_logic;
        H                                 :   IN    std_logic;
        Out2                              :   OUT   std_logic
        );
END Subsystem;


ARCHITECTURE rtl OF Subsystem IS

  -- Signals
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;

BEGIN
  Logical_Operator1_out1 <=  NOT L;

  Logical_Operator_out1 <= Logical_Operator1_out1 AND Delay6_out1;

  Logical_Operator2_out1 <= H OR Logical_Operator_out1;

  Delay6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay6_out1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay6_out1 <= Logical_Operator2_out1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Out2 <= Delay6_out1;

END rtl;

