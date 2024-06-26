//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : uart_tx.v
//  Parent   : wave_gen.v 
//  Children : uart_tx_ctl.v uart_baud_gen.v .v
//
//  Description: 
//     Top level of the UART transmitter.
//     Brings together the baudrate generator and the actual UART transmit
//     controller
//
//  Parameters:
//     BAUD_RATE : Baud rate - set to 57,600bps by default
//     CLOCK_RATE: Clock rate - set to 50MHz by default
//
//  Local Parameters:
//
//  Notes       : 
//
//  Multicycle and False Paths
//     The uart_baud_gen module generates a 1-in-N pulse (where N is
//     determined by the baud rate and the system clock frequency), which
//     enables all flip-flops in the uart_tx_ctl module. Therefore, all paths
//     within uart_tx_ctl are multicycle paths, as long as N > 2 (which it
//     will be for all reasonable combinations of Baud rate and system
//     frequency).
//

`timescale 1ns/1ps


module uart_tx (
  input        clk_tx,          // Clock input
  input        rst_clk_tx,      // Active HIGH reset - synchronous to clk_tx

  input        char_fifo_empty, // Empty signal from char FIFO (FWFT)
  input  [7:0] char_fifo_dout,  // Data from the char FIFO
  output       char_fifo_rd_en, // Pop signal to the char FIFO

  output       txd_tx           // The transmit serial signal
);


//***************************************************************************
// Parameter definitions
//***************************************************************************

  parameter BAUD_RATE    = 57_600;              // Baud rate

  parameter CLOCK_RATE   = 50_000_000;

//***************************************************************************
// Reg declarations
//***************************************************************************

//***************************************************************************
// Wire declarations
//***************************************************************************

  wire             baud_x16_en;  // 1-in-N enable for uart_rx_ctl FFs
  
//***************************************************************************
// Code
//***************************************************************************

  uart_baud_gen #
  ( .BAUD_RATE  (BAUD_RATE),
    .CLOCK_RATE (CLOCK_RATE)
  ) uart_baud_gen_tx_i0 (
    .clk         (clk_tx),
    .rst         (rst_clk_tx),
    .baud_x16_en (baud_x16_en)
  );

  uart_tx_ctl uart_tx_ctl_i0 (
    .clk_tx	        (clk_tx),          // Clock input
    .rst_clk_tx	        (rst_clk_tx),      // Active HIGH reset

    .baud_x16_en        (baud_x16_en),     // 16x oversample enable

    .char_fifo_empty	(char_fifo_empty), // Empty signal from char FIFO (FWFT)
    .char_fifo_dout	(char_fifo_dout),  // Data from the char FIFO
    .char_fifo_rd_en	(char_fifo_rd_en), // Pop signal to the char FIFO

    .txd_tx	        (txd_tx)           // The transmit serial signal
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
