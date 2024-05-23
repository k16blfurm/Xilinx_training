//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : samp_ram.v
//  Parent   : wave_gen.v
//  Children : None
//
//  Description: 
//    This module infers the sample RAM - a 1024x16 dual port RAM
//
//  Parameters:
//     None
//
//  Notes       : 
//     This models a WRITE_FIRST memory
//
//  Multicycle and False Paths
//     None

`timescale 1ns/1ps


module samp_ram #(
  parameter DATA_WIDTH = 16,
  parameter ADDR_WIDTH = 10
 ) (
  // A port
  input                       clka,           // Clock
  input      [DATA_WIDTH-1:0] dina,           // Input data
  input      [ADDR_WIDTH-1:0] addra,          // Address
  input                       wea,            // Write enable
  output reg [DATA_WIDTH-1:0] douta,          // Output data
  // B port
  input                       clkb,           // Clock
  input      [DATA_WIDTH-1:0] dinb,           // Input data
  input      [ADDR_WIDTH-1:0] addrb,          // Address
  input                       web,            // Write enable
  output reg [DATA_WIDTH-1:0] doutb           // Output data
);

//***************************************************************************
// Function definitions
//***************************************************************************

//***************************************************************************
// Parameter definitions
//***************************************************************************

//***************************************************************************
// Reg declarations
//***************************************************************************

  reg [DATA_WIDTH-1:0] mem_array [0:(2**ADDR_WIDTH)-1];

//***************************************************************************
// Wire declarations
//***************************************************************************

//***************************************************************************
// Code
//***************************************************************************

  // A port operations
  always @(posedge clka)
  begin
    if (wea)
    begin
      mem_array[addra] <= dina;   // Synchronous write
      douta <= dina;
    end
    else
    begin
      douta <= mem_array[addra];     // Synchronous read
    end
  end

  // B port operations
  always @(posedge clkb)
  begin
    if (web)
    begin
      mem_array[addrb] <= dinb;   // Synchronous write
      doutb <= dinb;
    end
    else
    begin
      doutb <= mem_array[addrb];     // Synchronous read
    end
  end

endmodule

//<copyright-disclaimer-start>
//<copyright-disclaimer-start>
//  **************************************************************************************************************
//  * © 2023 Advanced Micro Devices, Inc. All rights reserved.                                                   *
//  * DISCLAIMER                                                                                                 *
//  * The information contained herein is for informational purposes only, and is subject to change              *
//  * without notice. While every precaution has been taken in the preparation of this document, it              *
//  * may contain technical inaccuracies, omissions and typographical errors, and AMD is under no                *
//  * obligation to update or otherwise correct this information.  Advanced Micro Devices, Inc. makes            *
//  * no representations or warranties with respect to the accuracy or completeness of the contents of           *
//  * this document, and assumes no liability of any kind, including the implied warranties of noninfringement,  *
//  * merchantability or fitness for particular purposes, with respect to the operation or use of AMD            *
//  * hardware, software or other products described herein.  No license, including implied or                   *
//  * arising by estoppel, to any intellectual property rights is granted by this document.  Terms and           *
//  * limitations applicable to the purchase or use of AMD’s products are as set forth in a signed agreement     *
//  * between the parties or in AMD's Standard Terms and Conditions of Sale. GD-18                               *
//  *                                                                                                            *
//  **************************************************************************************************************
//<copyright-disclaimer-end>
//<copyright-disclaimer-end>
