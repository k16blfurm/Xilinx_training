//-----------------------------------------------------------------------------
//  
//  Copyright (c) 2009 Xilinx Inc.
//
//  Project  : Programmable Wave Generator
//  Module   : tb_fifo.v
//  Parent   : tb_uart_rx
//  Children : none
//
//  Description: 
//    This module is a generic FIFO for testbench applications. It stores data
//    internally in a verilog memory, and provides access to it via the tasks
//    and functions push, pop, is_empty, is_full.
//
//  Parameters: 
//    WIDTH        : Width of the data to be pushed and popped
//    DEPTH        : Number of entries. The FIFO will signal full when DEPTH-1
//                   entries are in the FIFO
//
//  Tasks:
//    push         : Pushes data into the FIFO - if the FIFO is full, an
//                   error message is generated
//
//  Functions:
//
//    is_empty     : Returns 1 if the FIFO is empty
//    pop          : Returns the element at the front of the FIFO
//
//
//  Internal variables:
//    reg [WIDTH-1:0] data [0:DEPTH-1] - the array for storing data
//    integer         head             - head pointer
//    integer         tail             - tail pointer
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


module tb_fifo ();

//***************************************************************************
// Parameter definitions
//***************************************************************************

  parameter         WIDTH        = 8;
  parameter         DEPTH        = 256;

//***************************************************************************
// Register declarations
//***************************************************************************

  reg [WIDTH-1:0] data [0:DEPTH-1]; // the array for storing data
  integer         head;             // head pointer
  integer         tail;             // tail pointer

//***************************************************************************
// Functions
//***************************************************************************

  function [31:0] next_ptr;
    input [31:0] ptr;
  begin
    next_ptr = (ptr + 1) % DEPTH;
  end
  endfunction

  function is_empty;
    input ignore; // A function must have at least one input
  begin
    is_empty = (head == tail);
  end
  endfunction

  function is_full;
    input ignore; // A function must have at least one input
  begin
    is_full = (next_ptr(head) == tail);
  end
  endfunction

  function [WIDTH-1:0] pop;
    input ignore; // A function must have at least one input
  begin
    if (is_empty(0))
    begin
      $display ("%t ERROR: Popping an empty FIFO in %m",$realtime);
      pop = {WIDTH{1'bx}};
    end
    else
    begin
      pop = data[tail];
      tail = next_ptr(tail);
    end
  end
  endfunction

//***************************************************************************
// Tasks
//***************************************************************************
  task push (
    input [WIDTH-1:0] new_data
  );
  begin
    if (is_full(0))
    begin
      $display ("%t ERROR: Pushing a full FIFO in %m",$realtime);
    end
    else
    begin
      data[head] = new_data;
      head = next_ptr(head);
    end
  end     // task
  endtask // full


//***************************************************************************
// Code
//***************************************************************************
  initial
  begin
    head = 0;
    tail = 0;
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
