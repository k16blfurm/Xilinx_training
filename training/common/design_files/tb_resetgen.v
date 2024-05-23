//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2008 Xilinx Inc.
//
//  Project  : Programmable Wave Generator (Testbench)
//  Module   : tb_reset.v
//  Parent   : tb_uart_rx
//  Children : none
//
//  Description: 
//    This is a general reset generation module. It should be instantiated
//    and connected to both the DUT
//
//
//  Parameters:
//    None
//
//  Notes       : 
//
//  Multicycle and False Paths
//    None - this is a testbench file only, and is not intended for synthesis
//

`timescale 1ns/1ps

module tb_resetgen (
  input      clk,
  output reg reset
);

//***************************************************************************
// Parameter definitions
//***************************************************************************

  

//***************************************************************************
// Register declarations
//***************************************************************************


//***************************************************************************
// Code
//***************************************************************************

  initial
  begin
    reset = 1'b0;
  end // initial

  task assert_reset (
    input [31:0] num_clk
  );
  begin
    $display("%t       Asserting reset for %d clocks",$realtime, num_clk);
    reset = 1'b1;
    repeat (num_clk) @(posedge clk);
    $display("%t       Deasserting reset",$realtime);
    reset = 1'b0;
  end
  endtask

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
