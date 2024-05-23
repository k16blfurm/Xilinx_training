----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:07 01/29/2009 
-- Design Name: 
-- Module Name:    tb_uart_driver - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--    takes a message passed via generic and sends it as a bit period via port connections
--    models the transmit side of a UART behaviorally (not for synthesis)
--
--   rst_clk_rx      - reset signal synchronized with the clk_rx signal
--   data_sent       - asserted when complete message has been sent
--   data_to_send    - character to transmit (byte)
--   data_out_serial - serialized version of data_to_send
-- 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
-- Notes:
--    is the FIFO package necessary? It doesn't seem to be needed
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

library std;
use STD.TEXTIO.all;

library utilities_lib;
use utilities_lib.time_utilities_pkg.all;
use utilities_lib.string_utilities_synth_pkg.all;

library specific_support_lib;
use specific_support_lib.tb_fifo_pkg.all;


entity tb_uart_driver is
    generic ( 
       MESSAGE     : String := "default";
       BIT_PERIOD     : time := 10 ns
      );
   port ( 
       rst_clk_rx        : in  std_logic;
       data_sent         : out std_logic;
       data_to_send      : out std_logic_vector(7 downto 0);
       data_out_serial   : out std_logic
      );
end tb_uart_driver;


architecture Behavioral of tb_uart_driver is 

    begin
    
       send_char_bitper: process
             variable char_to_send      : character := '?';     
             variable char_code         : integer range 0 to 255 := 0;
             variable slv_char_to_send  : std_logic_vector(7 downto 0) := (others=>'U');
             variable char_as_string    : string (1 to 1);
             variable hex_as_string     : string (1 to 6);
             variable console_message   : string (1 to 34);
             
             variable local_data_fifo   : FIFO_TYPE;
             
          begin
          
             data_to_send      <= (others=>'0');                   -- hold the parallel data lines inactive
             data_out_serial   <= '1';                             -- line should be driven high when not in use
             data_sent         <= '0';                             -- nothing sent yet

             wait until (rst_clk_rx = '0');                        -- wait for the reset to be deasserted
             wait for 5 us;                                        -- give the receiver time to wake up
          
             -- loop through the entire message
             sendChars: for i in 1 to MESSAGE'length loop
                -- display the character to be sent
                -- although char_to_send can be printed directly, the following method handles non-printing characters gracefully
                char_to_send      := MESSAGE(i);									-- specific character to send for this iteration
                char_code         := character'pos(char_to_send);                   -- convert from a character to an integer (ASCII value)
                slv_char_to_send     := std_logic_vector(to_unsigned(char_code,8)); -- convert from an integer to a std_logic_vector
                console_message   := "Sending character " & intToChar(char_code) & "(" & slvToHexString(slv_char_to_send) & ")";  -- dump to the screen
                writeNowToScreen(console_message);
                
                data_sent     <= '0';                           -- deassert the completion bit as we are now beginning to transmit a new char
                data_to_send  <= slv_char_to_send;              -- provide a std_logic_vector version of the character being transmitted for later comparison with the output of the receiver
                data_out_serial   <= '0';                       -- send start bit
                wait for BIT_PERIOD;                            -- and hold for one bit period
                data_sent   <= '1';                             -- indicate that the data transmission is now complete
                
                -- loop through the 8 bits of data and send lsb first
                for j in 0 to 7 loop                            -- loop through all 8 bits
                   data_out_serial <= slv_char_to_send(j);      -- get the i-th bit from the character to send
                   wait for BIT_PERIOD;                         -- and hold for one bit period
                end loop;
                data_sent   <= '0';                             -- drop the data sent bit

                data_out_serial <= '1';                         -- send stop bit
                wait for BIT_PERIOD;                            -- delay a period for the stop bit
                
                                                                -- just need a blip to trigger the validator (debug)
                wait for BIT_PERIOD;                            -- let the line idle 1 bit before sending the next character
             end loop;

             -- wait sufficiently long for the receiver to acquire the data and halt the simulation
             wait for 1 ms;
             assert false
             report "***** Simulation Ending due to all data being transmitted! *****"
             severity failure;

             wait;
             
          end process send_char_bitper;

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
