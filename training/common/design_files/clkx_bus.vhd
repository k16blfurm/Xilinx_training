--<insert: c:\HW\releasedULD\headers\clkx_bus.head>
-- -----------------------------------------------------------------------------
--
-- module:    clkx_bus
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   This is a basic meta-stability hardener; it double synchronizes  an
--   asynchronous signal onto a new clock  domain.
--   
-- Multicycle and False Paths, Timing  Exceptions
--   A tighter timing constraint should be placed between the  signal_meta
--   and signal_dst flip-flops to allow for meta-stability settling time
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
use work.wave_gen_pkg.all;                                            -- load the compondent definitions


entity clkx_bus is
    generic (PW          : in  integer :=  3;                         -- pulse width
             WIDTH       : in  integer := 16                          -- bus width
          );
    Port ( 
           clk_src       : in  std_logic;                             -- source clock
           rst_clk_src   : in  std_logic;                             -- reset - synchronous to source clock
           clk_dst       : in  std_logic;                             -- destination clock
           rst_clk_dst   : in  std_logic;                             -- reset - synchronous to destination clock
           bus_src       : in  std_logic_vector (WIDTH-1 downto 0);   -- bus input - synchronous to source clock
           bus_new_src   : in  std_logic;                             -- active high indicator that bus_src has changed this source clock
           bus_dst       : out std_logic_vector (WIDTH-1 downto 0);   -- bus output - synchronous to destination clock
           bus_new_dst   : out std_logic                              -- active high indicator that bus_dst has changed this destination clock
          );
end clkx_bus;


architecture Behavioral of clkx_bus is

       signal bus_new_stretch_src    : std_logic := 'U';              -- 
       signal bus_samp_src           : std_logic_vector(WIDTH-1 downto 0) := (others=>'U');
       signal bus_new_stretch_dst    : std_logic := 'U';
       signal bus_new_stretch_old_dst: std_logic := 'U';

    begin

       -- generate the stretched version of the source bus
       -- when a new value is detected on the source bus, we count from PW-1 downto 0 and delay the assertion
       -- of the "new" signal until the end of the stretch
       strch_src: process (clk_src)
             variable bus_new_cnt_src : integer range 0 to PW := 0;   -- pulse width counter
          begin
             if rising_edge(clk_src) then                    -- synchronize this processes activities with the source clock
                if (rst_clk_src = '1') then                  -- are we dealing with a reset event from the source domain?
                   bus_new_cnt_src     := 0;
                   bus_new_stretch_src <= '0';
                else                                         -- not a reset event, do "normal" events
                   bus_new_stretch_src <= '0';               -- normally not stretching the pulse
                   if (bus_new_cnt_src /= 0) then            -- if the count is not zero, then 
                      bus_new_cnt_src     := bus_new_cnt_src - 1;-- decrement the count 
                      bus_new_stretch_src <= '1';            -- assert the new data signal
                   elsif (bus_new_src = '1') then            -- count is zero, is there new data to process?
                      bus_new_cnt_src     := PW - 1;         -- reset the pulse width counter
                      bus_new_stretch_src <= '1';            -- mark this for stretching too
                   end if;                                   -- end of counting check
                end if;                                      -- end of reset/normal activities
             end if;                                         -- end of synchronous events
          end process strch_src;

       -- Sample the incoming bus whenever the "new" signal is asserted to ensure
       -- that we have a stable version of it between assertions of "new"
       newSamp: process (clk_src)
          begin
             if rising_edge(clk_src) then                    -- keep this synchronous to the clk_src domain
                if (rst_clk_src = '1') then                  -- is there a reset even asserted?
                   bus_samp_src <= (others=>'0');
                else                                         -- no reset, do normal events
                   bus_samp_src <= bus_src;
                end if;                                      -- end of reset/non-reset tasks
             end if;                                         -- end of synchronous tasks
          end process newSamp;


       -- Metastability harden the bus_new_stretch_src
       meta_harden_bus_new_i0: meta_harden 
          port map (clk_dst    => clk_dst,
                    rst_dst    => rst_clk_dst,
                    signal_src => bus_new_stretch_src,
                    signal_dst => bus_new_stretch_dst
                   );
       

       -- Capture the value of bus_new_stretch_dst for edge detection
       cptr_bus_dst: process (clk_dst)
          begin
             if rising_edge(clk_dst) then                    -- keep this synchronous to the destination clock domain
                if (rst_clk_dst = '1') then                  -- is the destination in reset?
                   bus_new_stretch_old_dst <= '0';
                else                                         -- reset not active, do "normal" events
                   bus_new_stretch_old_dst <= bus_new_stretch_dst;
                end if;                                      -- end of reset/non-reset events
             end if;                                         -- end of synchronous events
          end process cptr_bus_dst;


       -- Now generate the outputs
       genOuts: process (clk_dst)
          begin
             if rising_edge(clk_dst) then                    -- keep this synchronous to the destination clock domain
                if (rst_clk_dst = '1') then                  -- is the destination in reset?
                   bus_dst     <= bus_src;
                   bus_new_dst <= '0';
                else                                         -- reset not active, do "normal" events
                   bus_new_dst <= '0';                       -- normally no new data, unless...
                   if ((bus_new_stretch_dst = '1') and (bus_new_stretch_old_dst = '0')) then -- rising edge change in state detected
                         -- This is the first clock that bus_new_stretch_dst is asserted
                         -- We know that bus_samp_src is stable, so we can sample it on the
                         -- destination clock even though it is on the other clock domain.
                         -- We also need to pulse the bus_new_dst for one clock
                         bus_dst     <= bus_samp_src;
                         bus_new_dst <= '1';
                   else
                   end if;
                end if;                                      -- end of reset/non-reset events
             end if;                                         -- end of synchronous events
          end process genOuts;


    end Behavioral;

