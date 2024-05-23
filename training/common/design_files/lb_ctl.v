//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : lb_ctl.v
//  Parent   : wave_gen
//  Children : debouncer.v
//
//  Description: 
//     Loopback controller.
//     Implements a debouncer on a slide switch, which is used to select
//     the output on the txd pin. When "off" (connected to gnd, so low), the 
//     normal transmit path is selected. When "on" (high), the rxd pin is
//     looped back to the txd pin with no intervening logic (a pure
//     combinational path)
//
//  Parameters:
//     CLOCK_RATE:     Clock rate (in Hz)
//     DEBOUNCE_TIME:  In SECONDS (real)
//
//  Local Parameters:
//
//  Notes       : 
//
//  Multicycle and False Paths
//     None

`timescale 1ns/1ps


module lb_ctl (
  input            clk_tx,          // Clock input
  input            rst_clk_tx,      // Active HIGH reset - synchronous to clk_tx
  
  input            lb_sel_i,        // Undebounced slide switch input
  
  input            txd_tx,          // Normal transmit data
  input            rxd_clk_rx,      // Receive data

  output reg       txd_o            // Transmit data to pin
);


//***************************************************************************
// Parameter definitions
//***************************************************************************

//  parameter 
//    CLOCK_RATE = 50_000_000,
//    DEBOUNCE_TIME = 0.004;    // The switch bounces for 2ms. Use 4ms for safety

//  localparam
//    CLOCK_PERIOD = 1.0/CLOCK_RATE,
//    FILTER       = (DEBOUNCE_TIME + CLOCK_PERIOD/2) / CLOCK_PERIOD;

  parameter FILTER = 200_000; // 0.004s at 50MHz
    

//***************************************************************************
// Reg declarations
//***************************************************************************


//***************************************************************************
// Wire declarations
//***************************************************************************

  wire         lb_sel_filt;          // Filtered value of the lb_sel switch

  wire         rxd_clk_tx;           // RXD re-synchronized to clk_tx
  
//***************************************************************************
// Code
//***************************************************************************

  // Instantiate the debouncer.

  debouncer #(
    .FILTER     (FILTER)
  ) debouncer_i0 (
    .clk        (clk_tx),
    .rst        (rst_clk_tx),
    .signal_in  (lb_sel_i),
    .signal_out (lb_sel_filt)
  );

  meta_harden meta_harden_rxd_i0 (
    .clk_dst    (clk_tx),
    .rst_dst    (rst_clk_tx),
    .signal_src (rxd_clk_rx),
    .signal_dst (rxd_clk_tx)
  );

  // Implement the loopback MUX
  always @(posedge clk_tx)
  begin
    if (rst_clk_tx)
    begin
      txd_o <= 1'b0;
    end
    else
    begin
      txd_o <= lb_sel_filt ? rxd_clk_tx : txd_tx;
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
