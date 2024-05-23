//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : debouncer.v
//  Parent   : lb_ctl
//  Children : meta_harden.v
//
//  Description: 
//     Simple switch debouncer. Filters out any transition that lasts less
//     than FILTER clocks long
//
//  Parameters:
//     FILTER:     Number of consecutive clocks of the same data required for
//                 a switch in the output
//
//  Notes       : 
//
//  Multicycle and False Paths
//     None

`timescale 1ns/1ps


module debouncer (
  input            clk,          // Clock input
  input            rst,          // Active HIGH reset - synchronous to clk
  
  input            signal_in,    // Undebounced signal
  output           signal_out    // Debounced signal
);

//***************************************************************************
// Function definitions
//***************************************************************************

`include "clogb2.txt"

//***************************************************************************
// Parameter definitions
//***************************************************************************

  parameter 
    FILTER = 200_000_000;     // Number of clocks required for a switch

  localparam
    RELOAD = FILTER - 1,
    FILTER_WIDTH = clogb2(FILTER);
    

//***************************************************************************
// Reg declarations
//***************************************************************************

  reg                    signal_out_reg; // Current output
  reg [FILTER_WIDTH-1:0] cnt;            // Counter

//***************************************************************************
// Wire declarations
//***************************************************************************

  wire signal_in_clk; // Synchronized to clk

//***************************************************************************
// Code
//***************************************************************************

  // signal_in is not synchronous to clk - use a metastability hardener to
  // synchronize it
  meta_harden meta_harden_signal_in_i0 (
    .clk_dst       (clk),
    .rst_dst       (rst),
    .signal_src    (signal_in),
    .signal_dst    (signal_in_clk)
  );

  always @(posedge clk)
  begin
    if (rst)
    begin
      signal_out_reg <= signal_in_clk;
      cnt            <= RELOAD;
    end
    else // !rst
    begin
      if (signal_in_clk == signal_out_reg)
      begin
        // The input is not different then the current filtered value.
        // Reload the counter so that it is ready to count down in case
        // it is different during the next clock
        cnt <= RELOAD;
      end
      else if (cnt == 0) // The counter expired and we are still not equal
      begin
        // Take the new value, and reload the counter
        signal_out_reg <= signal_in_clk;
        cnt            <= RELOAD;
      end
      else // The counter is not 0
      begin
        cnt <= cnt - 1'b1; // decrement it
      end
    end // if rst
  end // always

  assign signal_out = signal_out_reg;

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
