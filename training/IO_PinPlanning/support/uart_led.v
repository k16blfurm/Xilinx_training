//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : uart_led.v
//  Parent   : None
//  Children : uart_rx.v led_ctl.v 
//
//  Description: 
//     Ties the UART receiver to the LED controller
//
//  Parameters:
//     None
//
//  Local Parameters:
//
//  Notes       : 
//
//  Multicycle and False Paths
//    None
//

`timescale 1ns/1ps


module uart_led (
  // Write side inputs
  input            clk_pin_p,      // Clock input (from pin)
  input            clk_pin_n,      //   - differential pair
  input            rst_pin,        // Active HIGH reset (from pin)

  input            btn_pin,        // Button to swap high and low bits

  input            rxd_pin,        // RS232 RXD pin - directly from pin

  output     [7:0] led_pins         // 8 LED outputs
);


//***************************************************************************
// Parameter definitions
//***************************************************************************

  parameter BAUD_RATE           = 115_200;   

  parameter CLOCK_RATE          = 125_000_000;

//***************************************************************************
// Reg declarations
//***************************************************************************

//***************************************************************************
// Wire declarations
//***************************************************************************

  // Pins

  wire             rst_i;
  wire             clk_i;
  wire             rxd_i;
  wire             btn_i;
  wire [7:0]       led_o;

  // Output of BUFG
  wire             clk_rx;

  // Synchronized reset
  wire             rst_clk_rx;

  // Synchronized button
  wire             btn_clk_rx;

  // Between uart_rx and led_ctl
  wire [7:0]       rx_data;      // Data output of uart_rx
  wire             rx_data_rdy;  // Data ready output of uart_rx
  
//***************************************************************************
// Code
//***************************************************************************

  IBUFGDS IBUFG_clk_i0   ( .I  (clk_pin_p),   
                           .IB (clk_pin_n),
                           .O  (clk_i)
                         );
  IBUF    IBUF_rxd_i0    (.I (rxd_pin),   .O (rxd_i));
  IBUF    IBUF_rst_i0    (.I (rst_pin),   .O (rst_i));
  IBUF    IBUF_btn_i0    (.I (btn_pin),   .O (btn_i));

  BUFG    BUFG_clk_rx_i0 (.I (clk_i), .O (clk_rx));

  // Metastability harden the rst - this is an asynchronous input to the
  // system (from a pushbutton), and is used in synchronous logic. Therefore
  // it must first be synchronized to the clock domain (clk_rx in this case)
  // prior to being used. A simple metastability hardener is appropriate here.
  meta_harden meta_harden_rst_i0 (
    .clk_dst      (clk_rx),
    .rst_dst      (1'b0),    // No reset on the hardener for reset!
    .signal_src   (rst_i),
    .signal_dst   (rst_clk_rx)
  );

  // And the button input
  meta_harden meta_harden_btn_i0 (
    .clk_dst      (clk_rx),
    .rst_dst      (rst_clk_rx),
    .signal_src   (btn_i),
    .signal_dst   (btn_clk_rx)
  );

  uart_rx #(
    .CLOCK_RATE   (CLOCK_RATE),
    .BAUD_RATE    (BAUD_RATE) 
  ) uart_rx_i0 (
    .clk_rx      (clk_rx),
    .rst_clk_rx  (rst_clk_rx),

    .rxd_i       (rxd_i),
    .rxd_clk_rx  (),
    
    .rx_data_rdy (rx_data_rdy),
    .rx_data     (rx_data),
    .frm_err     ()
  );

  led_ctl led_ctl_i0 (
    .clk_rx      (clk_rx),
    .rst_clk_rx  (rst_clk_rx),
    .btn_clk_rx  (btn_clk_rx),
    .rx_data     (rx_data),
    .rx_data_rdy (rx_data_rdy),
    .led_o       (led_o)
  );

  OBUF OBUF_led_i0 (.I(led_o[0]), .O(led_pins[0]));
  OBUF OBUF_led_i1 (.I(led_o[1]), .O(led_pins[1]));
  OBUF OBUF_led_i2 (.I(led_o[2]), .O(led_pins[2]));
  OBUF OBUF_led_i3 (.I(led_o[3]), .O(led_pins[3]));
  OBUF OBUF_led_i4 (.I(led_o[4]), .O(led_pins[4]));
  OBUF OBUF_led_i5 (.I(led_o[5]), .O(led_pins[5]));
  OBUF OBUF_led_i6 (.I(led_o[6]), .O(led_pins[6]));
  OBUF OBUF_led_i7 (.I(led_o[7]), .O(led_pins[7]));

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
