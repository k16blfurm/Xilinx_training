//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : tb_resp_checker.v
//  Parent   : tb_uart_rx, tb_wave_gen
//  Children : none
//
//  Description: 
//    This testbench module checks the data received from the DUT against
//    the data stored in a FIFO
//
//  Parameters: 
//
//  Tasks:
//    start_chk        : Enables the checker
//
//  Functions:
//
//  Internal variables:
//    reg    enabled;
//    
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


module tb_resp_checker (
  input [7:0] data_in,  
  input       frm_err,
  input       strobe
);

//***************************************************************************
// Parameter definitions
//***************************************************************************


//***************************************************************************
// Register declarations
//***************************************************************************
  
  reg               enabled = 1'b0;

  reg  [7:0]        my_data;
  reg  [7:0]        char_received;

//***************************************************************************
// Tasks
//***************************************************************************

  // Enables the checker 
  task enable;
    input new_enable;
  begin
    enabled = new_enable;
  end
  endtask

  task is_done (
  );
  begin
    if (!tb.tb_char_fifo_i0.is_empty(1'b0))
      $display("%t ERROR Data FIFO is not empty when expected",$realtime);
  end
  endtask


//***************************************************************************
// Code
//***************************************************************************

  always @(posedge strobe)
  begin
    if (enabled)
    begin
      my_data = tb.tb_char_fifo_i0.pop(1'b0);
      char_received = data_in;
      #1; // Wait to ensure that the output data is valid after the rising
          // edge of the strobe
      if (data_in !== my_data)
      begin
         $display(
           "%t ERROR Character mismatch. Expected %x (%c), received %x (%c)",
           $realtime, my_data, my_data, data_in, data_in);
      end
      else
      begin
         $display("%t       Character received %x (%c)", $realtime, my_data,my_data);
      end
    end // if enabled
  end // always 

  always @(posedge frm_err)
  begin
    if (enabled)
    begin
       $display("%t ERROR Frame Error Detected", $realtime);
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
