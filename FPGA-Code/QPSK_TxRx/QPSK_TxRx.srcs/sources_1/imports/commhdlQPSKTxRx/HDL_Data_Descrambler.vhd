-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\HDL_Data_Descrambler.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: HDL_Data_Descrambler
-- Source Path: commhdlQPSKTxRx/QPSK Rx/HDL Data Descrambler
-- Hierarchy Level: 1
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY HDL_Data_Descrambler IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic;
        startIn                           :   IN    std_logic;
        endIn                             :   IN    std_logic;
        validIn                           :   IN    std_logic;
        dataOut                           :   OUT   std_logic;
        startOut                          :   OUT   std_logic;
        endOut                            :   OUT   std_logic;
        validOut                          :   OUT   std_logic
        );
END HDL_Data_Descrambler;


ARCHITECTURE rtl OF HDL_Data_Descrambler IS

  -- Signals
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous4_out1 : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL BIT_XOR_out1                     : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous1_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous2_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous3_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous5_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous6_out1 : std_logic;
  SIGNAL Unit_Delay_Enabled_Resettable_Synchronous7_out1 : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL BIT_XOR2_out1                    : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL Delay7_out1                      : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL Delay4_out1                      : std_logic;

BEGIN
  -- HDL Data Scrambler
  -- Polynomial: x^7+x^4+1
  -- Initial state: [1 0 1 1 1 0 1]

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_out1 <= dataIn;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Unit_Delay_Enabled_Resettable_Synchronous4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous4_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF endIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous4_out1 <= '0';
        ELSIF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous4_out1 <= startIn;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous4_process;


  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_out1 <= validIn;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Unit_Delay_Enabled_Resettable_Synchronous_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous_out1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous_out1 <= '1';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous_out1 <= BIT_XOR_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous_process;


  Unit_Delay_Enabled_Resettable_Synchronous1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous1_out1 <= '0';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous1_out1 <= Unit_Delay_Enabled_Resettable_Synchronous_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous1_process;


  Unit_Delay_Enabled_Resettable_Synchronous2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous2_out1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous2_out1 <= '1';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous2_out1 <= Unit_Delay_Enabled_Resettable_Synchronous1_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous2_process;


  Unit_Delay_Enabled_Resettable_Synchronous3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous3_out1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous3_out1 <= '1';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous3_out1 <= Unit_Delay_Enabled_Resettable_Synchronous2_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous3_process;


  Unit_Delay_Enabled_Resettable_Synchronous5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous5_out1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous5_out1 <= '1';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous5_out1 <= Unit_Delay_Enabled_Resettable_Synchronous3_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous5_process;


  Unit_Delay_Enabled_Resettable_Synchronous6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous6_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous6_out1 <= '0';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous6_out1 <= Unit_Delay_Enabled_Resettable_Synchronous5_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous6_process;


  Unit_Delay_Enabled_Resettable_Synchronous7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Resettable_Synchronous7_out1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF startIn = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous7_out1 <= '1';
        ELSIF Delay1_out1 = '1' THEN
          Unit_Delay_Enabled_Resettable_Synchronous7_out1 <= Unit_Delay_Enabled_Resettable_Synchronous6_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Resettable_Synchronous7_process;


  BIT_XOR_out1 <= Unit_Delay_Enabled_Resettable_Synchronous7_out1 XOR Unit_Delay_Enabled_Resettable_Synchronous3_out1;

  Logical_Operator_out1 <= Unit_Delay_Enabled_Resettable_Synchronous4_out1 AND BIT_XOR_out1;

  BIT_XOR2_out1 <= Delay_out1 XOR Logical_Operator_out1;

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_out1 <= BIT_XOR2_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay5_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay5_out1 <= startIn;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Delay7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay7_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay7_out1 <= Delay5_out1;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_out1 <= endIn;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Delay6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay6_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay6_out1 <= Delay2_out1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay4_out1 <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  dataOut <= Delay3_out1;

  startOut <= Delay7_out1;

  endOut <= Delay6_out1;

  validOut <= Delay4_out1;

END rtl;
