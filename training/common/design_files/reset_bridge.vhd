--<insert:  c:\HW\releasedULD\headers\reset_bridge.head>
-- -----------------------------------------------------------------------------
--
-- module:    reset_gen
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

entity reset_bridge is
    Port (clk_dst     : in  std_logic;     -- destination clock
          rst_in      : in  std_logic;     -- async reset signal
          rst_dst     : out std_logic      -- sync'd reset signal
          );
end reset_bridge;


architecture Behavioral of reset_bridge is
  
    signal rst_meta: std_logic;            -- can go metastable on deassertion of rst_in

    begin
       
       -- reset signal must assert asynchronously, but deassert synchronously
       rstSync: process (clk_dst, rst_in)
          begin
             if (rst_in = '1') then           -- if the reset is active then asynchronously
                rst_meta <= '1';              -- set the meta net to 1 and
                rst_dst  <= '1';              -- assert the reset; otherwise
             elsif rising_edge(clk_dst) then  -- when the reset is low, don't deassert the reset until the 2nd rising edge of the synchronizing clock
                rst_meta <= '0';              -- clock a 0 into the first flop - this can go metastable
                rst_dst  <= rst_meta;         -- let the 0 propagate through on the 2nd clock
             end if;                          -- end of synchronous tasks
          end process rstSync;

    end Behavioral;

