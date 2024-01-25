-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Carrier_Synchronizer.vhd
-- Created: 2024-01-25 16:33:03
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Carrier_Synchronizer
-- Source Path: commhdlQPSKTxRx/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer
-- Hierarchy Level: 2
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.QPSK_Rx_pkg.ALL;

ENTITY Carrier_Synchronizer IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        internalRst                       :   IN    std_logic;
        validIn                           :   IN    std_logic;
        manualRst                         :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validOut                          :   OUT   std_logic
        );
END Carrier_Synchronizer;


ARCHITECTURE rtl OF Carrier_Synchronizer IS

  -- Component Declarations
  COMPONENT Phase_Error_Detector
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          PhaseError                      :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13_En10
          );
  END COMPONENT;

  COMPONENT Loop_Filter_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          e                               :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13_En10
          validIn                         :   IN    std_logic;
          internalRst                     :   IN    std_logic;
          externalRst                     :   IN    std_logic;
          v                               :   OUT   std_logic_vector(39 DOWNTO 0);  -- sfix40_En39
          valid                           :   OUT   std_logic;
          rst                             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Direct_Digital_Synthesis
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          rst                             :   IN    std_logic;
          validIn                         :   IN    std_logic;
          phaseInc                        :   IN    std_logic_vector(39 DOWNTO 0);  -- sfix40_En39
          expOut_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          expOut_im                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Phase_Error_Detector
    USE ENTITY work.Phase_Error_Detector(rtl);

  FOR ALL : Loop_Filter_block
    USE ENTITY work.Loop_Filter_block(rtl);

  FOR ALL : Direct_Digital_Synthesis
    USE ENTITY work.Direct_Digital_Synthesis(rtl);

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay10_reg_re                   : vector_of_signed16(0 TO 5);  -- sfix16_En14 [6]
  SIGNAL Delay10_reg_im                   : vector_of_signed16(0 TO 5);  -- sfix16_En14 [6]
  SIGNAL Delay10_out1_re                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay10_out1_im                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay4_reg_re                    : vector_of_signed16(0 TO 1) := (OTHERS => to_signed(16#0000#, 16));  -- sfix16_En14 [2]
  SIGNAL Delay4_reg_im                    : vector_of_signed16(0 TO 1) := (OTHERS => to_signed(16#0000#, 16));  -- sfix16_En14 [2]
  SIGNAL Delay4_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay4_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay14_reg                      : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL Delay14_out1                     : std_logic;
  SIGNAL Delay9_reg                       : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay9_out1                      : std_logic;
  SIGNAL Delay8_reg                       : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay8_out1                      : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Delay1_reg                       : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Delay13_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay13_out1                     : std_logic;
  SIGNAL Delay12_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay12_out1                     : std_logic;
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL Delay15_reg                      : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL Delay15_out1                     : std_logic;
  SIGNAL Direct_Digital_Synthesis_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Direct_Digital_Synthesis_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay_out1_im                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Type_Conversion2_out1_re    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Type_Conversion2_out1_im    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay_out1_re                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Phase_Error_Detector_out1        : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL Loop_Filter_out1                 : std_logic_vector(39 DOWNTO 0);  -- ufix40
  SIGNAL Loop_Filter_out2                 : std_logic;
  SIGNAL Loop_Filter_out3                 : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Direct_Digital_Synthesis_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Direct_Digital_Synthesis_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL conj_cast                        : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL conj_cast_1                      : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Math_Function_out1_re            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Math_Function_out1_im            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay3_reg_re                    : vector_of_signed16(0 TO 1) := (OTHERS => to_signed(16#0000#, 16));  -- sfix16_En14 [2]
  SIGNAL Delay3_reg_im                    : vector_of_signed16(0 TO 1) := (OTHERS => to_signed(16#0000#, 16));  -- sfix16_En14 [2]
  SIGNAL Delay3_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay3_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_mul_temp                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_mul_temp_1               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_mul_temp_2               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_mul_temp_3               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_out1_re                  : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_out1_im                  : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Delay6_reg_re                    : vector_of_signed32(0 TO 1) := (OTHERS => to_signed(0, 32));  -- sfix32_En28 [2]
  SIGNAL Delay6_reg_im                    : vector_of_signed32(0 TO 1) := (OTHERS => to_signed(0, 32));  -- sfix32_En28 [2]
  SIGNAL Delay6_out1_re                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Delay6_out1_im                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Delay5_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay5_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay7_out1                      : std_logic;

BEGIN
  u_Phase_Error_Detector : Phase_Error_Detector
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              dataIn_re => std_logic_vector(Delay_out1_re),  -- sfix16_En14
              dataIn_im => std_logic_vector(Delay_out1_im),  -- sfix16_En14
              PhaseError => Phase_Error_Detector_out1  -- sfix13_En10
              );

  u_Loop_Filter : Loop_Filter_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              e => Phase_Error_Detector_out1,  -- sfix13_En10
              validIn => Delay1_out1,
              internalRst => Delay15_out1,
              externalRst => manualRst,
              v => Loop_Filter_out1,  -- sfix40_En39
              valid => Loop_Filter_out2,
              rst => Loop_Filter_out3
              );

  u_Direct_Digital_Synthesis : Direct_Digital_Synthesis
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              rst => Logical_Operator_out1,
              validIn => Loop_Filter_out2,
              phaseInc => Loop_Filter_out1,  -- sfix40_En39
              expOut_re => Direct_Digital_Synthesis_out1_re,  -- sfix16_En14
              expOut_im => Direct_Digital_Synthesis_out1_im  -- sfix16_En14
              );

  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  Delay10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay10_reg_re <= (OTHERS => to_signed(16#0000#, 16));
      Delay10_reg_im <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay10_reg_im(0) <= dataIn_im_signed;
        Delay10_reg_im(1 TO 5) <= Delay10_reg_im(0 TO 4);
        Delay10_reg_re(0) <= dataIn_re_signed;
        Delay10_reg_re(1 TO 5) <= Delay10_reg_re(0 TO 4);
      END IF;
    END IF;
  END PROCESS Delay10_process;

  Delay10_out1_re <= Delay10_reg_re(5);
  Delay10_out1_im <= Delay10_reg_im(5);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay4_reg_im(0) <= Delay10_out1_im;
        Delay4_reg_im(1) <= Delay4_reg_im(0);
        Delay4_reg_re(0) <= Delay10_out1_re;
        Delay4_reg_re(1) <= Delay4_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1_re <= Delay4_reg_re(1);
  Delay4_out1_im <= Delay4_reg_im(1);

  Delay14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay14_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay14_reg(0) <= validIn;
        Delay14_reg(5 DOWNTO 1) <= Delay14_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay14_process;

  Delay14_out1 <= Delay14_reg(5);

  Delay9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay9_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay9_reg(0) <= Delay14_out1;
        Delay9_reg(1) <= Delay9_reg(0);
      END IF;
    END IF;
  END PROCESS Delay9_process;

  Delay9_out1 <= Delay9_reg(1);

  Delay8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay8_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay8_reg(0) <= Delay9_out1;
        Delay8_reg(1) <= Delay8_reg(0);
      END IF;
    END IF;
  END PROCESS Delay8_process;

  Delay8_out1 <= Delay8_reg(1);

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_out1 <= Delay8_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_reg(0) <= Delay2_out1;
        Delay1_reg(5 DOWNTO 1) <= Delay1_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(5);

  Delay13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay13_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay13_reg(0) <= internalRst;
        Delay13_reg(1) <= Delay13_reg(0);
      END IF;
    END IF;
  END PROCESS Delay13_process;

  Delay13_out1 <= Delay13_reg(1);

  Delay12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay12_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay12_reg(0) <= Delay13_out1;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  Delay11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay11_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay11_out1 <= Delay12_out1;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  Delay15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay15_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay15_reg(0) <= Delay11_out1;
        Delay15_reg(5 DOWNTO 1) <= Delay15_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay15_process;

  Delay15_out1 <= Delay15_reg(5);

  Direct_Digital_Synthesis_out1_im_signed <= signed(Direct_Digital_Synthesis_out1_im);

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1_re <= to_signed(16#0000#, 16);
      Delay_out1_im <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_out1_re <= Data_Type_Conversion2_out1_re;
        Delay_out1_im <= Data_Type_Conversion2_out1_im;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Logical_Operator_out1 <= manualRst AND Loop_Filter_out3;

  Direct_Digital_Synthesis_out1_re_signed <= signed(Direct_Digital_Synthesis_out1_re);

  Math_Function_out1_re <= Direct_Digital_Synthesis_out1_re_signed;
  conj_cast <= resize(Direct_Digital_Synthesis_out1_im_signed, 17);
  conj_cast_1 <=  - (conj_cast);
  
  Math_Function_out1_im <= X"7FFF" WHEN (conj_cast_1(16) = '0') AND (conj_cast_1(15) /= '0') ELSE
      X"8000" WHEN (conj_cast_1(16) = '1') AND (conj_cast_1(15) /= '1') ELSE
      conj_cast_1(15 DOWNTO 0);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_reg_im(0) <= Math_Function_out1_im;
        Delay3_reg_im(1) <= Delay3_reg_im(0);
        Delay3_reg_re(0) <= Math_Function_out1_re;
        Delay3_reg_re(1) <= Delay3_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1_re <= Delay3_reg_re(1);
  Delay3_out1_im <= Delay3_reg_im(1);

  Product_mul_temp <= Delay4_out1_re * Delay3_out1_re;
  Product_mul_temp_1 <= Delay4_out1_im * Delay3_out1_im;
  Product_out1_re <= Product_mul_temp - Product_mul_temp_1;
  Product_mul_temp_2 <= Delay4_out1_im * Delay3_out1_re;
  Product_mul_temp_3 <= Delay4_out1_re * Delay3_out1_im;
  Product_out1_im <= Product_mul_temp_2 + Product_mul_temp_3;

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay6_reg_im(0) <= Product_out1_im;
        Delay6_reg_im(1) <= Delay6_reg_im(0);
        Delay6_reg_re(0) <= Product_out1_re;
        Delay6_reg_re(1) <= Delay6_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1_re <= Delay6_reg_re(1);
  Delay6_out1_im <= Delay6_reg_im(1);

  Data_Type_Conversion2_out1_re <= Delay6_out1_re(29 DOWNTO 14);
  Data_Type_Conversion2_out1_im <= Delay6_out1_im(29 DOWNTO 14);

  Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay5_out1_re <= to_signed(16#0000#, 16);
      Delay5_out1_im <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay5_out1_re <= Data_Type_Conversion2_out1_re;
        Delay5_out1_im <= Data_Type_Conversion2_out1_im;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  dataOut_re <= std_logic_vector(Delay5_out1_re);

  dataOut_im <= std_logic_vector(Delay5_out1_im);

  Delay7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay7_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay7_out1 <= Delay8_out1;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  validOut <= Delay7_out1;

END rtl;

