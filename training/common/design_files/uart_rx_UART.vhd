--<insert: c:\HW\releasedULD\headers\uart_rx.head>
-- -----------------------------------------------------------------------------
--
-- module:    uart_rx
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   Top level of the UART  receiver.
--   Brings together the metastability hardener for synchronizing the  
--   rxd pin, the baudrate generator for generating the proper x16  bit
--   enable, and the controller for the UART  itself.
--   
-- Multicycle and False  Paths
--   The uart_baud_gen module generates a 1-in-N pulse (where N  is
--   determined by the baud rate and the system clock frequency),  which
--   enables all flip-flops in the uart_rx_ctl module. Therefore, all  paths
--   within uart_rx_ctl are multicycle paths, as long as N > 2 (which  it
--   will be for all reasonable combinations of Baud rate and  system
--   frequency).
-- 
-- known issues:
-- status           id     found     description                      by fixed date  by    comment
-- 
-- version history:
--   version    date    author     description
--    11.1-001 20 APR 2009 WK       First version for 11.1          
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


library WORK;
use work.uart_led_pkg.ALL;                             -- load component definitions


entity uart_rx is
    generic (
             BAUD_RATE   : integer := 57600;           -- serves as clock divisor
             CLOCK_RATE  : integer := 100000000        -- freq of clk
          );
    Port ( rst_clk_rx    : in  std_logic;              -- active high, managed synchronously
           clk_rx        : in  std_logic;              -- operational clock
           rxd_i         : in  std_logic;              -- directly from pad - not yet associated with any time domain
           rxd_clk_rx    : out std_logic;              -- RXD resynchronized to clk_rx
           rx_data       : out std_logic_vector (7 downto 0);   -- 8 bit data output valid when rx_data_rdy is asserted
           rx_data_rdy   : out std_logic;              -- active high signal indicating rx_data is valid
           frm_err       : out std_logic               -- framing error - active high when STOP bit not detected
          );
end uart_rx;


architecture Behavioral of uart_rx is

       signal baud_x16_en      : std_logic := 'U';
       signal rxd_clk_rx_int   : std_logic := 'U';

    begin
    
       --
       -- protect against meta-stability
       meta_harden_rxd_i0: meta_harden port map (rst_dst=>rst_clk_rx, clk_dst=>clk_rx, signal_src=>rxd_i, signal_dst=>rxd_clk_rx_int);

       -- Connect the output
       rxd_clk_rx     <= rxd_clk_rx_int;
    
       -- 
       -- free running counter that divides the incoming clock by a value to generate
       -- a 16 x baud rate enable signal
       --
       -- all paths that start and end on flip-flops enabled by baud_x16_en are multi-cycle
       -- 
       uart_baud_gen_rx_i0: uart_baud_gen 
           generic map (CLOCK_RATE  => CLOCK_RATE,
                        BAUD_RATE   => BAUD_RATE)                      
           port map    (rst         => rst_clk_rx,
                        clk         => clk_rx, 
                        baud_x16_en => baud_x16_en
                 );
       
       --
       -- receiver state machine
       uart_rx_ctl_i0: uart_rx_ctl PORT MAP(
          clk_rx      => clk_rx,
          rst_clk_rx  => rst_clk_rx,
          baud_x16_en => baud_x16_en,
          rxd_clk_rx  => rxd_clk_rx_int,
          rx_data     => rx_data,
          rx_data_rdy => rx_data_rdy,
          frm_err     => frm_err 
       );

       
    
    end Behavioral;


