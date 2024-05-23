----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:29:17 01/31/2009 
-- Design Name: 
-- Module Name:    tb_resp_checker - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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


library utilities_lib;
use utilities_lib.time_utilities_pkg.all;
use utilities_lib.string_utilities_synth_pkg.all;

library specific_support_lib;
use specific_support_lib.tb_fifo_pkg.all;


entity tb_resp_checker is
    Port (  data_to_send    : in  STD_LOGIC_VECTOR(7 downto 0);
             data_sent      : in  STD_LOGIC;
             rx_data        : in  STD_LOGIC_VECTOR (7 downto 0);
             frm_err        : in  STD_LOGIC;
             rx_data_rdy    : in  STD_LOGIC
           );
end tb_resp_checker;


architecture Behavioral of tb_resp_checker is

    signal data_fifo_debug : FIFO_TYPE;
    
    signal char_received : STD_LOGIC_VECTOR (7 downto 0);

    shared variable data_fifo  : FIFO_TYPE := (width=>8, depth=>16, 
                                               read_ptr=>0, write_ptr=>0, 
                                               n_reads=>0, n_writes=>0,
                                               volume=>0, 
                                               empty=>true, full=>false, 
                                               contents=>(others=>(others=>'0')));

    begin
          
       loadFifo: process
             variable last_data_sent : std_logic := '0';              -- initialize to zero to detect the first rising edge             
          begin
             if ((data_sent = '1') and (last_data_sent = '0')) then   -- detect the rising of signal data_out_sent
                push(data_fifo,data_to_send);                         -- push the datum onto the stack
             end if;
             last_data_sent := data_sent;                             -- update the value for the next comparison           
             wait for 1 ns;             
          end process loadFifo;
          
       validate: process       
             variable sent_data         : std_logic_vector(7 downto 0);
             variable last_rx_data_rdy  : std_logic := '0';
          begin
             if ((rx_data_rdy = '1') and (last_rx_data_rdy = '0')) then  -- if the rising edge of the strobe signal is asserted      
                char_received <= rx_data;
                if (data_fifo.empty) then
                   writeNowToScreen("ERROR Data FIFO is not empty when expected");
                else
                   pop(data_fifo,sent_data);              -- pop the data FIFO and stick the result in my_data
                   wait for 1 ns;                         -- wait for the output data to be valid after the rising edge of the strobe
                   if (frm_err = '0') then                -- if there wasn't a frame error then...
                      if (rx_data /= sent_data) then      -- is what we sent what we received?
                         writeNowToScreen("Error Data mismatch. Expected: " & slvToHexString(sent_data) & "(" & slvToHexString(sent_data) & ")");
                         writeNowToScreen("                     Received: " & slvToHexString(rx_data) & "(" & slvToHexString(rx_data) & ")");

                      else                                -- data did match
                         writeNowToScreen("Data received correctly: " & slvToHexString(sent_data) & "(" & slvToHexString(sent_data) & ")");
                      end if;                             -- end of data sent vs data received check
                   else                                   -- there WAS a framing error
                      writeNowToScreen("Framing error detected - character lost!");
                   end if;                                -- end of framing error detection
                end if;                                   -- end of strobe high test
             end if;                                      -- end of rising edge test
             last_rx_data_rdy := rx_data_rdy;             -- update for next iteration
             wait for 1 ns;                               -- prevents infinite loop. implies that this process will "sample" at 1 ns rate           
          end process validate;
          

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
