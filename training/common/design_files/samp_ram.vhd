----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    26/08/2010 
-- Design Name: 
-- Module Name:    samp_ram - Behavioral 
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
--    This is an inferrable WRITE_FIRST dual port RAM
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library utilities_lib;
use utilities_lib.string_utilities_synth_pkg.all;

entity samp_ram is
   generic (DATA_WIDTH: integer := 16;
            ADDR_WIDTH: integer := 10   -- 2^10 = 1024
           );
   port (
         -- A port
         clka    : in  std_logic;
         wea     : in  std_logic_vector(0 downto 0);
         addra   : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
         dina    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
         douta   : out std_logic_vector(DATA_WIDTH-1 downto 0);
         -- B port
         clkb    : in  std_logic;                     
         web     : in  std_logic_vector(0 downto 0);
         addrb   : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
         dinb    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
         doutb   : out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
end entity samp_ram;


architecture Behavioral of samp_ram is
       type ram_type is array ((2**ADDR_WIDTH)-1 downto 0) of std_logic_vector (DATA_WIDTH-1 downto 0);
       shared variable mem_array: ram_type;

    begin
    
      process (clka)
            variable noMetas : boolean := true;      
         begin
            if rising_edge(clka) then
                noMetas := true;
                metasInDataA: if (areMetaChars(dina)) then
                    noMetas := false;
                    report "(samp_ram) Metacharacter found on 'B' side of RAM (data) - not processed";                   
                end if metasInDataA;
                
                metasInAddrA: if (areMetaChars(addra)) then
                    noMetas := false;
                    report "(samp_ram) Metacharacter found on 'B' side of RAM (addr) - not processed";                   
                end if metasInAddrA;
                
                noMetasAtAll: if (noMetas) then            
                   if (wea = "1") then
                      mem_array(to_integer(unsigned(addra))) := dina;
                      douta <= dina;
                   else
                      douta <= mem_array(to_integer(unsigned(addra)));
                   end if;
                end if noMetasAtAll;
            end if;            
         end process;
    
      process (clkb)
            variable noMetas : boolean := true;
         begin
            if rising_edge(clkb) then
               -- check for metacharacters in the address
               noMetas := true;
               metasInDataB: if (areMetaChars(dinb)) then
                  noMetas := false;
                  report "(samp_ram) Metacharacter found on 'B' side of RAM (data) - not processed";                  
               end if metasInDataB;
               
               metasInAddrB: if (areMetaChars(addrb)) then
                  noMetas := false;
                  report "(samp_ram) Metacharacter found on 'B' side of RAM (addr) - not processed";                  
               end if metasInAddrB;
               
               noMetasAtAll: if (noMetas) then
                   if (web = "1") then
                      mem_array(to_integer(unsigned(addrb))) := dinb;
                      doutb <= dinb;
                   else
                      doutb <= mem_array(to_integer(unsigned(addrb)));
                   end if;
               end if noMetasAtAll;
            end if;
         end process;
           
    end architecture behavioral;

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
