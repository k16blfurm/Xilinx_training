//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : tb_uart_monitor.v
//  Parent   : tb_uart_rx
//  Children : none
//
//  Description: 
//    This testbench module converts RS232 serial data to parallel data.
//    It is essentially a behavioral implementation of a UART receiver, 
//    receiving the RS232 protocol; START, 8 data bits (LSbit first), STOP,
//    and signaling that it has a complete character.
//
//  Parameters: 
//    BAUD_RATE        : Baud rate for the receiver
//
//  Tasks:
//    start            : Enables the checker
//
//  Functions:
//    None
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


module tb_uart_monitor (
  input            data_in,       // Incoming serial data
  output reg [7:0] char,          // Received character
  output reg       char_val       // Pulsed when char is valid
);

//***************************************************************************
// Parameter definitions
//***************************************************************************

  parameter BAUD_RATE = 57_600;

  localparam BIT_PER = (1_000_000_000.0)/BAUD_RATE;

//***************************************************************************
// Register declarations
//***************************************************************************

  reg     enabled = 1'b0;
  integer i;

//***************************************************************************
// Tasks
//***************************************************************************

  task start;
  begin
    enabled = 1'b1;
  end
  endtask
//***************************************************************************
// Code
//***************************************************************************

  initial
    char_val = 1'b0;

  always @(negedge data_in)
  begin
    if (enabled)
    begin
      // This should be the leading edge of the start bit
      #(BIT_PER * 1.5); // Wait until the middle of the first bit
      for (i = 0; i<=7; i=i+1)
      begin
        // Capture the bit
        char[i] = data_in;
        // Wait to the middle of the next
        #(BIT_PER);
      end
      // We should be in the middle of the stop
      if (data_in !== 1'b1)
      begin
        $display("%t ERROR Framing error detected in %m",$realtime());
      end
      // Pulse char_val for 1ns
      char_val = 1'b1;
      char_val <= #1 1'b0;
    end // if enabled
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
