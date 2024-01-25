-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\commhdlQPSKTxRx\QPSK_Tx_tb.vhd
-- Created: 2024-01-25 16:31:07
-- 
-- Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1.30208e-07
-- Target subsystem base rate: 1.30208e-07
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: QPSK_Tx_tb
-- Source Path: 
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_textio.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY STD;
USE STD.textio.ALL;
LIBRARY work;
USE work.QPSK_Tx_pkg.ALL;
USE work.QPSK_Tx_tb_pkg.ALL;

ENTITY QPSK_Tx_tb IS
END QPSK_Tx_tb;


ARCHITECTURE rtl OF QPSK_Tx_tb IS

  -- Component Declarations
  COMPONENT QPSK_Tx
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          dataIn                          :   IN    std_logic;
          validIn                         :   IN    std_logic;
          ce_out                          :   OUT   std_logic;
          dataReady                       :   OUT   std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          txDiagBus_QPSKConstellationPoints_re :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          txDiagBus_QPSKConstellationPoints_im :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          txDiagBus_QPSKConstellationValid :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : QPSK_Tx
    USE ENTITY work.QPSK_Tx(rtl);

  -- Signals
  SIGNAL clk                              : std_logic;
  SIGNAL reset                            : std_logic;
  SIGNAL clk_enable                       : std_logic;
  SIGNAL validOut_done                    : std_logic;  -- ufix1
  SIGNAL rdEnb                            : std_logic;
  SIGNAL validOut_done_enb                : std_logic;  -- ufix1
  SIGNAL dataReady_addr                   : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL validOut_lastAddr                : std_logic;  -- ufix1
  SIGNAL resetn                           : std_logic;
  SIGNAL check5_done                      : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationValid_done : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationValid_done_enb : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationValid_lastAddr : std_logic;  -- ufix1
  SIGNAL check4_done                      : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationPoints_re_done : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationPoints_re_done_enb : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationPoints_re_lastAddr : std_logic;  -- ufix1
  SIGNAL check3_done                      : std_logic;  -- ufix1
  SIGNAL dataOut_re_done                  : std_logic;  -- ufix1
  SIGNAL dataOut_re_done_enb              : std_logic;  -- ufix1
  SIGNAL dataOut_re_lastAddr              : std_logic;  -- ufix1
  SIGNAL check2_done                      : std_logic;  -- ufix1
  SIGNAL dataReady_done                   : std_logic;  -- ufix1
  SIGNAL dataReady_done_enb               : std_logic;  -- ufix1
  SIGNAL dataReady_active                 : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_addr   : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL Input_Data_out2_addr_delay_1     : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL tb_enb_delay                     : std_logic;
  SIGNAL rawData_validIn                  : std_logic;
  SIGNAL holdData_validIn                 : std_logic;
  SIGNAL validIn_offset                   : std_logic;
  SIGNAL validIn                          : std_logic;
  SIGNAL Data_Type_Conversion_out1_active : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_enb    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_addr_delay_1 : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL rawData_dataIn                   : std_logic;
  SIGNAL holdData_dataIn                  : std_logic;
  SIGNAL dataIn_offset                    : std_logic;
  SIGNAL dataIn                           : std_logic;
  SIGNAL snkDone                          : std_logic;
  SIGNAL snkDonen                         : std_logic;
  SIGNAL tb_enb                           : std_logic;
  SIGNAL ce_out                           : std_logic;
  SIGNAL dataReady                        : std_logic;
  SIGNAL dataOut_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL txDiagBus_QPSKConstellationPoints_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL txDiagBus_QPSKConstellationPoints_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL txDiagBus_QPSKConstellationValid : std_logic;
  SIGNAL validOut                         : std_logic;
  SIGNAL dataReady_enb                    : std_logic;  -- ufix1
  SIGNAL dataReady_lastAddr               : std_logic;  -- ufix1
  SIGNAL check1_done                      : std_logic;  -- ufix1
  SIGNAL dataReady_addr_delay_1           : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL dataReady_expected               : std_logic;
  SIGNAL dataReady_ref                    : std_logic;
  SIGNAL dataReady_testFailure            : std_logic;  -- ufix1
  SIGNAL dataOut_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_re_addr_delay_1          : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL dataOut_re_expected              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_re_ref                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_re_testFailure           : std_logic;  -- ufix1
  SIGNAL dataOut_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_im_expected              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_im_ref                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_im_testFailure           : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationPoints_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL txDiagBus_QPSKConstellationPoints_re_addr_delay_1 : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL txDiagBus_QPSKConstellationPoints_re_expected : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL txDiagBus_QPSKConstellationPoints_re_ref : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL txDiagBus_QPSKConstellationPoints_re_testFailure : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationPoints_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL txDiagBus_QPSKConstellationPoints_im_expected : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL txDiagBus_QPSKConstellationPoints_im_ref : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL txDiagBus_QPSKConstellationPoints_im_testFailure : std_logic;  -- ufix1
  SIGNAL txDiagBus_QPSKConstellationValid_addr_delay_1 : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL txDiagBus_QPSKConstellationValid_expected : std_logic;
  SIGNAL txDiagBus_QPSKConstellationValid_ref : std_logic;
  SIGNAL txDiagBus_QPSKConstellationValid_testFailure : std_logic;  -- ufix1
  SIGNAL validOut_addr_delay_1            : unsigned(18 DOWNTO 0);  -- ufix19
  SIGNAL validOut_expected                : std_logic;
  SIGNAL validOut_ref                     : std_logic;
  SIGNAL validOut_testFailure             : std_logic;  -- ufix1
  SIGNAL testFailure                      : std_logic;  -- ufix1

BEGIN
  u_QPSK_Tx : QPSK_Tx
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              dataIn => dataIn,
              validIn => validIn,
              ce_out => ce_out,
              dataReady => dataReady,
              dataOut_re => dataOut_re,  -- sfix16_En14
              dataOut_im => dataOut_im,  -- sfix16_En14
              txDiagBus_QPSKConstellationPoints_re => txDiagBus_QPSKConstellationPoints_re,  -- sfix16_En15
              txDiagBus_QPSKConstellationPoints_im => txDiagBus_QPSKConstellationPoints_im,  -- sfix16_En15
              txDiagBus_QPSKConstellationValid => txDiagBus_QPSKConstellationValid,
              validOut => validOut
              );

  validOut_done_enb <= validOut_done AND rdEnb;

  
  validOut_lastAddr <= '1' WHEN dataReady_addr >= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  validOut_done <= validOut_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_5_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check5_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF validOut_done_enb = '1' THEN
        check5_done <= validOut_done;
      END IF;
    END IF;
  END PROCESS checkDone_5_process;

  txDiagBus_QPSKConstellationValid_done_enb <= txDiagBus_QPSKConstellationValid_done AND rdEnb;

  
  txDiagBus_QPSKConstellationValid_lastAddr <= '1' WHEN dataReady_addr >= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  txDiagBus_QPSKConstellationValid_done <= txDiagBus_QPSKConstellationValid_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_4_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check4_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF txDiagBus_QPSKConstellationValid_done_enb = '1' THEN
        check4_done <= txDiagBus_QPSKConstellationValid_done;
      END IF;
    END IF;
  END PROCESS checkDone_4_process;

  txDiagBus_QPSKConstellationPoints_re_done_enb <= txDiagBus_QPSKConstellationPoints_re_done AND rdEnb;

  
  txDiagBus_QPSKConstellationPoints_re_lastAddr <= '1' WHEN dataReady_addr >= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  txDiagBus_QPSKConstellationPoints_re_done <= txDiagBus_QPSKConstellationPoints_re_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_3_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check3_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF txDiagBus_QPSKConstellationPoints_re_done_enb = '1' THEN
        check3_done <= txDiagBus_QPSKConstellationPoints_re_done;
      END IF;
    END IF;
  END PROCESS checkDone_3_process;

  dataOut_re_done_enb <= dataOut_re_done AND rdEnb;

  
  dataOut_re_lastAddr <= '1' WHEN dataReady_addr >= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  dataOut_re_done <= dataOut_re_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_2_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check2_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF dataOut_re_done_enb = '1' THEN
        check2_done <= dataOut_re_done;
      END IF;
    END IF;
  END PROCESS checkDone_2_process;

  dataReady_done_enb <= dataReady_done AND rdEnb;

  
  dataReady_active <= '1' WHEN dataReady_addr /= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  Input_Data_out2_addr_delay_1 <= Data_Type_Conversion_out1_addr AFTER 1 ns;

  -- Data source for validIn
  validIn_fileread: PROCESS (Input_Data_out2_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "validIn.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    rawData_validIn <= read_data;
  END PROCESS validIn_fileread;

  -- holdData reg for Input_Data_out2
  stimuli_Input_Data_out2_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      holdData_validIn <= 'X';
    ELSIF clk'event AND clk = '1' THEN
      holdData_validIn <= rawData_validIn;
    END IF;
  END PROCESS stimuli_Input_Data_out2_process;

  stimuli_Input_Data_out2_1: PROCESS (rawData_validIn, rdEnb)
  BEGIN
    IF rdEnb = '0' THEN
      validIn_offset <= holdData_validIn;
    ELSE
      validIn_offset <= rawData_validIn;
    END IF;
  END PROCESS stimuli_Input_Data_out2_1;

  validIn <= validIn_offset AFTER 2 ns;

  
  Data_Type_Conversion_out1_active <= '1' WHEN Data_Type_Conversion_out1_addr /= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  Data_Type_Conversion_out1_enb <= Data_Type_Conversion_out1_active AND (rdEnb AND tb_enb_delay);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 281760
  DataTypeConversion_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion_out1_addr <= to_unsigned(16#00000#, 19);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF Data_Type_Conversion_out1_enb = '1' THEN
        IF Data_Type_Conversion_out1_addr >= to_unsigned(16#44CA0#, 19) THEN 
          Data_Type_Conversion_out1_addr <= to_unsigned(16#00000#, 19);
        ELSE 
          Data_Type_Conversion_out1_addr <= Data_Type_Conversion_out1_addr + to_unsigned(16#00001#, 19);
        END IF;
      END IF;
    END IF;
  END PROCESS DataTypeConversion_process;


  Data_Type_Conversion_out1_addr_delay_1 <= Data_Type_Conversion_out1_addr AFTER 1 ns;

  -- Data source for dataIn
  dataIn_fileread: PROCESS (Data_Type_Conversion_out1_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "dataIn.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    rawData_dataIn <= read_data;
  END PROCESS dataIn_fileread;

  -- holdData reg for Data_Type_Conversion_out1
  stimuli_Data_Type_Conversion_out1_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      holdData_dataIn <= 'X';
    ELSIF clk'event AND clk = '1' THEN
      holdData_dataIn <= rawData_dataIn;
    END IF;
  END PROCESS stimuli_Data_Type_Conversion_out1_process;

  stimuli_Data_Type_Conversion_out1_1: PROCESS (rawData_dataIn, rdEnb)
  BEGIN
    IF rdEnb = '0' THEN
      dataIn_offset <= holdData_dataIn;
    ELSE
      dataIn_offset <= rawData_dataIn;
    END IF;
  END PROCESS stimuli_Data_Type_Conversion_out1_1;

  dataIn <= dataIn_offset AFTER 2 ns;

  snkDonen <=  NOT snkDone;

  resetn <=  NOT reset;

  tb_enb <= resetn AND snkDonen;

  -- Delay inside enable generation: register depth 1
  u_enable_delay_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tb_enb_delay <= '0';
    ELSIF clk'event AND clk = '1' THEN
      tb_enb_delay <= tb_enb;
    END IF;
  END PROCESS u_enable_delay_process;

  
  rdEnb <= tb_enb_delay WHEN snkDone = '0' ELSE
      '0';

  clk_enable <= rdEnb AFTER 2 ns;

  reset_gen: PROCESS 
  BEGIN
    reset <= '1';
    WAIT FOR 20 ns;
    WAIT UNTIL clk'event AND clk = '1';
    WAIT FOR 2 ns;
    reset <= '0';
    WAIT;
  END PROCESS reset_gen;

  clk_gen: PROCESS 
  BEGIN
    clk <= '1';
    WAIT FOR 5 ns;
    clk <= '0';
    WAIT FOR 5 ns;
    IF snkDone = '1' THEN
      clk <= '1';
      WAIT FOR 5 ns;
      clk <= '0';
      WAIT FOR 5 ns;
      WAIT;
    END IF;
  END PROCESS clk_gen;

  dataReady_enb <= ce_out AND dataReady_active;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 281760
  c_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataReady_addr <= to_unsigned(16#00000#, 19);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF dataReady_enb = '1' THEN
        IF dataReady_addr >= to_unsigned(16#44CA0#, 19) THEN 
          dataReady_addr <= to_unsigned(16#00000#, 19);
        ELSE 
          dataReady_addr <= dataReady_addr + to_unsigned(16#00001#, 19);
        END IF;
      END IF;
    END IF;
  END PROCESS c_3_process;


  
  dataReady_lastAddr <= '1' WHEN dataReady_addr >= to_unsigned(16#44CA0#, 19) ELSE
      '0';

  dataReady_done <= dataReady_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_1_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check1_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF dataReady_done_enb = '1' THEN
        check1_done <= dataReady_done;
      END IF;
    END IF;
  END PROCESS checkDone_1_process;

  snkDone <= check5_done AND (check4_done AND (check3_done AND (check1_done AND check2_done)));

  dataReady_addr_delay_1 <= dataReady_addr AFTER 1 ns;

  -- Data source for dataReady_expected
  dataReady_expected_fileread: PROCESS (dataReady_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "dataReady_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    dataReady_expected <= read_data;
  END PROCESS dataReady_expected_fileread;

  dataReady_ref <= dataReady_expected;

  dataReady_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataReady_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND dataReady /= dataReady_ref THEN
        dataReady_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in dataReady: Expected " & to_hex(dataReady_ref) & (" Actual " & to_hex(dataReady))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS dataReady_checker;

  dataOut_re_signed <= signed(dataOut_re);

  dataOut_re_addr_delay_1 <= dataReady_addr AFTER 1 ns;

  -- Data source for dataOut_re_expected
  dataOut_re_expected_fileread: PROCESS (dataOut_re_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "dataOut_re_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    dataOut_re_expected <= signed(read_data(15 DOWNTO 0));
  END PROCESS dataOut_re_expected_fileread;

  dataOut_re_ref <= dataOut_re_expected;

  dataOut_re_signed_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataOut_re_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND dataOut_re_signed /= dataOut_re_ref THEN
        dataOut_re_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in dataOut_re_signed: Expected " & to_hex(dataOut_re_ref) & (" Actual " & to_hex(dataOut_re_signed))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS dataOut_re_signed_checker;

  dataOut_im_signed <= signed(dataOut_im);

  -- Data source for dataOut_im_expected
  dataOut_im_expected_fileread: PROCESS (dataOut_re_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "dataOut_im_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    dataOut_im_expected <= signed(read_data(15 DOWNTO 0));
  END PROCESS dataOut_im_expected_fileread;

  dataOut_im_ref <= dataOut_im_expected;

  dataOut_im_signed_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataOut_im_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND dataOut_im_signed /= dataOut_im_ref THEN
        dataOut_im_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in dataOut_im_signed: Expected " & to_hex(dataOut_im_ref) & (" Actual " & to_hex(dataOut_im_signed))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS dataOut_im_signed_checker;

  txDiagBus_QPSKConstellationPoints_re_signed <= signed(txDiagBus_QPSKConstellationPoints_re);

  txDiagBus_QPSKConstellationPoints_re_addr_delay_1 <= dataReady_addr AFTER 1 ns;

  -- Data source for txDiagBus_QPSKConstellationPoints_re_expected
  txDiagBus_QPSKConstellationPoints_re_expected_fileread: PROCESS (txDiagBus_QPSKConstellationPoints_re_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "txDiagBus_QPSKConstellationPoints_re_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    txDiagBus_QPSKConstellationPoints_re_expected <= signed(read_data(15 DOWNTO 0));
  END PROCESS txDiagBus_QPSKConstellationPoints_re_expected_fileread;

  txDiagBus_QPSKConstellationPoints_re_ref <= txDiagBus_QPSKConstellationPoints_re_expected;

  txDiagBus_QPSKConstellationPoints_re_signed_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      txDiagBus_QPSKConstellationPoints_re_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND txDiagBus_QPSKConstellationPoints_re_signed /= txDiagBus_QPSKConstellationPoints_re_ref THEN
        txDiagBus_QPSKConstellationPoints_re_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in txDiagBus_QPSKConstellationPoints_re_signed: Expected " & to_hex(txDiagBus_QPSKConstellationPoints_re_ref) & (" Actual " & to_hex(txDiagBus_QPSKConstellationPoints_re_signed))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS txDiagBus_QPSKConstellationPoints_re_signed_checker;

  txDiagBus_QPSKConstellationPoints_im_signed <= signed(txDiagBus_QPSKConstellationPoints_im);

  -- Data source for txDiagBus_QPSKConstellationPoints_im_expected
  txDiagBus_QPSKConstellationPoints_im_expected_fileread: PROCESS (txDiagBus_QPSKConstellationPoints_re_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "txDiagBus_QPSKConstellationPoints_im_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    txDiagBus_QPSKConstellationPoints_im_expected <= signed(read_data(15 DOWNTO 0));
  END PROCESS txDiagBus_QPSKConstellationPoints_im_expected_fileread;

  txDiagBus_QPSKConstellationPoints_im_ref <= txDiagBus_QPSKConstellationPoints_im_expected;

  txDiagBus_QPSKConstellationPoints_im_signed_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      txDiagBus_QPSKConstellationPoints_im_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND txDiagBus_QPSKConstellationPoints_im_signed /= txDiagBus_QPSKConstellationPoints_im_ref THEN
        txDiagBus_QPSKConstellationPoints_im_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in txDiagBus_QPSKConstellationPoints_im_signed: Expected " & to_hex(txDiagBus_QPSKConstellationPoints_im_ref) & (" Actual " & to_hex(txDiagBus_QPSKConstellationPoints_im_signed))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS txDiagBus_QPSKConstellationPoints_im_signed_checker;

  txDiagBus_QPSKConstellationValid_addr_delay_1 <= dataReady_addr AFTER 1 ns;

  -- Data source for txDiagBus_QPSKConstellationValid_expected
  txDiagBus_QPSKConstellationValid_expected_fileread: PROCESS (txDiagBus_QPSKConstellationValid_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "txDiagBus_QPSKConstellationValid_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    txDiagBus_QPSKConstellationValid_expected <= read_data;
  END PROCESS txDiagBus_QPSKConstellationValid_expected_fileread;

  txDiagBus_QPSKConstellationValid_ref <= txDiagBus_QPSKConstellationValid_expected;

  txDiagBus_QPSKConstellationValid_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      txDiagBus_QPSKConstellationValid_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND txDiagBus_QPSKConstellationValid /= txDiagBus_QPSKConstellationValid_ref THEN
        txDiagBus_QPSKConstellationValid_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in txDiagBus_QPSKConstellationValid: Expected " & to_hex(txDiagBus_QPSKConstellationValid_ref) & (" Actual " & to_hex(txDiagBus_QPSKConstellationValid))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS txDiagBus_QPSKConstellationValid_checker;

  validOut_addr_delay_1 <= dataReady_addr AFTER 1 ns;

  -- Data source for validOut_expected
  validOut_expected_fileread: PROCESS (validOut_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "validOut_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    validOut_expected <= read_data;
  END PROCESS validOut_expected_fileread;

  validOut_ref <= validOut_expected;

  validOut_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      validOut_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND validOut /= validOut_ref THEN
        validOut_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in validOut: Expected " & to_hex(validOut_ref) & (" Actual " & to_hex(validOut))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS validOut_checker;

  testFailure <= validOut_testFailure OR (txDiagBus_QPSKConstellationValid_testFailure OR (txDiagBus_QPSKConstellationPoints_im_testFailure OR (txDiagBus_QPSKConstellationPoints_re_testFailure OR (dataOut_im_testFailure OR (dataReady_testFailure OR dataOut_re_testFailure)))));

  completed_msg: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF snkDone = '1' THEN
        IF testFailure = '0' THEN
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        ELSE
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
        END IF;
      END IF;
    END IF;
  END PROCESS completed_msg;

END rtl;

