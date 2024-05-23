//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : led_ctl.v
//  Parent   : uart_led.v
//  Children : None
//
//  Description: 
//     LED output generator
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


module led_ctl (
  // Write side inputs
  input            clk_rx,       // Clock input
  input            rst_clk_rx,   // Active HIGH reset - synchronous to clk_rx

  input            btn_clk_rx,   // Button to swap low and high pins

  input      [7:0] rx_data,      // 8 bit data output
                                 //  - valid when rx_data_rdy is asserted
  input            rx_data_rdy,  // Ready signal for rx_data

  output reg [7:0] led_o         // The LED outputs
);


//***************************************************************************
// Parameter definitions
//***************************************************************************

//***************************************************************************
// Reg declarations
//***************************************************************************

  reg             old_rx_data_rdy;
  reg  [7:0]      char_data;

//***************************************************************************
// Wire declarations
//***************************************************************************

//***************************************************************************
// Code
//***************************************************************************

  always @(posedge clk_rx)
  begin
    if (rst_clk_rx)
    begin
      old_rx_data_rdy <= 1'b0;
      char_data       <= 8'b0;
      led_o           <= 8'b0;
    end
    else
    begin
      // Capture the value of rx_data_rdy for edge detection
      old_rx_data_rdy <= rx_data_rdy;

      // If rising edge of rx_data_rdy, capture rx_data
      if (rx_data_rdy && !old_rx_data_rdy)
      begin
        char_data <= rx_data;
      end

      // Output the normal data or the data with high and low swapped
      if (btn_clk_rx)
        led_o <= {char_data[3:0],char_data[7:4]};
      else
        led_o <= char_data;
    end // if !rst
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
