--
-- -------------------------------------------------------------------------------------------------
--
-- Project: waveGenTestBench
-- Description: provides a working simulation environment using the principles of a time-agnostic
--              test bench and that of the "client/server" approach for the waveGen design. This 
--              design mimics the test fixture for the waveGen design (done in Verilog).
--
-- File: tb_resetgen
-- Description: implements the reset generate for test bench
-- Written:     WK  8/10/11
--
-- Notes:
-- Issues:
--
-- --------------------------------------------------------------------------------------------------
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library WORK;
use WORK.tb_wave_gen_helper_pkg.all;

library UTILITIES_LIB;
use UTILITIES_LIB.time_utilities_pkg.all;
use UTILITIES_LIB.string_utilities_sim_pkg.all;
use UTILITIES_LIB.string_utilities_synth_pkg.all;



entity tb_resetgen is
   generic(holdoff : integer := 10);
   port (clk    : in  std_logic;
         reset  : out std_logic
        );
end entity tb_resetgen;


architecture BEHAVIORAL of tb_resetgen is
   begin
   
      gen_reset: process is
            variable assert_reset_time : time;
         begin
            assert_reset_time := holdoff * CLOCK_PERIOD;
            report "Asserting reset for " & time2string(assert_reset_time);            
            reset <= '1';
            wait for assert_reset_time;
            report "Deasserting reset at time " & time2string(now);
            reset <= '0';
            wait;
         end process gen_reset;
   
   end architecture BEHAVIORAL;

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
