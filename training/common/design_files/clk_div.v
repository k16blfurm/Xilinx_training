//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : clk_div.v
//  Parent   : wave_gen.v
//  Children : None
//
//  Description: 
//     This module is a programmable divider use for generating the sample
//     clock (clk_samp). It continuously counts down from pre_clk_tx-1 to
//     0, asserting en_clk_samp during the 0 count.
//
//     To ensure proper reset of the FFs running on the derived clock,
//     en_clk_samp is asserted during reset.
//
//  Parameters:
//
//  Notes       : 
//     pre_clk_tx must be at least 2 for this module to work. Since
//     it is not allowed to be <32 (by the parser), this is not a problem.
//
//  Multicycle and False Paths
//     None

`timescale 1ns/1ps


module clk_div (
  input             clk_tx,          // Clock input
  input             rst_clk_tx,      // Reset - synchronous to clk_tx
  
  input      [15:0] pre_clk_tx,      // Current divider
  output reg        en_clk_samp      // Clock enable for BUFG
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

  reg [15:0]             cnt;            // Counter

//***************************************************************************
// Wire declarations
//***************************************************************************
  
//***************************************************************************
// Code
//***************************************************************************

  always @(posedge clk_tx)
  begin
    if (rst_clk_tx)
    begin
      en_clk_samp    <= #5 1'b1;    // Enable the clock during reset
      cnt            <= 16'b0;
    end
    else // !rst
    begin
      // Since we want en_clk_samp to be 1 when cnt is 0 we compare
      // it to 1 on the clock before
      en_clk_samp <= #5 (cnt == 16'b1);

      if (cnt == 0) // The counter expired and we are still not equal
      begin
        cnt <= pre_clk_tx - 1'b1;
      end
      else // The counter is not 0
      begin
        cnt <= cnt - 1'b1; // decrement it
      end
    end // if rst
  end // always

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
