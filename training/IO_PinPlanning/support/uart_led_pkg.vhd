--<insert: c:\HW\releasedULD\headers\uart_led_pkg.head>
-- -----------------------------------------------------------------------------
--
-- module:    uart_led_pkg
-- project:   uart_led
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   This package provides a convenient mechanism for encapsulating all of the
--   modules used in the uart_led project. To access these module definitions,
--   all one must do is name the library where the package is
--   stored and implement a  use  statement. Typically, this module may reside
--   where all the other VHDL sources exist and, by default, this file will
--   appear in the  WORK  library. The  WORK  library is accessed by default so
--   the  library work;  statement is optional. The next line should read  use
--   WORK.uart_led_pkg.all; which will make all of the contents of this package
--   available to the file in which this statement exists.
--
--   Note that only modules that make use of any of the contents in this package 
--   are required to explicitly connect to it.
--
--   The package also includes a number of constants and user defined enumerated 
--   types. 
--
--   As a rule of thumb, I place all the component instantiations in a package 
--   to reduce the  clutter 
--   within a file.
--
--   Types, subtypes, functions, procedures, and constant are included if they are 
--   used by more than one module. This reduces errors due to inconsistant usage.
-- 
-- known issues:
-- status           id     found     description                      by fixed date  by    comment
-- 
-- version history:
--   version    date    author     description
--    11.1-001 20 APR 2009 WK       New for version 11.1       
--     
-- ---------------------------------------------------------------------------
-- 
--
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
--
-- ----------------------------------------------------------------------------
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;


package uart_led_pkg is

    -- 
    -- Device constants
    --
    
    -- Number of bits of address for the Sample RAM - RAM can hold 2^NSAMP_WID
    -- Since NSAMP is coded "naturally" (from 1 to 2**NSAMP_WID, rather than
    -- from 0 to 2**(NSAMP_WID)-1), an extra bit is required in things that
    -- carry the actual value of nsamp. However, the RAM address is coded
    -- 0 to 2**NSAMP_WID-1
    constant NSAMP_WIDTH             : integer := 10;        

    --
    -- specialized types
    --
    type RESPONSE_TYPE is (ACK, ERR, DATA, UNKNOWN);
    
    
    --
    -- component definitions
    --
    
    
    component uart_rx is
       generic (
                BAUD_RATE   : integer :=     115_200;                 -- serves as clock divisor
                CLOCK_RATE  : integer := 100_000_000                  -- freq of clk
             );
        Port ( rst_clk_rx      : in  STD_LOGIC;                       -- active high, managed synchronously
               clk_rx          : in  STD_LOGIC;                       -- operational clock
               rxd_i           : in  STD_LOGIC;                       -- directly from pad - not yet associated with any time domain
               rx_data         : out STD_LOGIC_VECTOR (7 downto 0);   -- 8 bit data output valid when rx_data_rdy is asserted
               rx_data_rdy     : out STD_LOGIC;                       -- active high signal indicating rx_data is valid
               frm_err         : out STD_LOGIC                        -- framing error - active high when STOP bit not detected
              );
    end component uart_rx;  
    
    
    component meta_harden is
        port ( clk_dst      : in  STD_LOGIC;
               rst_dst      : in  STD_LOGIC;
               signal_src   : in  STD_LOGIC;
               signal_dst   : out STD_LOGIC);
    end component meta_harden;    
    

    component uart_baud_gen is
        Generic (CLOCK_RATE       : integer := 100_000_000;              -- clock rate
                 BAUD_RATE        : integer :=     115_200               -- desired baud rate
                );                   
        Port ( rst                : in  STD_LOGIC;                       -- external reset in
               clk                : in  STD_LOGIC;                       -- clock 
               baud_x16_en        : out STD_LOGIC
              );
    end component uart_baud_gen;
    
    component uart_rx_ctl
       PORT(
             clk_rx      : IN  std_logic;
             rst_clk_rx  : IN  std_logic;
             baud_x16_en : IN  std_logic;
             rxd_clk_rx  : IN  std_logic;          
             rx_data     : OUT std_logic_vector(7 downto 0);
             rx_data_rdy : OUT std_logic;
             frm_err     : OUT std_logic
          );
    END component uart_rx_ctl;    
    
    --
    -- handy constants
    constant vcc               : std_logic_vector(31 downto 0) := (others=>'1');
    constant gnd               : std_logic_vector(31 downto 0) := (others=>'0');


end uart_led_pkg;


package body uart_led_pkg is

end uart_led_pkg;
