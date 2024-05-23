//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : uart_rx.v
//  Parent   : wave_gen.v and uart_led.v
//  Children : uart_rx_ctl.v uart_baud_gen.v meta_harden.v
//
//  Description: 
//     Top level of the UART receiver.
//     Brings together the metastability hardener for synchronizing the 
//     rxd pin, the baudrate generator for generating the proper x16 bit
//     enable, and the controller for the UART itself.
//     
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
//     enables all flip-flops in the uart_rx_ctl module. Therefore, all paths
//     within uart_rx_ctl are multicycle paths, as long as N > 2 (which it
//     will be for all reasonable combinations of Baud rate and system
//     frequency).
//

`timescale 1ns/1ps


module uart_rx (
  // Write side inputs
  input            clk_rx,       // Clock input
  input            rst_clk_rx,   // Active HIGH reset - synchronous to clk_rx

  input            rxd_i,        // RS232 RXD pin - Directly from pad
  output           rxd_clk_rx,   // RXD pin after synchronization to clk_rx

  output     [7:0] rx_data,      // 8 bit data output
                                 //  - valid when rx_data_rdy is asserted
  output           rx_data_rdy,  // Ready signal for rx_data
  output           frm_err       // The STOP bit was not detected
);


//***************************************************************************
// Parameter definitions
//***************************************************************************

  parameter BAUD_RATE    = 115_200;             // Baud rate
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

  /* Synchronize the RXD pin to the clk_rx clock domain. Since RXD changes
  * very slowly wrt. the sampling clock, a simple metastability hardener is
  * sufficient */
  meta_harden meta_harden_rxd_i0 (
    .clk_dst      (clk_rx),
    .rst_dst      (rst_clk_rx), 
    .signal_src   (rxd_i),
    .signal_dst   (rxd_clk_rx)
  );

  uart_baud_gen #
  ( .BAUD_RATE  (BAUD_RATE),
    .CLOCK_RATE (CLOCK_RATE)
  ) uart_baud_gen_rx_i0 (
    .clk         (clk_rx),
    .rst         (rst_clk_rx),
    .baud_x16_en (baud_x16_en)
  );

  uart_rx_ctl uart_rx_ctl_i0 (
    .clk_rx      (clk_rx),
    .rst_clk_rx  (rst_clk_rx),
    .baud_x16_en (baud_x16_en),

    .rxd_clk_rx  (rxd_clk_rx),
    
    .rx_data_rdy (rx_data_rdy),
    .rx_data     (rx_data),
    .frm_err     (frm_err)
  );

endmodule

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
