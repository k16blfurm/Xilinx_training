//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : tb_uart_rx.v
//  Parent   : Testcase
//  Children : tb_uart_driver, tb_resp_checker, tb_fifo, uart_rx
//
//  Description: 
//    This is the top level module for the testbench for the uart_rx module.
//
//  Parameters: 
//
//  Tasks:
//
//  Internal variables:
//
//  Notes       : 
//    
//
//  Multicycle and False Paths
//    None - this is a testbench file only, and is not intended for synthesis
//

// All times in this testbench are expressed in units of nanoseconds, with a 
// precision of 1ps increments
`timescale 1ns/1ps


module tb_uart_rx (); 

//***************************************************************************
// Parameter definitions
//***************************************************************************
  parameter FIFO_DEPTH=256;

  parameter BAUD_RATE = 115_200; 

  parameter CLOCK_RATE = 125_000_000;  // Clock period

  parameter PERIOD = 1_000_000_000.0/CLOCK_RATE;



//***************************************************************************
// Register declarations
//***************************************************************************
  
  reg               clk = 1'b0;

  wire              rst;

  wire              rxd_i;

  wire [7:0]        rx_data;
  wire              rx_data_rdy;
  wire              frm_err;

//***************************************************************************
// Code
//***************************************************************************

  // Generate the clock
  initial
  begin
    clk = 0;
    forever
    begin
      #(PERIOD/2.0) clk = ~clk;
    end // forever
  end // initial

  // Instantiate the reset generator
  
  tb_resetgen tb_resetgen_i0 (
    .clk      (clk),
    .reset    (rst)
  );

  // Instantiate the data fifo

  tb_fifo #(
    .WIDTH(8),
    .DEPTH(FIFO_DEPTH)
  ) tb_char_fifo_i0 ();

  // Instantiate the data generator

  tb_uart_driver #(
    .BAUD_RATE (BAUD_RATE)
  ) tb_uart_driver_i0 (
    .data_out  (rxd_i)
  );

  // Instantiate the data checker
  
  tb_resp_checker tb_resp_checker_i0 (
    .strobe      (rx_data_rdy),
    .frm_err     (frm_err),
    .data_in     (rx_data)
  );


  uart_rx #(
    .BAUD_RATE   (BAUD_RATE),
    .CLOCK_RATE  (CLOCK_RATE)
  ) uart_rx_i0 (
    .clk_rx      (clk),
    .rst_clk_rx  (rst),
    .rxd_i       (rxd_i),
    .rx_data     (rx_data),
    .rx_data_rdy (rx_data_rdy),
    .frm_err     (frm_err)

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
