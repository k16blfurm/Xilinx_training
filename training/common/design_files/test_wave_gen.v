//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : test_wave_gen
//  Parent   : None
//  Children : tb_wave_gen
//
//  Description: 
//    This module is a test for the wave generator
//
//  Parameters: 
//    None
//
//  Global variables:
//
//
//  Notes       : 
//
//  Multicycle and False Paths
//    None - this is a testbench file only, and is not intended for synthesis
//

// All times in this testbench are expressed in units of nanoseconds, with a 
// precision of 1ps increments
`timescale 1ns/1ps

module test_wave_gen (); // No ports

//***************************************************************************
// Parameter definitions
//***************************************************************************

//***************************************************************************
// Local Reg and Wires
//***************************************************************************
  
//***************************************************************************
// Code
//***************************************************************************

  // Instantiate the testbench
  tb_wave_gen tb ();

  initial
  begin

    $timeformat(-9,2," ns",14);
    
    #10;
    $display("%t       Starting simulation",$realtime);

    tb.init();
    
    // Wait 500us
    #100_000 ;

    tb.tb_cmd_gen_i0.set_nsamp(4);
    #500_000;
    tb.tb_cmd_gen_i0.set_speed(2);
    #500_000;
    tb.tb_cmd_gen_i0.set_prescale(33);
    #500_000;
    tb.tb_cmd_gen_i0.get_nsamp;
    #1_200_000;
    tb.tb_cmd_gen_i0.get_speed;
    #1_200_000;
    tb.tb_cmd_gen_i0.get_prescale;
    #1_200_000;

    #500_000;

    tb.tb_cmd_gen_i0.write(16'h0000,16'h1234);
    #500_000;
    tb.tb_cmd_gen_i0.write(16'h0001,16'h5678);
    #500_000;
    tb.tb_cmd_gen_i0.write(16'h0002,16'h9abc);
    #500_000;
    tb.tb_cmd_gen_i0.write(16'h0003,16'hdef0);
    #500_000;
    tb.tb_cmd_gen_i0.read(16'h0000);
    #1_200_000;
    tb.tb_cmd_gen_i0.read(16'h0001);
    #1_200_000;
    tb.tb_cmd_gen_i0.read(16'h0002);
    #1_200_000;
    tb.tb_cmd_gen_i0.read(16'h0003);
    #1_200_000;

    #500_000;

    tb.tb_cmd_gen_i0.do_cmd("*G","-OK");

    #1_000_000;
    

    // Check that the all data was received
    tb.tb_resp_checker_i0.is_done;

    $stop;
    $finish;

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
