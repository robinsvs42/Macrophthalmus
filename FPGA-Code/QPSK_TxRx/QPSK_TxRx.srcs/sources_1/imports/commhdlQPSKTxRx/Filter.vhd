-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Filter.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Filter
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Discrete FIR 
-- Filter/Filte
-- Hierarchy Level: 5
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.QPSK_Rx_pkg.ALL;

ENTITY Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validIn                           :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
        validOut                          :   OUT   std_logic
        );
END Filter;


ARCHITECTURE rtl OF Filter IS

  -- Component Declarations
  COMPONENT FilterCoef
    PORT( CoefOutP                        :   OUT   vector_of_std_logic_vector17(0 TO 12)  -- sfix17_En19 [13]
          );
  END COMPONENT;

  COMPONENT subFilter
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          dinReg2_0_re                    :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En14
          coefIn                          :   IN    vector_of_std_logic_vector17(0 TO 12);  -- sfix17_En19 [13]
          dinRegVld                       :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dout_1_re                       :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En33
          doutVld                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT FilterCoef_block1
    PORT( CoefOutI                        :   OUT   vector_of_std_logic_vector17(0 TO 12)  -- sfix17_En19 [13]
          );
  END COMPONENT;

  COMPONENT FilterCoef_block
    PORT( CoefOutS                        :   OUT   vector_of_std_logic_vector17(0 TO 12)  -- sfix17_En19 [13]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : FilterCoef
    USE ENTITY work.FilterCoef(rtl);

  FOR ALL : subFilter
    USE ENTITY work.subFilter(rtl);

  FOR ALL : FilterCoef_block1
    USE ENTITY work.FilterCoef_block1(rtl);

  FOR ALL : FilterCoef_block
    USE ENTITY work.FilterCoef_block(rtl);

  -- Signals
  SIGNAL dinRegVld                        : std_logic;
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dinReg_0_re                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dinReg_cast_0_re                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL dinReg2_0_re                     : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL CoefOutP                         : vector_of_std_logic_vector17(0 TO 12);  -- ufix17 [13]
  SIGNAL dinReg2Vld                       : std_logic;
  SIGNAL dout_1_P                         : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL doutVld                          : std_logic;
  SIGNAL dout_1_P_signed                  : signed(35 DOWNTO 0);  -- sfix36_En33
  SIGNAL dinReg_0_im                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL adder_add_cast                   : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL adder_add_cast_1                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL dinRealPImag_0                   : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL dinReg2_0_P                      : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL CoefOutI                         : vector_of_std_logic_vector17(0 TO 12);  -- ufix17 [13]
  SIGNAL dout_1_I                         : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL doutVld_IdeadOut                 : std_logic;
  SIGNAL dout_1_I_signed                  : signed(35 DOWNTO 0);  -- sfix36_En33
  SIGNAL subtractor_sub_cast              : signed(36 DOWNTO 0);  -- sfix37_En33
  SIGNAL subtractor_sub_cast_1            : signed(36 DOWNTO 0);  -- sfix37_En33
  SIGNAL dout_1_r                         : signed(36 DOWNTO 0);  -- sfix37_En33
  SIGNAL dout_1_cast_r                    : signed(15 DOWNTO 0);  -- sfix16_En13
  SIGNAL dout_1_re                        : signed(15 DOWNTO 0);  -- sfix16_En13
  SIGNAL dinReg2_cast_0_im                : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL dinReg2_0_im                     : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL CoefOutS                         : vector_of_std_logic_vector17(0 TO 12);  -- ufix17 [13]
  SIGNAL dout_1_M                         : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL doutVld_MdeadOut                 : std_logic;
  SIGNAL dout_1_M_signed                  : signed(35 DOWNTO 0);  -- sfix36_En33
  SIGNAL adder_add_cast_2                 : signed(36 DOWNTO 0);  -- sfix37_En33
  SIGNAL adder_add_cast_3                 : signed(36 DOWNTO 0);  -- sfix37_En33
  SIGNAL dout_1_i_1                       : signed(36 DOWNTO 0);  -- sfix37_En33
  SIGNAL dout_1_cast_i                    : signed(15 DOWNTO 0);  -- sfix16_En13
  SIGNAL dout_1_im                        : signed(15 DOWNTO 0);  -- sfix16_En13
  SIGNAL doutVldReg                       : std_logic;

BEGIN
  u_CoefTableP_1 : FilterCoef
    PORT MAP( CoefOutP => CoefOutP  -- sfix17_En19 [13]
              );

  u_subFilter_1_reP : subFilter
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              dinReg2_0_re => std_logic_vector(dinReg2_0_re),  -- sfix17_En14
              coefIn => CoefOutP,  -- sfix17_En19 [13]
              dinRegVld => dinReg2Vld,
              syncReset => syncReset,
              dout_1_re => dout_1_P,  -- sfix36_En33
              doutVld => doutVld
              );

  u_CoefTableI_1 : FilterCoef_block1
    PORT MAP( CoefOutI => CoefOutI  -- sfix17_En19 [13]
              );

  u_subFilter_1_im : subFilter
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              dinReg2_0_re => std_logic_vector(dinReg2_0_P),  -- sfix17_En14
              coefIn => CoefOutI,  -- sfix17_En19 [13]
              dinRegVld => dinReg2Vld,
              syncReset => syncReset,
              dout_1_re => dout_1_I,  -- sfix36_En33
              doutVld => doutVld_IdeadOut
              );

  u_CoefTableS_1 : FilterCoef_block
    PORT MAP( CoefOutS => CoefOutS  -- sfix17_En19 [13]
              );

  u_subFilter_1_reS : subFilter
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              dinReg2_0_re => std_logic_vector(dinReg2_0_im),  -- sfix17_En14
              coefIn => CoefOutS,  -- sfix17_En19 [13]
              dinRegVld => dinReg2Vld,
              syncReset => syncReset,
              dout_1_re => dout_1_M,  -- sfix36_En33
              doutVld => doutVld_MdeadOut
              );

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinRegVld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinRegVld <= '0';
        ELSE 
          dinRegVld <= validIn;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  dataIn_re_signed <= signed(dataIn_re);

  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinReg_0_re <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg_0_re <= to_signed(16#0000#, 16);
        ELSIF validIn = '1' THEN
          dinReg_0_re <= dataIn_re_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  dinReg_cast_0_re <= resize(dinReg_0_re, 17);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinReg2_0_re <= to_signed(16#00000#, 17);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2_0_re <= to_signed(16#00000#, 17);
        ELSIF dinRegVld = '1' THEN
          dinReg2_0_re <= dinReg_cast_0_re;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinReg2Vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2Vld <= '0';
        ELSE 
          dinReg2Vld <= dinRegVld;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  dout_1_P_signed <= signed(dout_1_P);

  dataIn_im_signed <= signed(dataIn_im);

  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinReg_0_im <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg_0_im <= to_signed(16#0000#, 16);
        ELSIF validIn = '1' THEN
          dinReg_0_im <= dataIn_im_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  adder_add_cast <= resize(dinReg_0_re, 17);
  adder_add_cast_1 <= resize(dinReg_0_im, 17);
  dinRealPImag_0 <= adder_add_cast + adder_add_cast_1;

  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinReg2_0_P <= to_signed(16#00000#, 17);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2_0_P <= to_signed(16#00000#, 17);
        ELSIF dinRegVld = '1' THEN
          dinReg2_0_P <= dinRealPImag_0;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  dout_1_I_signed <= signed(dout_1_I);

  subtractor_sub_cast <= resize(dout_1_P_signed, 37);
  subtractor_sub_cast_1 <= resize(dout_1_I_signed, 37);
  dout_1_r <= subtractor_sub_cast - subtractor_sub_cast_1;

  dout_1_cast_r <= dout_1_r(35 DOWNTO 20);

  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dout_1_re <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dout_1_re <= to_signed(16#0000#, 16);
        ELSE 
          dout_1_re <= dout_1_cast_r;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  dataOut_re <= std_logic_vector(dout_1_re);

  dinReg2_cast_0_im <= resize(dinReg_0_im, 17);

  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinReg2_0_im <= to_signed(16#00000#, 17);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2_0_im <= to_signed(16#00000#, 17);
        ELSIF dinRegVld = '1' THEN
          dinReg2_0_im <= dinReg2_cast_0_im;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  dout_1_M_signed <= signed(dout_1_M);

  adder_add_cast_2 <= resize(dout_1_M_signed, 37);
  adder_add_cast_3 <= resize(dout_1_I_signed, 37);
  dout_1_i_1 <= adder_add_cast_2 + adder_add_cast_3;

  dout_1_cast_i <= dout_1_i_1(35 DOWNTO 20);

  intdelay_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dout_1_im <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          dout_1_im <= to_signed(16#0000#, 16);
        ELSE 
          dout_1_im <= dout_1_cast_i;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  dataOut_im <= std_logic_vector(dout_1_im);

  intdelay_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      doutVldReg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          doutVldReg <= '0';
        ELSE 
          doutVldReg <= doutVld;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  validOut <= doutVldReg;

END rtl;
