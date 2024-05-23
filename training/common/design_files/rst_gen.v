//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : rst_gen.v
//  Parent   : wave_gen.v
//  Children : reset_bridge.v
//
//  Description: 
//     This module is the reset generator for the design.
//     It takes the asynchronous reset in (from the IBUF), and generates
//     three synchronous resets - one on each clock domain.
//
//  Parameters:
//     None
//
//  Notes       : 
//
//  Multicycle and False Paths
//     None

`timescale 1ns/1ps


module rst_gen (
  input             clk_rx,          // Receive clock
  input             clk_tx,          // Transmit clock
  input             clk_samp,        // Sample clock

  input             rst_i,           // Asynchronous input - from IBUF
  input             clock_locked,    // Locked signal from clk_core

  output            rst_clk_rx,      // Reset, synchronized to clk_rx
  output            rst_clk_tx,      // Reset, synchronized to clk_tx
  output            rst_clk_samp     // Reset, synchronized to clk_samp
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

  wire int_rst;
  
//***************************************************************************
// Code
//***************************************************************************

  // Generate the internal reset - it is asserted whenever the reset pin
  // is asserted, or the DCM is not locked
  assign int_rst = rst_i || !clock_locked;

  // Instantiate the reset bridges

  // For clk_rx
  reset_bridge reset_bridge_clk_rx_i0 (
    .clk_dst   (clk_rx),
    .rst_in    (int_rst),
    .rst_dst   (rst_clk_rx)
  );

  // For clk_tx
  reset_bridge reset_bridge_clk_tx_i0 (
    .clk_dst   (clk_tx),
    .rst_in    (int_rst),
    .rst_dst   (rst_clk_tx)
  );
  

  // For clk_samp
  reset_bridge reset_bridge_clk_samp_i0 (
    .clk_dst   (clk_samp),
    .rst_in    (int_rst),
    .rst_dst   (rst_clk_samp)
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
