--<insert:  c:\HW\releasedULD\headers\clk_div.head>
-- -----------------------------------------------------------------------------
--
-- module:    clk_div
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   This module is a programmable divider use for generating the sample clock
--   (clk_samp). It continuously counts down from pre_clk_tx-1 to 0, asserting
--   en_clk_samp during the 0  count.
--   
-- To ensure proper reset of the FFs running on the derived clock,
--   en_clk_samp is asserted during  reset.
--   
--  Notes:
--   pre_clk_tx must be at least 2 for this module to work. Since it is not
--   allowed to be less than 32 (by the parser), this is not a problem.
-- 
-- known issues:
-- status           id     found     description                      by fixed date  by    comment
-- 
-- version history:
--   version    date    author     description
--    11.1-001 20 APR 2009 WK       New for version 11.1            
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity clk_div is
    Port ( clk_tx                 : in  std_logic;                       -- transmitter clock
           rst_clk_tx             : in  std_logic;                       -- reset signal synchronized to the transmitter clock
           prescale_clk_tx        : in  std_logic_vector (15 downto 0);  -- current prescaler value synchronized to clk_tx
           en_clk_samp            : out std_logic                        -- indication that the clk_samp is in the first clk_tx period after the rising edge. Asserted during clk_tx period after en_clk_samp
          );
end clk_div;

architecture Behavioral of clk_div is

begin

    clkDiv: process (clk_tx)
          variable internal_counter : integer range 0 to 65535 := 0;           -- set of registers for maintaining the count
       begin
          if rising_edge(clk_tx) then                                          -- synchronous event test
             if (rst_clk_tx = '1') then                                        -- reset asserted?
                internal_counter := 0;                                         -- reset the internal counter
                en_clk_samp      <= '0';                                       -- deassert the enable
             else                                                              -- non-reset behavior
                en_clk_samp      <= '0';                                       -- keep enable deasserted. overridden by count = 0 below
                if (internal_counter = 0) then                                 -- are we done with the count?
                   en_clk_samp      <= '1';                                    -- assert enable
                   internal_counter := to_integer(unsigned(prescale_clk_tx));  -- reset the internal counter the the specified value 
                else
                   internal_counter := internal_counter - 1;                   -- decrement count by 1
                end if;                                                        -- end of done with count
             end if;                                                           -- end of reset/normal operation
          end if;                                                              -- end of synchronous events
       end process clkDiv;

end Behavioral;

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
-- -----------------------------------------------------------------------------
