--<insert: c:\HW\releasedULD\headers\debouncer.head>
-- -----------------------------------------------------------------------------
--
-- module:    debouncer
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   Simple switch debouncer. Filters out any transition that lasts less than
--   FILTER clocks long
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
use IEEE.MATH_REAL.ALL;


entity debouncer is
    generic ( FILTER     : integer := 2_000_000        -- number of clocks required to acknowledge a valid change in switch state
           );
   port (clk             : in  std_logic;              -- clock input
         rst             : in  std_logic;              -- active high reset - synchronous to clock
         signal_in       : in  std_logic;              -- un-debounced signal
         signal_out      : out std_logic               -- debounced signal
         );
    constant RELOAD      : integer := FILTER - 1;  

end debouncer;


architecture Behavioral of debouncer is
       
       signal signal_in_clk : std_logic := 'U';

       component meta_harden is
         port ( clk_dst          : in  std_logic;
                rst_dst         : in  std_logic;
                signal_src       : in  std_logic;
                signal_dst       : out std_logic
           );
       end component;
       
    begin

       -- Anti-meta-stability/synchronization circuit
       meta_harden_signal_in_i0: meta_harden
                   port map (clk_dst    => clk,
                            rst_dst        => rst,
                            signal_src     => signal_in,
                            signal_dst     => signal_in_clk);

       -- Only transition the output if the input has been stable at a new value for FILTER clocks
       dbnc: process (clk)
             variable signal_out_reg    : std_logic := 'U';
             variable count             : integer range 0 to FILTER := FILTER;
          begin
             if rising_edge(clk) then                     -- everything happens synchronously with the driving clock
                if (rst = '1') then                       -- if the reset is asserted
                   signal_out_reg := signal_in_clk;       -- initializes to the last value of signal_in when exiting reset
                   count      := RELOAD;                  -- start with an expired counter
                else                                      -- reset not asserted - do "normal" activities                 
                   if (signal_in_clk = signal_out_reg) then  -- if the current input is the same as the last debounced output...
                      count := RELOAD;                    -- reload the counter
                    elsif (count = 0) then                -- Otherwise, it is different... if the count has expired
                      signal_out_reg := signal_in_clk;    -- then it has been different long enough - time to switch the output
                      count := RELOAD;                    -- and reload the counter
                    else                                  -- otherwise we are still waiting for it to be different for "long enough"
                      count := count - 1;                 -- decrement the counter
                   end if;                                -- end of transition check
                end if;                                   -- end of reset/normal operation                
             end if;                                      -- end of synchronous events test      

            signal_out <= signal_out_reg;                 -- drive the output with the previously latched value                
            
          end process dbnc;
             
    end Behavioral;


