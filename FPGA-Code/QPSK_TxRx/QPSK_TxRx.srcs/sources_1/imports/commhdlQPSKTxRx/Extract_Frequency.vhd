-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Extract_Frequency.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Extract_Frequency
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Coarse Frequency 
-- Estimator/Extract Frequenc
-- Hierarchy Level: 4
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Extract_Frequency IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        datain_re                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        datain_im                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        validIn                           :   IN    std_logic;
        normFreqOut                       :   OUT   std_logic_vector(34 DOWNTO 0)  -- sfix35_En34
        );
END Extract_Frequency;


ARCHITECTURE rtl OF Extract_Frequency IS

  -- Component Declarations
  COMPONENT HDL_CMA_core
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_re                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          In_im                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          validIn                         :   IN    std_logic;
          angle                           :   OUT   std_logic_vector(34 DOWNTO 0);  -- sfix35_En34
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : HDL_CMA_core
    USE ENTITY work.HDL_CMA_core(rtl);

  -- Signals
  SIGNAL datain_re_signed                 : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL datain_im_signed                 : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_out1_re                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_out1_im                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Complex_to_Magnitude_Angle_HDL_Optimized_out1 : std_logic_vector(34 DOWNTO 0);  -- ufix35
  SIGNAL Complex_to_Magnitude_Angle_HDL_Optimized_out2 : std_logic;
  SIGNAL Complex_to_Magnitude_Angle_HDL_Optimized_out1_signed : signed(34 DOWNTO 0);  -- sfix35_En34
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : signed(34 DOWNTO 0);  -- sfix35_En34
  SIGNAL Delay2_out1                      : signed(34 DOWNTO 0);  -- sfix35_En34
  SIGNAL Gain_cast                        : signed(35 DOWNTO 0);  -- sfix36_En35
  SIGNAL Gain_out1                        : signed(34 DOWNTO 0);  -- sfix35_En34
  SIGNAL Delay3_out1                      : signed(34 DOWNTO 0);  -- sfix35_En34

BEGIN
  u_Complex_to_Magnitude_Angle_HDL_Optimized : HDL_CMA_core
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_re => std_logic_vector(Delay1_out1_re),  -- sfix32_En24
              In_im => std_logic_vector(Delay1_out1_im),  -- sfix32_En24
              validIn => Delay4_out1,
              angle => Complex_to_Magnitude_Angle_HDL_Optimized_out1,  -- sfix35_En34
              validOut => Complex_to_Magnitude_Angle_HDL_Optimized_out2
              );

  datain_re_signed <= signed(datain_re);

  datain_im_signed <= signed(datain_im);

  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_out1_re <= to_signed(0, 32);
      Delay1_out1_im <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_out1_re <= datain_re_signed;
        Delay1_out1_im <= datain_im_signed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay4_out1 <= validIn;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Complex_to_Magnitude_Angle_HDL_Optimized_out1_signed <= signed(Complex_to_Magnitude_Angle_HDL_Optimized_out1);

  Unit_Delay_Enabled_Synchronous_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1 <= to_signed(0, 35);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND Complex_to_Magnitude_Angle_HDL_Optimized_out2 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Complex_to_Magnitude_Angle_HDL_Optimized_out1_signed;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_process;


  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_signed(0, 35);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_out1 <= Unit_Delay_Enabled_Synchronous_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Gain_cast <= resize(Delay2_out1, 36);
  Gain_out1 <= Gain_cast(35 DOWNTO 1);

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= to_signed(0, 35);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_out1 <= Gain_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  normFreqOut <= std_logic_vector(Delay3_out1);

END rtl;

