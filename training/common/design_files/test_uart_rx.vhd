--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:56:19 05/08/2008
-- Design Name:   
-- Module Name:   test_uart_rx.vhd
-- Project Name:  LabFlow
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FPGAFlowDesign
-- 
-- Dependencies:
-- 
-- Revision history:
--    2008/05/08 - ?? - initial
--
-- ---------------------------------------------------------------------------
-- 
--
--<copyright-disclaimer-start>
--<copyright-disclaimer-start>
--  **************************************************************************************************************
--  * © 2023 Advanced Micro Devices, Inc. All rights reserved.                                                   *
--  * DISCLAIMER                                                                                                 *
--  * The information contained herein is for informational purposes only, and is subject to change              *
--  * without notice. While every precaution has been taken in the preparation of this document, it              *
--  * may contain technical inaccuracies, omissions and typographical errors, and AMD is under no                *
--  * obligation to update or otherwise correct this information.  Advanced Micro Devices, Inc. makes            *
--  * no representations or warranties with respect to the accuracy or completeness of the contents of           *
--  * this document, and assumes no liability of any kind, including the implied warranties of noninfringement,  *
--  * merchantability or fitness for particular purposes, with respect to the operation or use of AMD            *
--  * hardware, software or other products described herein.  No license, including implied or                   *
--  * arising by estoppel, to any intellectual property rights is granted by this document.  Terms and           *
--  * limitations applicable to the purchase or use of AMD’s products are as set forth in a signed agreement     *
--  * between the parties or in AMD's Standard Terms and Conditions of Sale. GD-18                               *
--  *                                                                                                            *
--  **************************************************************************************************************
--<copyright-disclaimer-end>
--<copyright-disclaimer-end>
--
-- ----------------------------------------------------------------------------
--
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.all;

library work;
use work.uart_led_pkg.all;

library utilities_lib;
use utilities_lib.time_utilities_pkg.all;
use utilities_lib.string_utilities_synth_pkg.all;

 
ENTITY test_uart_rx IS
     Generic (CLOCK_RATE       : integer := 125_000_000;              -- clock rate
              BAUD_RATE        : integer :=     115_200               -- desired baud rate
              );
END test_uart_rx;


ARCHITECTURE behavior OF test_uart_rx IS 
 
        -- Component Declaration for the Unit Under Test (UUT)
       component uart_rx is
          generic (
                   BAUD_RATE   : integer :=     115_200;              -- serves as clock divisor
                   CLOCK_RATE  : integer := 100_000_000               -- freq of clk
                );
           Port ( rst_clk_rx         : in  STD_LOGIC;
                  clk_rx             : in  STD_LOGIC;
                  rxd_i              : in  STD_LOGIC;
                  rx_data            : out STD_LOGIC_VECTOR (7 downto 0);
                  rx_data_rdy        : out STD_LOGIC;
                  frm_err            : out STD_LOGIC
                 );
       END component uart_rx;
       
       component tb_uart_driver is
          generic ( 
                MESSAGE    : String := "default";
                BIT_PERIOD : time := 10 ns 
            );
          port ( 
             rst_clk_rx        : in  std_logic;
             data_sent         : out std_logic;
             data_to_send      : out std_logic_vector(7 downto 0);
             data_out_serial   : out std_logic
            );          
       end component tb_uart_driver;  
       
       component tb_resp_checker is
        port (  data_to_send   : in  STD_LOGIC_VECTOR(7 downto 0);
                data_sent      : in  STD_LOGIC;
                rx_data        : in  STD_LOGIC_VECTOR (7 downto 0);
                frm_err        : in  STD_LOGIC;
                rx_data_rdy    : in  STD_LOGIC
             );
       end component tb_resp_checker;  
        

       -- System signals
       signal clk_rx              : std_logic := 'U';
       signal rst_clk_rx          : std_logic := 'U';
       
       -- Internal data signals
       signal frm_err             : std_logic := 'U';
       signal data_to_send        : std_logic_vector(7 downto 0) := (others=>'U');
       signal delayed_data_to_send: std_logic_vector(7 downto 0) := (others=>'U');
       signal data_sent           : std_logic := 'U';
       signal rxd_i               : std_logic := 'U';
       signal rx_data             : std_logic_vector(7 downto 0) := (others=>'U');   -- from output of FIFO to the data checker
       signal rx_data_rdy         : std_logic := 'U';                                -- indicates that data is valid from the UART rx
       
       -- Clock period definitions
       constant CLK_RX_PERIOD   : time := 1.0 sec / real(CLOCK_RATE);
       constant BIT_PERIOD      : time := 1.0 sec / real(BAUD_RATE);
       
       signal   preferred_units   : string (1 to 3) := "ns ";
          
 
    BEGIN
    
       -- welcome message
       welcome: process
          begin
             writeNowToScreen("Starting the testbench for the receiver portion of the UART!");
             writeNowToScreen("BAUD_RATE = "&integer'IMAGE(BAUD_RATE));     
             writeNowToScreen("BIT_PERIOD = "&TIME'IMAGE(BIT_PERIOD));   -- doesn't work as expected            
             wait;
          end process welcome;

       -- generate the clk_rx signal
       gen_clk_rx: process
          begin
             clk_rx <= '0';
             wait for CLK_RX_PERIOD/2;
             clk_rx <= '1';
             wait for CLK_RX_PERIOD/2;
          end process;
 
       -- reset process
       reset_proc: process
          begin
             -- hold reset active for 100 rising edges of the clock
             writeNowToScreen("Asserting reset for 100 clock cycles");
             rst_clk_rx <= '1';
             rst_delay: for i in 1 to 100 loop
                wait until rising_edge(clk_rx);
             end loop;
             
             -- remove the reset and begin normal operation
             writeNowToScreen(String'("Deasserting reset"));
             rst_clk_rx <= '0';
             wait;
          end process reset_proc;
          
          
       -- Instantiate the data generator - uses the predefined character sequence and transmits bit-by-bit
       tb_uart_driver_i0: tb_uart_driver 
          generic map (BIT_PERIOD => BIT_PERIOD, 
                       MESSAGE => "Welcome to Our training")
          port map (  rst_clk_rx        => rst_clk_rx,
                      data_to_send      => data_to_send,
                      data_sent         => data_sent,
                      data_out_serial   => rxd_i
                     );
    
  
       -- Instantiate the data checker
       tb_resp_checker_i0: tb_resp_checker
           port map (data_to_send    => data_to_send,
                     data_sent       => data_sent,
                     rx_data         => rx_data,
                     frm_err         => frm_err,
                     rx_data_rdy     => rx_data_rdy
                    );

       -- Instantiate the unit under test 
       uart_rx_i0: uart_rx
          generic map (
                   BAUD_RATE   =>  BAUD_RATE,
                   CLOCK_RATE  => CLOCK_RATE              -- freq of clk
                )
           Port map ( rst_clk_rx     => rst_clk_rx,
                      clk_rx         => clk_rx,
                      rxd_i          => rxd_i,
                      rx_data        => rx_data,
                      rx_data_rdy    => rx_data_rdy,
                      frm_err        => frm_err
                    );      

    END;

