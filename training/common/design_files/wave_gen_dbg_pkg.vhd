----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2013 10:43:45 AM
-- Design Name: 
-- Module Name: wave_gen_dbg_pkg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



package wave_gen_dbg_pkg is

   component vio_sample_button IS
      port (
         CLK        : IN  STD_LOGIC;
         PROBE_OUT0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
   end component vio_sample_button;
   
   component ila_rx_side IS
      port (
         CLK          : IN  STD_LOGIC;
         PROBE0       : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);
         PROBE1       : IN  STD_LOGIC_VECTOR( 7 DOWNTO 0);
         PROBE2       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0)
       );
   end component ila_rx_side;
   
   component ila_tx_side is
      port (
         CLK         : IN  STD_LOGIC;
         PROBE0      : IN  STD_LOGIC_VECTOR( 2 DOWNTO 0);
         PROBE1      : IN  STD_LOGIC_VECTOR( 7 DOWNTO 0);
         PROBE2      : IN  STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   end component ila_tx_side;

end package wave_gen_dbg_pkg;

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