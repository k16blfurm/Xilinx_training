//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : out_ddr_flop.v
//  Parent   : Various
//  Children : None
//
//  Description: 
//    This is a wrapper around a basic DDR output flop.
//    A version of this module with identical ports exists for all target
//    technologies for this design (Spartan 3E and Virtex 5).
//    
//
//  Parameters:
//    None
//
//  Notes       : 
//
//  Multicycle and False Paths, Timing Exceptions
//     None
//

`timescale 1ns/1ps


module out_ddr_flop (
  input            clk,          // Destination clock
  input            rst,          // Reset - synchronous to destination clock
  input            d_rise,       // Data for the rising edge of clock
  input            d_fall,       // Data for the falling edge of clock
  output           q             // Double data rate output
);


//***************************************************************************
// Register declarations
//***************************************************************************

//***************************************************************************
// Code
//***************************************************************************

   // ODDRE1: Dedicated Dual Data Rate (DDR) Output Register
   //         Kintex UltraScale
   // Xilinx HDL Language Template, version 2013.4

   ODDRE1 #(
      .SRVAL(0)  // Initializes the ODDRE1 Flip-Flops to the specified value 
   )
   ODDR_inst (
      .Q(q),       // 1-bit output: Data output to IOB
      .C(clk),     // 1-bit input: High-speed clock input
      .D1(d_rise), // 1-bit input: Parallel data input 1
      .D2(d_fall), // 1-bit input: Parallel data input 2
      .SR(rst)     // 1-bit input: Active High Reset
   );

   // End of ODDRE1_inst instantiation

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
