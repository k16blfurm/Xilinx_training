--<insert:  c:\HW\releasedULD\headers\rst_gen.head>
-- -----------------------------------------------------------------------------
--
-- module:    rst_gen
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   This module is the reset generator for the  design.
--   It takes the asynchronous reset in (from the IBUF), and  generates
--   three synchronous resets - one on each clock domain.
-- 
-- known issues:
-- status           id     found     description                      by fixed date  by    comment
-- 
-- version history:
--   version    date    author     description
--    11.1-001 20 APR 2009 WK       First version for 11.1          
-- 
-- -----------------------------------------------------------------------
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
-- -----------------------------------------------------------------------
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.wave_gen_pkg.all;                    -- load component definitions


entity rst_gen is
    Port (clk_tx         : in  std_logic;     -- transmitter clock
          clk_rx         : in  std_logic;     -- receiver clock
          clk_samp       : in  std_logic;     -- sample clock
          rst_i          : in  std_logic;     -- asynchronous reset input
          clock_locked   : in  std_logic;     -- Locked signal from clk_core
          rst_clk_tx     : out std_logic;     -- reset synchronized to clk_tx
          rst_clk_rx     : out std_logic;     -- reset synchronized to clk_rx
          rst_clk_samp   : out std_logic      -- reset synchronized to clk_samp
         );
end rst_gen;


architecture Behavioral of rst_gen is

      signal int_rst     : std_logic := 'U';  -- asynchronous reset or MMCM not locked
    begin
       
      int_rst <= rst_i or not(clock_locked);

       -- generate 3 copies of the debouncer, each gets the same signal in, but in 3 different time domains
       reset_bridge_clk_tx_i0:   reset_bridge port map (clk_dst=>clk_tx,   rst_in=>int_rst, rst_dst=>rst_clk_tx);
       reset_bridge_clk_rx_i0:   reset_bridge port map (clk_dst=>clk_rx,   rst_in=>int_rst, rst_dst=>rst_clk_rx);
       reset_bridge_clk_samp_i0: reset_bridge port map (clk_dst=>clk_samp, rst_in=>int_rst, rst_dst=>rst_clk_samp);

    end Behavioral;

