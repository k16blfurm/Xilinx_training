//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : clk_gen.v
//  Parent   : wave_gen.v
//  Children : None
//
//  Description: 
//     This module is the clock generator for the design.
//     It takes in a single clock input (nominally 200MHz), and generates
//     three output clocks using a single clock generator:
//        clk_rx   - running at the same frequency as the input clock
//        clk_tx   - either running at the same frequency as the input clock
//                   or running at 31/32 times the frequency
//        clk_samp - a decimated version of clk_tx using a BUFGCE (from
//                   the same MMCM output as clk_tx)
//                 - running at 1/prescale the frequency of clk_tx
//
//
//  Parameters:
//     None
//
//  Notes       : 
//
//  Multicycle and False Paths
//     None

`timescale 1ns/1ps


module clk_gen (
  input             clk_pin_p,       // Input clock pin - IBUFGDS is in core
  input             clk_pin_n,       //   - differential pair
  input             rst_i,           // Asynchronous input from IBUF

  input             rst_clk_tx,      // For clock divider
  
  input      [15:0] pre_clk_tx,      // Current divider

  output            clk_rx,          // Receive clock
  output            clk_tx,          // Transmit clock
  output            clk_samp,        // Sample clock

  output            en_clk_samp,     // Enable for clk_samp
  output            clock_locked     // Locked signal from MMCM
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

//***************************************************************************
// Wire declarations
//***************************************************************************
  
  
 
  
//***************************************************************************
// Code
//***************************************************************************

  // Instantiate the prescale divider

  clk_div clk_div_i0 (
    .clk_tx            (clk_tx),
    .rst_clk_tx        (rst_clk_tx),
    .pre_clk_tx        (pre_clk_tx),
    .en_clk_samp       (en_clk_samp)

  );

  // Instantiate clk_core - generated by the Clocking Wizard

  clk_core clk_core_i0 (
    .clk_in1_p          (clk_pin_p), 
    .clk_in1_n          (clk_pin_n), 
    .clk_out1           (clk_rx),
    .clk_out2           (clk_tx), 
    .reset              (rst_i), 
    .locked             (clock_locked)
  );

  

  BUFGCE #(
      .CE_TYPE("SYNC"),      // SYNC, ASYNC
      .IS_CE_INVERTED(1'b0), // Programmable inversion on CE
      .IS_I_INVERTED(1'b0)   // Programmable inversion on I
  )
  BUFGCE_clk_samp_i0 (
      .O(clk_samp),   // 1-bit output: Buffer
      .CE(en_clk_samp), // 1-bit input: Buffer enable
      .I(clk_tx)    // 1-bit input: Buffer
  );


  
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
