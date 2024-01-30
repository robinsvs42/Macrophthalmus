-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\Bit_Packetizer.vhd
-- Created: 2024-01-25 16:27:39
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Bit_Packetizer
-- Source Path: commhdlQPSKTxRx/QPSK Tx/Bit Packetizer
-- Hierarchy Level: 1
-- Model version: 7.26
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Bit_Packetizer IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic;
        validIn                           :   IN    std_logic;
        bitsOut                           :   OUT   std_logic;
        dataStart                         :   OUT   std_logic;
        dataEnd                           :   OUT   std_logic;
        bitsValid                         :   OUT   std_logic;
        dataReady                         :   OUT   std_logic
        );
END Bit_Packetizer;


ARCHITECTURE rtl OF Bit_Packetizer IS

  -- Component Declarations
  COMPONENT Data_Bits_FIFO
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          data                            :   IN    std_logic;
          push                            :   IN    std_logic;
          dataOut                         :   OUT   std_logic;
          activeFrame                     :   OUT   std_logic;
          sampleCount                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
          sampleCountValid                :   OUT   std_logic;
          fullRAM                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Compare_To_Constant2
    PORT( u                               :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Preamble_Bits_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          activeFrame                     :   IN    std_logic;
          sampleCount                     :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          sampleCountValid                :   IN    std_logic;
          preambleBits                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Compare_To_Constant
    PORT( u                               :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Compare_To_Constant1
    PORT( u                               :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Data_Bits_FIFO
    USE ENTITY work.Data_Bits_FIFO(rtl);

  FOR ALL : Compare_To_Constant2
    USE ENTITY work.Compare_To_Constant2(rtl);

  FOR ALL : Preamble_Bits_Generator
    USE ENTITY work.Preamble_Bits_Generator(rtl);

  FOR ALL : Compare_To_Constant
    USE ENTITY work.Compare_To_Constant(rtl);

  FOR ALL : Compare_To_Constant1
    USE ENTITY work.Compare_To_Constant1(rtl);

  -- Signals
  SIGNAL Data_Bits_FIFO_out1              : std_logic;
  SIGNAL Data_Bits_FIFO_out2              : std_logic;
  SIGNAL Data_Bits_FIFO_out3              : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL Data_Bits_FIFO_out4              : std_logic;
  SIGNAL Data_Bits_FIFO_out5              : std_logic;
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL Preamble_Bits_Generator_out1     : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL count_step                       : std_logic;  -- ufix1
  SIGNAL count_from                       : std_logic;  -- ufix1
  SIGNAL HDL_Counter_out1                 : std_logic;  -- ufix1
  SIGNAL count                            : std_logic;  -- ufix1
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : std_logic;  -- ufix1
  SIGNAL count_1                          : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1        : std_logic;

BEGIN
  u_Data_Bits_FIFO : Data_Bits_FIFO
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              data => dataIn,
              push => validIn,
              dataOut => Data_Bits_FIFO_out1,
              activeFrame => Data_Bits_FIFO_out2,
              sampleCount => Data_Bits_FIFO_out3,  -- ufix12
              sampleCountValid => Data_Bits_FIFO_out4,
              fullRAM => Data_Bits_FIFO_out5
              );

  u_Compare_To_Constant2 : Compare_To_Constant2
    PORT MAP( u => Data_Bits_FIFO_out3,  -- ufix12
              y => Compare_To_Constant2_out1
              );

  u_Preamble_Bits_Generator : Preamble_Bits_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              activeFrame => Data_Bits_FIFO_out2,
              sampleCount => Data_Bits_FIFO_out3,  -- ufix12
              sampleCountValid => Data_Bits_FIFO_out4,
              preambleBits => Preamble_Bits_Generator_out1
              );

  u_Compare_To_Constant : Compare_To_Constant
    PORT MAP( u => Data_Bits_FIFO_out3,  -- ufix12
              y => Compare_To_Constant_out1
              );

  u_Compare_To_Constant1 : Compare_To_Constant1
    PORT MAP( u => Data_Bits_FIFO_out3,  -- ufix12
              y => Compare_To_Constant1_out1
              );

  
  Switch_out1 <= Preamble_Bits_Generator_out1 WHEN Compare_To_Constant2_out1 = '0' ELSE
      Data_Bits_FIFO_out1;

  Logical_Operator_out1 <= Compare_To_Constant_out1 AND Data_Bits_FIFO_out4;

  Logical_Operator1_out1 <= Data_Bits_FIFO_out4 AND Compare_To_Constant1_out1;

  Logical_Operator2_out1 <=  NOT Data_Bits_FIFO_out5;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 1
  count_step <= '1';

  count_from <= '0';

  count <= HDL_Counter_out1 XOR count_step;

  
  need_to_wrap <= '1' WHEN HDL_Counter_out1 = '1' ELSE
      '0';

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter_out1 WHEN Logical_Operator2_out1 = '0' ELSE
      count_value;

  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        HDL_Counter_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Data_Type_Conversion_out1 <= HDL_Counter_out1;

  bitsOut <= Switch_out1;

  dataStart <= Logical_Operator_out1;

  dataEnd <= Logical_Operator1_out1;

  bitsValid <= Data_Bits_FIFO_out4;

  dataReady <= Data_Type_Conversion_out1;

END rtl;
