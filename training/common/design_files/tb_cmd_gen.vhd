--
-- -------------------------------------------------------------------------------------------------
--
-- Project: waveGenTestBench
-- Description: provides a working simulation environment using the principles of a time-agnostic
--              test bench for the waveGen design.
--
-- File: tb_cmd_gen
-- Description: reads a text file from the disk and plays it to the tb_uart_driver one line at a time.
--              when the tb_uart_driver is ready for the next line (command), it brings the "next_command"
--              signal high.
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

use STD.textio.all;
use IEEE.std_logic_textio.all;


entity tb_cmd_gen is
   generic (fileName               : string;
            endSimulationAt        : time
           );
   port    (reset                  : in  std_logic;
            next_command_request   : in  boolean;
            more_commands_available: out boolean;
            command_string         : out String
           );
end entity tb_cmd_gen;


architecture BEHAVIORAL of tb_cmd_gen is
     signal welcome_done : boolean := false;
   begin
   
      -- welcome message
      welcome: process
         begin
            report "preparing command file: " & fileName;
            report "waiting for reset to deassert...";
            wait until reset = '0'; 
            welcome_done <= true;
            wait;
         end process welcome;
      
      --
      lineFromFile: process
            variable returnString       : string (1 to 32);
            variable index              : integer;
            file     source_file        : TEXT open READ_MODE is fileName;
            variable lineOfTextFromFile : line;
            variable status             : boolean := false;
         begin
      
             -- wait for welcome process to complete
             wait until welcome_done;
        
             more_commands_available <= false;                   -- no commands available (yet) 
      
             -- iterate through the entire source file 
             loopWholeFile: while (not ENDFILE(source_file)) loop             
                wait until next_command_request'event and next_command_request;  
                readline(source_file,lineOfTextFromFile);
                status := true;
                index  := 0;
                get_chars_in_line: while (status) loop
                   index := index + 1;
                   read(lineOfTextFromFile,returnString(index),status);
                end loop get_chars_in_line;
           
                -- make certain that the string is 32 characters long
                fill_string: for i in index to 32 loop
                   returnString(i) := NUL;
                end loop fill_string;
             
                command_string <= returnString;
                more_commands_available <= true;               -- now there is a command available
              
             end loop loopWholeFile;
          
             more_commands_available <= false;    -- the command file has now been completely consumed
       
             -- issue command to user console
             assert false
             report "end of data file reached"
             severity warning;
          
             -- stop the simulation after 1 second
             wait for 1 sec;
             report "forcably ending simulation"
             severity failure;
    
         end process lineFromFile;
      
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
