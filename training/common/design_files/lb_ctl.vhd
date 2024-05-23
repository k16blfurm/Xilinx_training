--<insert: c:\HW\releasedULD\headers\wave_gen.head>
-- -----------------------------------------------------------------------------
--
-- module:    wave_gen
-- project:   wave_gen
-- company:   Xilinx, Inc.
-- author:    WK, AW
-- 
-- comment:
--   This is the top level of the wave  generator.
--   It directly instantiates the I/O pads and all the submodules  required
--   to implement the  design.
--   
-- Multicycle and False  Paths
--   Some exist, embedded within the submodules. See the  submodule
--   descriptions.
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

library WORK;
use WORK.wave_gen_pkg.all;                             -- load components


entity lb_ctl is
    Generic (CLOCK_RATE     : integer := 50_000_000);  -- clock frequency
    Port (clk_tx            : in  std_logic;           -- transmitter clock domain (destination)
          rst_clk_tx        : in  std_logic;           -- reset synchronized to transmitter clock domain
          lb_sel_async      : in  std_logic;           -- loopback selector (high = do loopback, low = use output from uart_tx)
          txd_clk_tx        : in  std_logic;           -- transmit data from uart
          rxd_async         : in  std_logic;           -- received data - not synchronous to this clock
          txd_o             : out std_logic            -- loopback output - either from the transmitter data or the receive loopback
          );
end lb_ctl;


architecture Behavioral of lb_ctl is
       signal lb_sel_clk_tx : std_logic := 'U';     -- loopback signal synchronized with the tx clock domain
       signal rxd_i_clk_tx  : std_logic;
    begin
    
       -- debounce the loopback control signal
       debouncer_i0: debouncer 
                   generic map (FILTER => CLOCK_RATE/10) -- 100ms to register a change  *note* - set filter to something really small for verification 
                   port map (clk=>clk_tx, rst=>rst_clk_tx, signal_in=>lb_sel_async, signal_out=>lb_sel_clk_tx);

       meta_harden_rxd_i_i0: meta_harden port map (rst_dst=>rst_clk_tx, clk_dst=>clk_tx, signal_src=>rxd_async, signal_dst=>rxd_i_clk_tx);

       -- construct the multiplexer
        lbMux: process (clk_tx)
          begin
             if rising_edge(clk_tx) then
                if (rst_clk_tx = '1') then
                   txd_o <= '0';
                else
                   if (lb_sel_clk_tx = '1') then
                     txd_o <= rxd_i_clk_tx;
                   else
                     txd_o <= txd_clk_tx;
                   end if;
                end if;
             end if;
          end process lbMux;


    end Behavioral;

