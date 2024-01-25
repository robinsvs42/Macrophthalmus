-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Rate_Handle.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Rate_Handle
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle
-- Hierarchy Level: 3
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Rate_Handle IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        strobe                            :   IN    std_logic;
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validOut                          :   OUT   std_logic
        );
END Rate_Handle;


ARCHITECTURE rtl OF Rate_Handle IS

  -- Component Declarations
  COMPONENT FIFO_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          in_re                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in_im                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          push                            :   IN    std_logic;
          pop                             :   IN    std_logic;
          reset_1                         :   IN    std_logic;
          out_re                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          out_im                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validPop                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : FIFO_block
    USE ENTITY work.FIFO_block(rtl);

  -- Signals
  SIGNAL count_step                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL count_from                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL HDL_Counter_out1                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL count                            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL count_1                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL FIFO_out1_re                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIFO_out1_im                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIFO_out3                        : std_logic;

BEGIN
  u_FIFO : FIFO_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              in_re => dataIn_re,  -- sfix16_En14
              in_im => dataIn_im,  -- sfix16_En14
              push => strobe,
              pop => Logical_Operator_out1,
              reset_1 => Constant_out1,
              out_re => FIFO_out1_re,  -- sfix16_En14
              out_im => FIFO_out1_im,  -- sfix16_En14
              validPop => FIFO_out3
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 3
  count_step <= to_unsigned(16#1#, 2);

  count_from <= to_unsigned(16#0#, 2);

  count <= HDL_Counter_out1 + count_step;

  
  need_to_wrap <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#3#, 2) ELSE
      '0';

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter_out1 WHEN validIn = '0' ELSE
      count_value;

  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        HDL_Counter_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#0#, 2) ELSE
      '0';

  Logical_Operator_out1 <= validIn AND Compare_To_Constant_out1;

  Constant_out1 <= '0';

  dataOut_re <= FIFO_out1_re;

  dataOut_im <= FIFO_out1_im;

  validOut <= FIFO_out3;

END rtl;

