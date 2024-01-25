-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Discrete_FIR_Filter.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Discrete_FIR_Filter
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Discrete FIR 
-- Filte
-- Hierarchy Level: 4
-- Model version: 7.26
-- 
-- Discrete FIR Filter
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Discrete_FIR_Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
        validOut                          :   OUT   std_logic
        );
END Discrete_FIR_Filter;


ARCHITECTURE rtl OF Discrete_FIR_Filter IS

  -- Component Declarations
  COMPONENT Filter
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validIn                         :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Filter
    USE ENTITY work.Filter(rtl);

  -- Signals
  SIGNAL syncReset                        : std_logic;
  SIGNAL dataOut_re_tmp                   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im_tmp                   : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_FilterBank : Filter
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              dataIn_re => dataIn_re,  -- sfix16_En14
              dataIn_im => dataIn_im,  -- sfix16_En14
              validIn => validIn,
              syncReset => syncReset,
              dataOut_re => dataOut_re_tmp,  -- sfix16_En13
              dataOut_im => dataOut_im_tmp,  -- sfix16_En13
              validOut => validOut
              );

  syncReset <= '0';

  dataOut_re <= dataOut_re_tmp;

  dataOut_im <= dataOut_im_tmp;

END rtl;

