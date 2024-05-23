--<insert: c:\HW\releasedULD\headers\out_ddr_flop.head>
-- -----------------------------------------------------------------------------
--
-- module:    out_ddr_flop
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   This is a wrapper around a basic DDR output flop. A version of this module
--   with identical ports exists for all target technologies for this design
--   (Spartan 3E and Virtex 5).
-- 
-- known issues:
-- status           id     found     description                      by fixed date  by    comment
-- 
-- version history:
--   version    date    author     description
--    11.1-001 20 APR 2009 WK       New for version 11.1            
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

library UNISIM;
use UNISIM.VComponents.all;

entity out_ddr_flop is
    Port ( clk        : in  std_logic;
           rst        : in  std_logic;
           d_rise     : in  std_logic;
           d_fall     : in  std_logic;
           q          : out  std_logic
       );
end out_ddr_flop;

architecture Behavioral of out_ddr_flop is
       
       constant logic_high   : std_logic := '1';
       constant logic_low    : std_logic := '0';

    begin
       -- ODDRE1: Dedicated Dual Data Rate (DDR) Output Register
       --         Kintex UltraScale
       -- Xilinx HDL Language Template, version 2013.4

       ODDR_inst : ODDRE1
       generic map (
          SRVAL => '0'  -- Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
       )
       port map (
          Q => q,       -- 1-bit output: Data output to IOB
          C => clk,     -- 1-bit input: High-speed clock input
          D1 => d_rise, -- 1-bit input: Parallel data input 1
          D2 => d_fall, -- 1-bit input: Parallel data input 2
          SR => rst     -- 1-bit input: Active High Reset
       );

    end Behavioral;

